import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';

class DashboardRetry extends StatelessWidget {
  const DashboardRetry({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: AppText(context.tr(LocaleKeys.dashboard_unavailable))),
      TextButton(
        onPressed: onRetry,
        child: AppText(context.tr(LocaleKeys.common_retry)),
      ),
    ],
  );
}
