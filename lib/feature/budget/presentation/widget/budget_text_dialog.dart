import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/jod.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';

class BudgetTextDialog extends StatefulWidget {
  const BudgetTextDialog({
    super.key,
    required this.title,
    required this.initial,
    this.isPrice = false,
  });
  final String title;
  final String initial;
  final bool isPrice;

  @override
  State<BudgetTextDialog> createState() => _BudgetTextDialogState();
}

class _BudgetTextDialogState extends State<BudgetTextDialog> {
  late final _text = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = _text.text.trim();
    final price = widget.isPrice ? parseJodFils(value) : null;
    final valid =
        !widget.isPrice ||
        value.isEmpty ||
        (price != null && price <= 100000000);
    return AlertDialog(
      scrollable: true,
      title: AppText(widget.title),
      content: TextField(
        controller: _text,
        maxLength: widget.isPrice ? null : 600,
        maxLines: widget.isPrice ? 1 : 4,
        keyboardType: widget.isPrice
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.multiline,
        decoration: InputDecoration(
          labelText: context.tr(
            widget.isPrice
                ? LocaleKeys.budget_pricePer100
                : LocaleKeys.budget_mealDraft,
          ),
          helperText: widget.isPrice
              ? context.tr(LocaleKeys.budget_blankPrice)
              : null,
        ),
        onChanged: (_) => setState(() {}),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_cancel)),
        ),
        FilledButton(
          onPressed: valid ? () => Navigator.pop(context, value) : null,
          child: AppText(context.tr(LocaleKeys.common_save)),
        ),
      ],
    );
  }
}
