import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../nutrition/nutrition_barrel.dart';

class WellnessAmountDialog extends StatefulWidget {
  const WellnessAmountDialog({
    super.key,
    required this.title,
    required this.label,
    required this.maximum,
    this.whole = false,
    this.suggestion,
  });

  final String title;
  final String label;
  final double maximum;
  final bool whole;
  final double? suggestion;

  @override
  State<WellnessAmountDialog> createState() => _WellnessAmountDialogState();
}

class _WellnessAmountDialogState extends State<WellnessAmountDialog> {
  late final _controller = TextEditingController(
    text: widget.suggestion?.toStringAsFixed(widget.whole ? 0 : 2),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parsed = parseNutritionAmount(_controller.text);
    final valid =
        parsed != null &&
        parsed > 0 &&
        parsed <= widget.maximum &&
        (!widget.whole || parsed == parsed.roundToDouble());
    return AlertDialog(
      title: AppText(context.tr(widget.title)),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.numberWithOptions(decimal: !widget.whole),
        decoration: InputDecoration(labelText: context.tr(widget.label)),
        onChanged: (_) => setState(() {}),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_cancel)),
        ),
        FilledButton(
          onPressed: valid ? () => Navigator.pop(context, parsed) : null,
          child: AppText(context.tr(LocaleKeys.common_confirm)),
        ),
      ],
    );
  }
}
