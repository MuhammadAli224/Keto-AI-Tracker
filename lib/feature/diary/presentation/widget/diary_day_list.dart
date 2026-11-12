import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../nutrition/nutrition_barrel.dart';
import '../../domain/entities/meal_entry.dart';
import '../cubit/diary/diary_cubit.dart';
import 'meal_editor.dart' show mealTypeKey;

class DiaryDayList extends StatelessWidget {
  const DiaryDayList({
    super.key,
    required this.state,
    required this.writeErrorKey,
    required this.onEdit,
    required this.onDelete,
  });

  final DiaryReady state;
  final String? writeErrorKey;
  final ValueChanged<MealEntry> onEdit;
  final ValueChanged<MealEntry> onDelete;

  @override
  Widget build(BuildContext context) {
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
        if (writeErrorKey case final key?) AppText(context.tr(key)),
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
                onTap: () => onEdit(meal),
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
                  onPressed: () => onDelete(meal),
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
