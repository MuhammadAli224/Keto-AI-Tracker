import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';

class OwnerHomePage extends StatelessWidget {
  const OwnerHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.common_home))),
    body: SafeArea(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: AppText(context.tr(LocaleKeys.diary_title)),
            onTap: () => context.push(AppRoutes.diary),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu_outlined),
            title: AppText(context.tr(LocaleKeys.nutrition_catalog)),
            onTap: () => context.push(AppRoutes.foodCatalog),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: AppText(context.tr(LocaleKeys.profile_title)),
            onTap: () => context.push(AppRoutes.profile),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: AppText(context.tr(LocaleKeys.common_settings)),
            onTap: () => context.push(AppRoutes.setting),
          ),
        ],
      ),
    ),
  );
}
