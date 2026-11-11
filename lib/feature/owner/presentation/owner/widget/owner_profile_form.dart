import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/time/owner_calendar.dart';
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
  'veryLow': LocaleKeys.profile_activityVeryLow,
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
    this.setup = false,
    this.preview = false,
  });

  final OwnerProfile? profile;
  final ProfileSync sync;
  final bool saving;
  final String? errorKey;
  final ValueChanged<OwnerProfile>? onSave;
  final bool setup;
  final bool preview;

  bool get maySave =>
      onSave != null &&
      !saving &&
      (profile != null || sync == ProfileSync.confirmed);

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
  bool _conflicted = false;

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
    if (oldWidget.profile != widget.profile) {
      if (!_dirty) {
        _load(widget.profile);
      } else if (!oldWidget.saving &&
          oldWidget.profile == null &&
          widget.profile != null) {
        _conflicted = true;
      }
    }
  }

  void _load(OwnerProfile? profile) {
    if (profile == null) {
      for (final controller in _fields.values) {
        controller.clear();
      }
      _activity = null;
      _locale = null;
      return;
    }
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
      if (!_valid(entry.key)) _fields[entry.key]!.clear();
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
      _Field.timezone => OwnerCalendar.supports(_text(field)),
      _Field.budget => between(_number(field), 0, 100000),
      _Field.calories => between(_integer(field)?.toDouble(), 1, 20000),
      _Field.protein ||
      _Field.carbs ||
      _Field.fat => between(_number(field), 0, 5000),
      _Field.water => between(_integer(field)?.toDouble(), 0, 30000),
    };
  }

  bool get _validDraft =>
      _activity != null && _locale != null && _Field.values.every(_valid);

  Future<void> _save() async {
    if (!_validDraft || _conflicted || !_form.currentState!.validate()) return;
    final draft = OwnerProfile(
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
      confirmationVersion: OwnerProfile.currentConfirmationVersion,
      confirmedAt: widget.profile?.confirmedAt,
    );
    if (widget.setup || widget.preview) {
      final confirmed = await _review();
      if (!mounted || !confirmed) return;
    }
    if (!widget.maySave || _conflicted) return;
    _dirty = true;
    widget.onSave?.call(draft);
  }

  Future<bool> _review() async {
    final details = {
      for (final field in _Field.values) field.label: _text(field),
      LocaleKeys.profile_activity: context.tr(_activities[_activity]!),
      LocaleKeys.profile_locale: context.tr(_languages[_locale]!),
    };
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(context.tr(LocaleKeys.profile_review)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final entry in details.entries) ...[
                AppText(context.tr(entry.key), fontWeight: FontWeight.w600),
                AppText(entry.value),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: AppText(context.tr(LocaleKeys.common_back)),
          ),
          if (!widget.preview)
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: AppText(context.tr(LocaleKeys.common_confirm)),
            ),
        ],
      ),
    );
    return accepted == true;
  }

  Widget _input(BuildContext context, _Field field) {
    final time = field == _Field.windowStart || field == _Field.windowEnd;
    final timezone = field == _Field.timezone;
    final hint = switch (field) {
      _Field.water => LocaleKeys.profile_waterSuggestion,
      _Field.windowStart => LocaleKeys.profile_windowStartSuggestion,
      _Field.windowEnd => LocaleKeys.profile_windowEndSuggestion,
      _ => null,
    };
    return TextFormField(
      controller: _fields[field],
      enabled: !widget.saving,
      keyboardType: timezone || time
          ? TextInputType.text
          : const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: context.tr(field.label),
        helperText: hint == null ? null : context.tr(hint),
        helperMaxLines: 2,
      ),
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
      _ when widget.preview => LocaleKeys.profile_previewNotice,
      ProfileSync.cached when widget.profile == null =>
        LocaleKeys.profile_localDraft,
      ProfileSync.cached => LocaleKeys.profile_cached,
      ProfileSync.pending => LocaleKeys.profile_pending,
      ProfileSync.confirmed when widget.profile == null =>
        LocaleKeys.profile_missing,
      ProfileSync.confirmed => LocaleKeys.profile_synced,
    };
    Widget heading(String key) => Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: AppText(context.tr(key), fontWeight: FontWeight.bold),
    );
    return Form(
      key: _form,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AppText(context.tr(syncLabel)),
          if (widget.errorKey case final key?) AppText(context.tr(key)),
          if (widget.saving) const LinearProgressIndicator(),
          if (_conflicted) ...[
            AppText(context.tr(LocaleKeys.profile_draftConflict)),
            TextButton(
              onPressed: () => setState(() {
                _dirty = false;
                _conflicted = false;
                _load(widget.profile);
              }),
              child: AppText(context.tr(LocaleKeys.profile_loadSaved)),
            ),
          ],
          heading(LocaleKeys.profile_measurements),
          for (final field in [
            _Field.birthYear,
            _Field.height,
            _Field.startingWeight,
            _Field.currentWeight,
          ])
            _input(context, field),
          if (bmi != null)
            AppText(
              context.tr(
                LocaleKeys.profile_bmi,
                args: [
                  NumberFormat('0.0', context.locale.toString()).format(bmi),
                ],
              ),
            ),
          AppText(context.tr(LocaleKeys.profile_bmiExplanation)),
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
          _input(context, _Field.timezone),
          heading(LocaleKeys.profile_nutrition),
          for (final field in [
            _Field.calories,
            _Field.protein,
            _Field.carbs,
            _Field.fat,
          ])
            _input(context, field),
          heading(LocaleKeys.profile_fastingWater),
          for (final field in [
            _Field.windowStart,
            _Field.windowEnd,
            _Field.water,
          ])
            _input(context, field),
          heading(LocaleKeys.profile_budget),
          _input(context, _Field.budget),
          const SizedBox(height: 20),
          FilledButton(
            onPressed:
                (widget.maySave || widget.preview) &&
                    !_conflicted &&
                    _validDraft
                ? _save
                : null,
            child: AppText(
              context.tr(
                widget.setup || widget.preview
                    ? LocaleKeys.common_continueAction
                    : LocaleKeys.common_save,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
