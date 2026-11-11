import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../domain/entities/owner_profile.dart';

enum _Field {
  birthYear(LocaleKeys.profile_birthYear),
  height(LocaleKeys.profile_height),
  startingWeight(LocaleKeys.profile_startingWeight),
  currentWeight(LocaleKeys.profile_currentWeight),
  windowStart(LocaleKeys.profile_windowStart),
  windowEnd(LocaleKeys.profile_windowEnd),
  timezone(LocaleKeys.profile_timezone),
  budget(LocaleKeys.profile_weeklyBudget),
  calories(LocaleKeys.profile_calories),
  protein(LocaleKeys.profile_protein),
  carbs(LocaleKeys.profile_carbs),
  fat(LocaleKeys.profile_fat),
  water(LocaleKeys.profile_water);

  const _Field(this.label);

  final String label;
}

const _activities = {
  'low': LocaleKeys.profile_activityLow,
  'moderate': LocaleKeys.profile_activityModerate,
  'high': LocaleKeys.profile_activityHigh,
};

const _languages = {
  'ar': LocaleKeys.profile_arabic,
  'en': LocaleKeys.profile_english,
};

class OwnerProfileForm extends StatefulWidget {
  const OwnerProfileForm({
    super.key,
    required this.profile,
    required this.sync,
    required this.saving,
    required this.errorKey,
    required this.onSave,
  });

  final OwnerProfile? profile;
  final ProfileSync sync;
  final bool saving;
  final String? errorKey;
  final ValueChanged<OwnerProfile> onSave;

  @override
  State<OwnerProfileForm> createState() => _OwnerProfileFormState();
}

class _OwnerProfileFormState extends State<OwnerProfileForm> {
  final _form = GlobalKey<FormState>();
  final _fields = {
    for (final field in _Field.values) field: TextEditingController(),
  };
  String? _activity;
  String? _locale;
  bool _dirty = false;

  @override
  void initState() {
    super.initState();
    _load(widget.profile);
  }

  @override
  void didUpdateWidget(covariant OwnerProfileForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.saving && !widget.saving && widget.errorKey == null) {
      _dirty = false;
    }
    if (!_dirty && oldWidget.profile != widget.profile) _load(widget.profile);
  }

  void _load(OwnerProfile? profile) {
    if (profile == null) return;
    final values = {
      _Field.birthYear: profile.birthYear,
      _Field.height: profile.heightCm,
      _Field.startingWeight: profile.startingWeightKg,
      _Field.currentWeight: profile.currentWeightKg,
      _Field.windowStart: profile.windowStart,
      _Field.windowEnd: profile.windowEnd,
      _Field.timezone: profile.timezone,
      _Field.budget: profile.weeklyBudgetJod,
      _Field.calories: profile.calories,
      _Field.protein: profile.proteinGrams,
      _Field.carbs: profile.carbsGrams,
      _Field.fat: profile.fatGrams,
      _Field.water: profile.waterMl,
    };
    for (final entry in values.entries) {
      _fields[entry.key]!.text = entry.value.toString();
    }
    _activity = _activities.containsKey(profile.activity)
        ? profile.activity
        : null;
    _locale = _languages.containsKey(profile.locale) ? profile.locale : null;
  }

  @override
  void dispose() {
    for (final controller in _fields.values) {
      controller.dispose();
    }
    super.dispose();
  }

  String _text(_Field field) => _fields[field]!.text.trim();

  String _numberText(String raw) => raw
      .replaceAllMapped(RegExp('[٠-٩۰-۹]'), (match) {
        final code = match[0]!.codeUnitAt(0);
        return (code >= 0x06F0 ? code - 0x06F0 : code - 0x0660).toString();
      })
      .replaceAll('٫', '.')
      .replaceAll(',', '.');

  double? _number(_Field field) => double.tryParse(_numberText(_text(field)));

  int? _integer(_Field field) => int.tryParse(_numberText(_text(field)));

  bool _valid(_Field field) {
    bool between(double? value, num low, num high) =>
        value != null && value.isFinite && value >= low && value <= high;
    final year = DateTime.now().year;
    return switch (field) {
      _Field.birthYear => between(
        _integer(field)?.toDouble(),
        year - 125,
        year,
      ),
      _Field.height => between(_number(field), 50, 300),
      _Field.startingWeight ||
      _Field.currentWeight => between(_number(field), 10, 700),
      _Field.windowStart || _Field.windowEnd => RegExp(
        r'^(?:[01][0-9]|2[0-3]):[0-5][0-9]$',
      ).hasMatch(_numberText(_text(field))),
      _Field.timezone =>
        _text(field).length <= 100 &&
            RegExp(
              r'^(?:UTC|[A-Za-z_+-]+(?:/[A-Za-z0-9_+-]+)+)$',
            ).hasMatch(_text(field)),
      _Field.budget => between(_number(field), 0, 100000),
      _Field.calories => between(_integer(field)?.toDouble(), 1, 20000),
      _Field.protein ||
      _Field.carbs ||
      _Field.fat => between(_number(field), 0, 5000),
      _Field.water => between(_integer(field)?.toDouble(), 1, 30000),
    };
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    _dirty = true;
    widget.onSave(
      OwnerProfile(
        birthYear: _integer(_Field.birthYear)!,
        heightCm: _number(_Field.height)!,
        startingWeightKg: _number(_Field.startingWeight)!,
        currentWeightKg: _number(_Field.currentWeight)!,
        activity: _activity!,
        windowStart: _numberText(_text(_Field.windowStart)),
        windowEnd: _numberText(_text(_Field.windowEnd)),
        locale: _locale!,
        timezone: _text(_Field.timezone),
        weeklyBudgetJod: _number(_Field.budget)!,
        calories: _integer(_Field.calories)!,
        proteinGrams: _number(_Field.protein)!,
        carbsGrams: _number(_Field.carbs)!,
        fatGrams: _number(_Field.fat)!,
        waterMl: _integer(_Field.water)!,
        confirmationVersion: widget.profile?.confirmationVersion ?? 0,
      ),
    );
  }

  Widget _input(BuildContext context, _Field field) {
    final time = field == _Field.windowStart || field == _Field.windowEnd;
    final timezone = field == _Field.timezone;
    return TextFormField(
      controller: _fields[field],
      enabled: !widget.saving,
      keyboardType: timezone || time
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: context.tr(field.label)),
      onChanged: (_) => setState(() => _dirty = true),
      validator: (_) => _valid(field)
          ? null
          : context.tr(
              time
                  ? LocaleKeys.profile_invalidTime
                  : timezone
                  ? LocaleKeys.profile_invalidTimezone
                  : LocaleKeys.common_notValidNumberHint,
            ),
    );
  }

  Widget _select(
    BuildContext context, {
    required String label,
    required String? value,
    required Map<String, String> choices,
    required ValueChanged<String?> set,
  }) {
    return DropdownButtonFormField<String>(
      key: ValueKey((label, value)),
      initialValue: value,
      decoration: InputDecoration(labelText: context.tr(label)),
      items: [
        for (final entry in choices.entries)
          DropdownMenuItem(
            value: entry.key,
            child: AppText(context.tr(entry.value)),
          ),
      ],
      onChanged: widget.saving
          ? null
          : (value) => setState(() {
              _dirty = true;
              set(value);
            }),
      validator: (value) =>
          value == null ? context.tr(LocaleKeys.common_emptyFieldHint) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bmi = _valid(_Field.height) && _valid(_Field.currentWeight)
        ? OwnerProfile.calculateBmi(
            _number(_Field.currentWeight)!,
            _number(_Field.height)!,
          )
        : null;
    final syncLabel = switch (widget.sync) {
      ProfileSync.cached => LocaleKeys.profile_cached,
      ProfileSync.pending => LocaleKeys.profile_pending,
      ProfileSync.confirmed => LocaleKeys.profile_synced,
    };
    return Form(
      key: _form,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppText(context.tr(syncLabel)),
          if (widget.errorKey case final key?) AppText(context.tr(key)),
          if (widget.saving) const LinearProgressIndicator(),
          for (final field in _Field.values) _input(context, field),
          _select(
            context,
            label: LocaleKeys.profile_activity,
            value: _activity,
            choices: _activities,
            set: (value) => _activity = value,
          ),
          _select(
            context,
            label: LocaleKeys.profile_locale,
            value: _locale,
            choices: _languages,
            set: (value) => _locale = value,
          ),
          if (bmi != null)
            AppText(
              context.tr(
                LocaleKeys.profile_bmi,
                args: [
                  NumberFormat('0.0', context.locale.toString()).format(bmi),
                ],
              ),
            ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: widget.saving ? null : _save,
            child: AppText(context.tr(LocaleKeys.common_save)),
          ),
        ],
      ),
    );
  }
}
