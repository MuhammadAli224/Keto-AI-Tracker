import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';

class ProfileReviewDialog extends StatelessWidget {
  const ProfileReviewDialog({
    super.key,
    required this.details,
    required this.preview,
  });

  final Map<String, String> details;
  final bool preview;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: AppText(context.tr(LocaleKeys.profile_review)),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final entry in details.entries) ...[
            AppText(context.tr(entry.key), fontWeight: FontWeight.w600),
            AppText(entry.value),
            const SizedBox(height: 8),
          ],
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: AppText(context.tr(LocaleKeys.common_back)),
      ),
      if (!preview)
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: AppText(context.tr(LocaleKeys.common_confirm)),
        ),
    ],
  );
}
