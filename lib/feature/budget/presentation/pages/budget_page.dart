import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/budget/budget_cubit.dart';
import '../widget/budget_expenses_tab.dart';
import '../widget/budget_prices_tab.dart';
import '../widget/budget_plan_tab.dart';

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
                      BudgetExpensesTab(
                        journal: journal,
                        days: days,
                        weeklyFils: weeklyFils,
                      ),
                      BudgetPricesTab(prices: journal.prices),
                      BudgetPlanTab(days: days, draft: journal.plan),
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
