import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../nutrition/nutrition_barrel.dart';
import '../../domain/entities/progress.dart';

class WeightEditor extends StatefulWidget {
  const WeightEditor({
    super.key,
    required this.id,
    required this.calendar,
    this.entry,
  });

  final String id;
  final OwnerCalendar calendar;
  final WeightEntry? entry;

  @override
  State<WeightEditor> createState() => _WeightEditorState();
}

class _WeightEditorState extends State<WeightEditor> {
  late final _kg = TextEditingController(text: widget.entry?.kg.toString());
  late final _notes = TextEditingController(text: widget.entry?.notes);
  late DateTime _day;
  late TimeOfDay _time;
  bool _invalid = false;

  @override
  void initState() {
    super.initState();
    final now = widget.entry?.measuredAt ?? DateTime.now();
    final local = widget.calendar.local(now);
    _day = widget.calendar.date(now);
    _time = TimeOfDay(hour: local.hour, minute: local.minute);
  }

  @override
  void dispose() {
    _kg.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _chooseDay() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _day,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (mounted && date != null) setState(() => _day = date);
  }

  Future<void> _chooseTime() async {
    final time = await showTimePicker(context: context, initialTime: _time);
    if (mounted && time != null) setState(() => _time = time);
  }

  void _save() {
    final kg = parseNutritionAmount(_kg.text);
    final instant = widget.calendar.instant(_day, _time.hour, _time.minute);
    final local = widget.calendar.local(instant);
    if (kg == null ||
        kg < 10 ||
        kg > 700 ||
        instant.isAfter(DateTime.now()) ||
        local.year != _day.year ||
        local.month != _day.month ||
        local.day != _day.day ||
        local.hour != _time.hour ||
        local.minute != _time.minute) {
      setState(() => _invalid = true);
      return;
    }
    final notes = _notes.text.trim();
    Navigator.pop(
      context,
      WeightEntry(
        id: widget.id,
        kg: kg,
        measuredAt: instant,
        timezone: widget.calendar.zone,
        notes: notes.isEmpty ? null : notes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: AppText(
      context.tr(
        widget.entry == null
            ? LocaleKeys.progress_addWeight
            : LocaleKeys.progress_editWeight,
      ),
    ),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _kg,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.progress_weightInput),
            ),
          ),
          TextField(
            controller: _notes,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.progress_notes),
            ),
          ),
          OutlinedButton(
            onPressed: _chooseDay,
            child: AppText(
              DateFormat.yMMMd(context.locale.toString()).format(_day),
            ),
          ),
          OutlinedButton(
            onPressed: _chooseTime,
            child: AppText(_time.format(context)),
          ),
          if (_invalid) AppText(context.tr(LocaleKeys.progress_invalidWeight)),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: AppText(context.tr(LocaleKeys.common_cancel)),
      ),
      FilledButton(
        onPressed: _save,
        child: AppText(context.tr(LocaleKeys.common_save)),
      ),
    ],
  );
}
