import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/budget.dart';
import '../cubit/budget/budget_cubit.dart';
import 'expense_dialog.dart';
import 'budget_money.dart';

class BudgetExpensesTab extends StatelessWidget {
  const BudgetExpensesTab({
    super.key,
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
            args: [formatBudgetMoney(context, weeklyFils)],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.budget_spent,
            args: [formatBudgetMoney(context, spent)],
          ),
        ),
        AppText(
          context.tr(
            remaining < 0
                ? LocaleKeys.budget_over
                : LocaleKeys.budget_remaining,
            args: [formatBudgetMoney(context, remaining.abs())],
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
                AppText(formatBudgetMoney(context, expense.fils)),
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
