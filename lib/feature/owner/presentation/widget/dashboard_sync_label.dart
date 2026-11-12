import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';

class DashboardSyncLabel extends StatelessWidget {
  const DashboardSyncLabel(this.keyName, {super.key});
  final String keyName;

  @override
  Widget build(BuildContext context) => AppText(
    context.tr(keyName),
    style: AppTextStyle.style12,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );
}
