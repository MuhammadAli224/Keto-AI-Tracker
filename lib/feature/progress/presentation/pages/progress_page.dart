import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../owner/domain/entities/owner_profile.dart';
import '../../domain/entities/progress.dart';
import '../../domain/repository/progress_repository.dart';
import '../cubit/progress/progress_cubit.dart';
import '../widget/weekly_report_panel.dart';
import '../widget/weight_chart.dart';
import '../widget/weight_editor.dart';
import '../widget/weight_measurement_tile.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _weekly = false;

  String _error(ProgressError error) => switch (error) {
    ProgressError.denied => LocaleKeys.common_forbidden,
    ProgressError.connection => LocaleKeys.common_checkInternet,
    ProgressError.invalid => LocaleKeys.progress_invalidWeight,
    ProgressError.unexpected => LocaleKeys.common_unknownError,
  };

  Future<void> _edit({WeightEntry? entry}) async {
    final cubit = context.read<ProgressCubit>();
    final id = entry?.id ?? cubit.newId();
    final result = await showDialog<WeightEntry>(
      context: context,
      builder: (_) => WeightEditor(
        id: id,
        calendar: entry == null
            ? cubit.calendar
            : OwnerCalendar(entry.timezone),
        entry: entry,
      ),
    );
    if (mounted && result != null) await cubit.save(result);
  }

  Future<void> _delete(WeightEntry entry) async {
    final cubit = context.read<ProgressCubit>();
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(context.tr(LocaleKeys.progress_deleteWeight)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: AppText(context.tr(LocaleKeys.common_cancel)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: AppText(context.tr(LocaleKeys.common_delete)),
          ),
        ],
      ),
    );
    if (mounted && accepted == true) await cubit.delete(entry);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProgressCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.progress_title))),
      body: SafeArea(
        child: BlocBuilder<ProgressCubit, ProgressState>(
          builder: (context, state) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (state.writeError case final error?)
                AppText(context.tr(_error(error))),
              FilledButton(
                onPressed: () => _edit(),
                child: AppText(context.tr(LocaleKeys.progress_addWeight)),
              ),
              if (state.historyError case final error?) ...[
                AppText(context.tr(_error(error))),
                TextButton(
                  onPressed: cubit.loadWeights,
                  child: AppText(context.tr(LocaleKeys.common_retry)),
                ),
              ] else if (state.history case final history?) ...[
                AppText(context.tr(progressSyncKey(history.sync))),
                SegmentedButton<bool>(
                  segments: [
                    ButtonSegment(
                      value: false,
                      label: AppText(context.tr(LocaleKeys.progress_daily)),
                    ),
                    ButtonSegment(
                      value: true,
                      label: AppText(context.tr(LocaleKeys.progress_weekly)),
                    ),
                  ],
                  selected: {_weekly},
                  onSelectionChanged: (selection) =>
                      setState(() => _weekly = selection.single),
                ),
                const SizedBox(height: 12),
                WeightChart(
                  entries: history.entries,
                  calendar: cubit.calendar,
                  baseline: widget.profile.startingWeightKg,
                  weekly: _weekly,
                ),
                if (largeRecentWeightChange(history.entries))
                  AppText(context.tr(LocaleKeys.progress_largeChange)),
                for (final entry in history.entries)
                  WeightMeasurementTile(
                    entry: entry,
                    heightCm: widget.profile.heightCm,
                    onEdit: () => _edit(entry: entry),
                    onDelete: () => _delete(entry),
                  ),
              ] else
                const LinearProgressIndicator(),
              const Divider(),
              AppText(
                context.tr(LocaleKeys.progress_weekReport),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              TextButton(
                onPressed: state.reportLoading
                    ? null
                    : () => cubit.loadReport(widget.profile.waterMl),
                child: AppText(context.tr(LocaleKeys.common_refresh)),
              ),
              if (state.reportLoading) const LinearProgressIndicator(),
              if (state.reportError case final error?)
                AppText(context.tr(_error(error))),
              if (state.report case final report?)
                WeeklyReportPanel(report: report),
            ],
          ),
        ),
      ),
    );
  }
}
