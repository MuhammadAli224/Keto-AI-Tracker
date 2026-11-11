import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/time/owner_calendar.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../../nutrition/nutrition_barrel.dart';
import '../../../domain/entities/meal_entry.dart';
import '../../../domain/repository/diary_repository.dart';
import '../cubit/diary_cubit.dart';
import '../widget/meal_editor.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key, this.withPhoto});

  final Widget Function(String mealId, Widget editor)? withPhoto;

  String _error(DiaryError error) => switch (error) {
    DiaryError.denied => LocaleKeys.common_forbidden,
    DiaryError.invalid => LocaleKeys.diary_invalidMeal,
    DiaryError.connection => LocaleKeys.common_checkInternet,
    DiaryError.unexpected => LocaleKeys.common_unknownError,
  };

  Future<void> _chooseDay(BuildContext context, DateTime date) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (!context.mounted || picked == null) return;
    await context.read<DiaryCubit>().selectDay(picked);
  }

  Future<void> _edit(
    BuildContext context,
    DateTime date, {
    MealEntry? meal,
  }) async {
    final diary = context.read<DiaryCubit>();
    final catalog = context.read<CatalogCubit>().state;
    final id = meal?.id ?? diary.newId();
    final result = await Navigator.of(context).push<MealEntry>(
      MaterialPageRoute(
        builder: (_) {
          final editor = MealEditor(
            id: id,
            date: date,
            calendar: meal == null
                ? diary.calendar
                : OwnerCalendar(meal.timezone),
            meal: meal,
            photoEnabled: withPhoto != null,
            foods: catalog is CatalogReady ? catalog.foods : const [],
          );
          return withPhoto?.call(id, editor) ?? editor;
        },
      ),
    );
    if (!context.mounted || result == null) return;
    await diary.save(result);
  }

  Future<void> _delete(BuildContext context, MealEntry meal) async {
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText(context.tr(LocaleKeys.diary_deleteMeal)),
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
    if (!context.mounted || accepted != true) return;
    await context.read<DiaryCubit>().delete(meal);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<DiaryCubit, DiaryState>(
    builder: (context, state) => Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.diary_title))),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                spacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _chooseDay(context, state.date),
                    icon: const Icon(Icons.calendar_today_outlined),
                    label: AppText(
                      DateFormat.yMMMd(
                        context.locale.toString(),
                      ).format(state.date),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: state is DiaryReady
                        ? () => _edit(context, state.date)
                        : null,
                    icon: const Icon(Icons.add),
                    label: AppText(context.tr(LocaleKeys.diary_addMeal)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: switch (state) {
                DiaryLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                DiaryFailed(:final error) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(context.tr(_error(error))),
                      TextButton(
                        onPressed: () =>
                            context.read<DiaryCubit>().selectDay(state.date),
                        child: AppText(context.tr(LocaleKeys.common_retry)),
                      ),
                    ],
                  ),
                ),
                DiaryReady() => _buildDay(context, state),
              },
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildDay(BuildContext context, DiaryReady state) {
    final entries = state.day.entries
        .where((meal) => meal.status != MealStatus.deleted)
        .toList();
    final sync = state.awaitingWrites ? DiarySync.pending : state.day.sync;
    final syncKey = switch (sync) {
      DiarySync.cached => LocaleKeys.diary_cached,
      DiarySync.pending => LocaleKeys.diary_pending,
      DiarySync.confirmed => LocaleKeys.diary_synced,
    };
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppText(context.tr(syncKey)),
        if (state.writeError case final error?)
          AppText(context.tr(_error(error))),
        if (entries.isEmpty)
          AppText(
            context.tr(
              sync == DiarySync.cached
                  ? LocaleKeys.diary_noCachedMeals
                  : LocaleKeys.diary_noMeals,
            ),
          )
        else ...[
          AppText(
            context.tr(LocaleKeys.diary_dayTotal),
            fontWeight: FontWeight.bold,
          ),
          NutrientSummary(state.day.totals),
          const Divider(),
          for (final meal in entries)
            Card(
              child: ListTile(
                onTap: () => _edit(context, state.date, meal: meal),
                title: AppText(context.tr(mealTypeKey(meal.type))),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      DateFormat.Hm(context.locale.toString()).format(
                        OwnerCalendar(meal.timezone).local(meal.eatenAtUtc),
                      ),
                    ),
                    if (meal.status == MealStatus.draft)
                      AppText(context.tr(LocaleKeys.diary_draft)),
                    if (meal.sync == DiarySync.pending)
                      AppText(context.tr(LocaleKeys.diary_pending)),
                    NutrientSummary(meal.totals),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () => _delete(context, meal),
                  tooltip: context.tr(LocaleKeys.diary_deleteMeal),
                  icon: const Icon(Icons.delete_outline),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
