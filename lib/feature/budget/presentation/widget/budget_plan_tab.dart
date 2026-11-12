import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/budget.dart';
import '../cubit/budget/budget_cubit.dart';
import 'budget_text_dialog.dart';

class BudgetPlanTab extends StatelessWidget {
  const BudgetPlanTab({super.key, required this.days, required this.draft});

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
