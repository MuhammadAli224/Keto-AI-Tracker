import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/routes.dart';
import '../../../core/domain/jod.dart';
import '../../../core/widget/app_widget/app_text.dart';
import '../../../generated/app_strings.g.dart';
import '../../nutrition/nutrition_barrel.dart';
import '../domain/budget.dart';
import 'budget_cubit.dart';
import 'budget_dialogs.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key, required this.weeklyFils});

  final int weeklyFils;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BudgetCubit>();
    final state = cubit.state;
    final journal = state.journal;
    final days = List.generate(7, (i) => state.start.add(Duration(days: i)));
    final date = DateFormat.MMMd(context.locale.toString());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: AppText(context.tr(LocaleKeys.budget_title)),
          bottom: TabBar(
            tabs: [
              Tab(child: AppText(context.tr(LocaleKeys.budget_expenses))),
              Tab(child: AppText(context.tr(LocaleKeys.budget_prices))),
              Tab(child: AppText(context.tr(LocaleKeys.budget_mealDraft))),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    tooltip: context.tr(LocaleKeys.budget_previousWeek),
                    onPressed: () => cubit.shiftWeek(-1),
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Expanded(
                    child: AppText(
                      '${date.format(days.first)} – ${date.format(days.last)} ${days.last.year}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    tooltip: context.tr(LocaleKeys.budget_nextWeek),
                    onPressed: () => cubit.shiftWeek(1),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              if (state.feedback != null)
                TextButton(
                  onPressed: cubit.reload,
                  child: AppText(context.tr(LocaleKeys.budget_loadFailed)),
                ),
              if (state.busy) const LinearProgressIndicator(),
              if (journal != null)
                Expanded(
                  child: TabBarView(
                    children: [
                      _Expenses(
                        journal: journal,
                        days: days,
                        weeklyFils: weeklyFils,
                      ),
                      _Prices(prices: journal.prices),
                      _Plan(days: days, draft: journal.plan),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String _money(BuildContext context, int fils) => NumberFormat.simpleCurrency(
  name: 'JOD',
  locale: context.locale.toString(),
  decimalDigits: 3,
).format(fils / 1000);

class _Expenses extends StatelessWidget {
  const _Expenses({
    required this.journal,
    required this.days,
    required this.weeklyFils,
  });

  final BudgetJournal journal;
  final List<DateTime> days;
  final int weeklyFils;

  Future<void> _edit(
    BuildContext context,
    DateTime day, {
    FoodExpense? expense,
  }) async {
    final draft = await showDialog<ExpenseDraft>(
      context: context,
      builder: (_) => ExpenseDialog(days: days, date: day, expense: expense),
    );
    if (context.mounted && draft != null) {
      await context.read<BudgetCubit>().saveExpense(
        previous: expense,
        day: draft.date,
        description: draft.description,
        fils: draft.fils,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BudgetCubit>();
    final dates = {for (final day in days) cubit.calendar.dayKey(day): day};
    final expenses =
        journal.expenses
            .where((entry) => dates.containsKey(entry.dayKey))
            .toList()
          ..sort((a, b) {
            final byDay = b.dayKey.compareTo(a.dayKey);
            return byDay == 0
                ? b.recordedAtUtc.compareTo(a.recordedAtUtc)
                : byDay;
          });
    final spent = expenses.fold(0, (total, entry) => total + entry.fils);
    final remaining = weeklyFils - spent;
    final today = cubit.calendar.date(DateTime.now());
    final busy = cubit.state.busy;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppText(
          context.tr(
            LocaleKeys.budget_approved,
            args: [_money(context, weeklyFils)],
          ),
        ),
        AppText(
          context.tr(LocaleKeys.budget_spent, args: [_money(context, spent)]),
        ),
        AppText(
          context.tr(
            remaining < 0
                ? LocaleKeys.budget_over
                : LocaleKeys.budget_remaining,
            args: [_money(context, remaining.abs())],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton(
            onPressed: () => context.push(AppRoutes.profile),
            child: AppText(context.tr(LocaleKeys.budget_editLimit)),
          ),
        ),
        FilledButton.icon(
          onPressed: busy
              ? null
              : () => _edit(context, days.contains(today) ? today : days.first),
          icon: const Icon(Icons.add),
          label: AppText(context.tr(LocaleKeys.budget_addExpense)),
        ),
        for (final expense in expenses)
          ListTile(
            title: AppText(expense.description),
            subtitle: AppText(
              DateFormat.MMMEd(
                context.locale.toString(),
              ).format(dates[expense.dayKey]!),
            ),
            onTap: busy
                ? null
                : () =>
                      _edit(context, dates[expense.dayKey]!, expense: expense),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(_money(context, expense.fils)),
                IconButton(
                  tooltip: context.tr(LocaleKeys.common_delete),
                  onPressed: busy
                      ? null
                      : () async {
                          final approved = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: AppText(
                                context.tr(LocaleKeys.budget_deleteExpense),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: AppText(
                                    context.tr(LocaleKeys.common_cancel),
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: AppText(
                                    context.tr(LocaleKeys.common_delete),
                                  ),
                                ),
                              ],
                            ),
                          );
                          if (context.mounted && approved == true) {
                            await cubit.deleteExpense(expense);
                          }
                        },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Prices extends StatelessWidget {
  const _Prices({required this.prices});

  final List<FoodPrice> prices;

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogCubit>().state;
    final cubit = context.watch<BudgetCubit>();
    if (catalog is CatalogLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (catalog is! CatalogReady) {
      return Center(
        child: TextButton(
          onPressed: context.read<CatalogCubit>().load,
          child: AppText(context.tr(LocaleKeys.common_retry)),
        ),
      );
    }
    final costs = {for (final price in prices) price.foodId: price.filsPer100g};
    final foods = catalog.foods.toList()
      ..sort((a, b) {
        final aPrice = costs[a.id];
        final bPrice = costs[b.id];
        if (aPrice == null) {
          return bPrice == null ? a.name.compareTo(b.name) : 1;
        }
        if (bPrice == null) return -1;
        return aPrice.compareTo(bPrice);
      });
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppText(context.tr(LocaleKeys.budget_pricesHelp)),
        for (final food in foods)
          ListTile(
            title: AppText(foodDisplayName(context, food)),
            subtitle: AppText(
              costs[food.id] == null
                  ? context.tr(LocaleKeys.nutrition_unknown)
                  : context.tr(
                      LocaleKeys.budget_priced,
                      args: [_money(context, costs[food.id]!)],
                    ),
            ),
            trailing: const Icon(Icons.edit_outlined),
            onTap: cubit.state.busy
                ? null
                : () async {
                    final cost = costs[food.id];
                    final result = await showDialog<String>(
                      context: context,
                      builder: (context) => BudgetTextDialog(
                        title: foodDisplayName(context, food),
                        initial: cost == null ? '' : jodDecimal(cost),
                        isPrice: true,
                      ),
                    );
                    if (context.mounted && result != null) {
                      await cubit.savePrice(food.id, parseJodFils(result));
                    }
                  },
          ),
      ],
    );
  }
}

class _Plan extends StatelessWidget {
  const _Plan({required this.days, required this.draft});

  final List<DateTime> days;
  final List<PlannedDay> draft;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BudgetCubit>();
    final notes = {for (final day in draft) day.dayKey: day.meals};
    final format = DateFormat.MMMMEEEEd(context.locale.toString());
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppText(context.tr(LocaleKeys.budget_planHelp)),
        for (final day in days)
          ListTile(
            title: AppText(format.format(day)),
            subtitle: AppText(
              notes[cubit.calendar.dayKey(day)] ??
                  context.tr(LocaleKeys.budget_noPlan),
            ),
            trailing: const Icon(Icons.edit_outlined),
            onTap: cubit.state.busy
                ? null
                : () async {
                    final result = await showDialog<String>(
                      context: context,
                      builder: (_) => BudgetTextDialog(
                        title: format.format(day),
                        initial: notes[cubit.calendar.dayKey(day)] ?? '',
                      ),
                    );
                    if (context.mounted && result != null) {
                      await cubit.savePlan(day, result);
                    }
                  },
          ),
      ],
    );
  }
}

class OwnerExportPage extends StatelessWidget {
  const OwnerExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExportCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.budget_export))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppText(context.tr(LocaleKeys.budget_exportHelp)),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: cubit.busy
                  ? null
                  : () async {
                      final approved = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: AppText(context.tr(LocaleKeys.budget_export)),
                          content: AppText(
                            context.tr(LocaleKeys.budget_exportConsent),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: AppText(
                                context.tr(LocaleKeys.common_cancel),
                              ),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: AppText(
                                context.tr(LocaleKeys.common_continueAction),
                              ),
                            ),
                          ],
                        ),
                      );
                      if (context.mounted && approved == true) {
                        await cubit.save(consent: true);
                      }
                    },
              child: AppText(context.tr(LocaleKeys.budget_createJson)),
            ),
            if (cubit.busy) const LinearProgressIndicator(),
            if (cubit.state == ExportStatus.saved)
              AppText(context.tr(LocaleKeys.budget_exportSaved)),
            if (cubit.state == ExportStatus.failed)
              AppText(context.tr(LocaleKeys.budget_exportFailed)),
          ],
        ),
      ),
    );
  }
}
