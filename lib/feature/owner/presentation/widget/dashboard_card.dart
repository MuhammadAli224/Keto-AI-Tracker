import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String route;
  final Widget child;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              10.gap,
              Expanded(
                child: AppText(context.tr(title), style: AppTextStyle.style18B),
              ),
              IconButton(
                tooltip: context.tr(title),
                onPressed: () => context.push(route),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          8.gap,
          child,
        ],
      ),
    ),
  );
}
