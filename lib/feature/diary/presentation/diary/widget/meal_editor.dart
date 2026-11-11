import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/time/owner_calendar.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../../ai_assistance/ai_assistance_barrel.dart';
import '../../../../meal_photo/meal_photo_barrel.dart';
import '../../../../nutrition/nutrition_barrel.dart';
import '../../../domain/entities/meal_entry.dart';

String mealTypeKey(MealType type) => switch (type) {
  MealType.breakfast => LocaleKeys.diary_breakfast,
  MealType.lunch => LocaleKeys.diary_lunch,
  MealType.dinner => LocaleKeys.diary_dinner,
  MealType.snack => LocaleKeys.diary_snack,
};

class MealEditor extends StatefulWidget {
  const MealEditor({
    super.key,
    required this.id,
    required this.date,
    required this.calendar,
    required this.foods,
    this.meal,
    this.photoEnabled = false,
  });

  final String id;
  final DateTime date;
  final OwnerCalendar calendar;
  final List<Food> foods;
  final MealEntry? meal;
  final bool photoEnabled;

  @override
  State<MealEditor> createState() => _MealEditorState();
}

class _MealEditorState extends State<MealEditor> {
  late DateTime _date;
  late TimeOfDay _time;
  late MealType _type;
  late final List<Serving> _servings;
  bool _invalidTime = false;

  @override
  void initState() {
    super.initState();
    final meal = widget.meal;
    final time = widget.calendar.local(meal?.eatenAtUtc ?? DateTime.now());
    _date = meal == null ? widget.date : widget.calendar.date(meal.eatenAtUtc);
    _time = TimeOfDay(hour: time.hour, minute: time.minute);
    _type = meal?.type ?? MealType.breakfast;
    _servings = [...?meal?.servings];
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (mounted && date != null) {
      setState(() {
        _date = date;
        _invalidTime = false;
      });
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(context: context, initialTime: _time);
    if (mounted && time != null) {
      setState(() {
        _time = time;
        _invalidTime = false;
      });
    }
  }

  Future<void> _addFood({double? estimatedGrams}) async {
    final food = await showModalBottomSheet<Food>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          children: [
            for (final food in widget.foods)
              ListTile(
                title: AppText(foodDisplayName(context, food)),
                subtitle: AppText(foodSourceLabel(context, food)),
                onTap: () => Navigator.pop(context, food),
              ),
          ],
        ),
      ),
    );
    if (!mounted || food == null) return;
    final item = await showDialog<Serving>(
      context: context,
      builder: (_) =>
          ServingDialog(food: food, select: true, initialGrams: estimatedGrams),
    );
    if (mounted && item != null && _servings.length < 50) {
      setState(() => _servings.add(item));
    }
  }

  Future<void> _save(MealStatus status) async {
    final instant = widget.calendar.instant(_date, _time.hour, _time.minute);
    final local = widget.calendar.local(instant);
    if (local.year != _date.year ||
        local.month != _date.month ||
        local.day != _date.day ||
        local.hour != _time.hour ||
        local.minute != _time.minute) {
      setState(() => _invalidTime = true);
      return;
    }
    var localPhoto = widget.meal?.localImageRef;
    if (widget.photoEnabled) {
      try {
        localPhoto = await context.read<MealPhotoCubit>().commit();
      } catch (_) {
        return;
      }
    }
    if (!mounted) return;
    Navigator.pop(
      context,
      MealEntry(
        id: widget.id,
        dayKey: widget.calendar.dayKey(widget.calendar.date(instant)),
        eatenAtUtc: instant,
        timezone: widget.calendar.zone,
        type: _type,
        status: status,
        servings: List.of(_servings),
        localImageRef: localPhoto,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final grams = NumberFormat('0.0', locale);
    final photo = widget.photoEnabled
        ? context.watch<MealPhotoCubit>().state
        : null;
    final canSave = photo == null || (photo.ready && !photo.busy);
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          context.tr(
            widget.meal == null
                ? LocaleKeys.diary_addMeal
                : LocaleKeys.diary_editMeal,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton(
                  onPressed: _pickDate,
                  child: AppText(DateFormat.yMMMd(locale).format(_date)),
                ),
                OutlinedButton(
                  onPressed: _pickTime,
                  child: AppText(_time.format(context)),
                ),
              ],
            ),
            AppText(widget.calendar.zone),
            if (_invalidTime) AppText(context.tr(LocaleKeys.diary_invalidTime)),
            DropdownButtonFormField<MealType>(
              initialValue: _type,
              decoration: InputDecoration(
                labelText: context.tr(LocaleKeys.diary_mealType),
              ),
              items: [
                for (final type in MealType.values)
                  DropdownMenuItem(
                    value: type,
                    child: AppText(context.tr(mealTypeKey(type))),
                  ),
              ],
              onChanged: (type) {
                if (type != null) setState(() => _type = type);
              },
            ),
            if (widget.photoEnabled)
              BlocListener<MealPhotoCubit, MealPhotoState>(
                listenWhen: (previous, current) =>
                    previous.photo?.ref != current.photo?.ref ||
                    previous.upload != current.upload ||
                    previous.status != current.status,
                listener: (context, _) =>
                    context.read<AiAssistanceCubit>().clear(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const MealPhotoPanel(),
                    MealEstimatePanel(
                      mealId: widget.id,
                      photoReady:
                          widget.meal != null &&
                          photo?.status == MealPhotoStatus.uploaded &&
                          photo?.upload == true &&
                          photo?.photo != null &&
                          photo?.busy == false,
                      isCurrentPhoto: () {
                        final current = context.read<MealPhotoCubit>().state;
                        return current.photo?.ref == photo?.photo?.ref &&
                            current.upload &&
                            !current.busy &&
                            current.status == MealPhotoStatus.uploaded;
                      },
                      onSelect: widget.foods.isEmpty || _servings.length >= 50
                          ? null
                          : (grams) => _addFood(estimatedGrams: grams),
                    ),
                  ],
                ),
              ),
            for (var index = 0; index < _servings.length; index++)
              ListTile(
                title: AppText(_servings[index].name),
                subtitle: AppText(
                  context.tr(
                    LocaleKeys.nutrition_gramsAmount,
                    args: [grams.format(_servings[index].edibleGrams)],
                  ),
                ),
                trailing: IconButton(
                  tooltip: context.tr(LocaleKeys.common_delete),
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() => _servings.removeAt(index)),
                ),
              ),
            TextButton.icon(
              onPressed: widget.foods.isEmpty || _servings.length >= 50
                  ? null
                  : _addFood,
              icon: const Icon(Icons.add),
              label: AppText(context.tr(LocaleKeys.nutrition_addFood)),
            ),
            if (widget.foods.isEmpty)
              AppText(context.tr(LocaleKeys.diary_catalogUnavailable)),
            if (_servings.isNotEmpty) NutrientSummary(totalMeal(_servings)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton(
                  onPressed: canSave ? () => _save(MealStatus.draft) : null,
                  child: AppText(context.tr(LocaleKeys.diary_saveDraft)),
                ),
                FilledButton(
                  onPressed: !canSave || _servings.isEmpty
                      ? null
                      : () => _save(MealStatus.confirmed),
                  child: AppText(context.tr(LocaleKeys.diary_confirmMeal)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
