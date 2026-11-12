import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/jod.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/budget.dart';

typedef ExpenseDraft = ({DateTime date, String description, int fils});

class ExpenseDialog extends StatefulWidget {
  const ExpenseDialog({
    super.key,
    required this.days,
    required this.date,
    this.expense,
  });

  final List<DateTime> days;
  final DateTime date;
  final FoodExpense? expense;

  @override
  State<ExpenseDialog> createState() => _ExpenseDialogState();
}

class _ExpenseDialogState extends State<ExpenseDialog> {
  late DateTime _date = widget.date;
  late final _description = TextEditingController(
    text: widget.expense?.description,
  );
  late final _amount = TextEditingController(
    text: widget.expense == null ? null : jodDecimal(widget.expense!.fils),
  );

  @override
  void dispose() {
    _description.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fils = parseJodFils(_amount.text);
    final description = _description.text.trim();
    final dateFormat = DateFormat.MMMEd(context.locale.toString());
    return AlertDialog(
      scrollable: true,
      title: AppText(
        context.tr(
          widget.expense == null
              ? LocaleKeys.budget_addExpense
              : LocaleKeys.budget_editExpense,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<DateTime>(
            initialValue: _date,
            items: [
              for (final day in widget.days)
                DropdownMenuItem(
                  value: day,
                  child: AppText(dateFormat.format(day)),
                ),
            ],
            onChanged: (value) => setState(() => _date = value ?? _date),
          ),
          TextField(
            controller: _description,
            maxLength: 120,
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.budget_description),
            ),
            onChanged: (_) => setState(() {}),
          ),
          TextField(
            controller: _amount,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.budget_amount),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_cancel)),
        ),
        FilledButton(
          onPressed:
              fils == null ||
                  fils <= 0 ||
                  fils > 100000000 ||
                  description.isEmpty
              ? null
              : () => Navigator.pop(context, (
                  date: _date,
                  description: description,
                  fils: fils,
                )),
          child: AppText(context.tr(LocaleKeys.common_save)),
        ),
      ],
    );
  }
}
