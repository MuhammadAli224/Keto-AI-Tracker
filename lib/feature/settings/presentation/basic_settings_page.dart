import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/routes.dart';

import '../../../core/widget/app_widget/app_text.dart';
import '../../../generated/app_strings.g.dart';
import 'cubit/settings_cubit.dart';

class BasicSettingsPage extends StatelessWidget {
  const BasicSettingsPage({
    super.key,
    this.showProfile = false,
    this.showReminders = false,
    this.showHomeWidget = false,
  });

  final bool showProfile;
  final bool showReminders;
  final bool showHomeWidget;

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.common_settings))),
      body: SafeArea(
        child: ListView(
          children: [
            if (showProfile)
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: AppText(context.tr(LocaleKeys.profile_title)),
                onTap: () => context.push(AppRoutes.profile),
              ),
            if (showReminders)
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: AppText(context.tr(LocaleKeys.reminders_title)),
                onTap: () => context.push(AppRoutes.reminders),
              ),
            if (showHomeWidget)
              ListTile(
                leading: const Icon(Icons.widgets_outlined),
                title: AppText(context.tr(LocaleKeys.homeWidget_title)),
                onTap: () => context.push(AppRoutes.homeWidget),
              ),
            SwitchListTile(
              title: AppText(context.tr(LocaleKeys.profile_darkTheme)),
              value: settings.isDarkMode,
              onChanged: (value) => settings.updateTheme(isDarkMode: value),
            ),
            ListTile(
              title: AppText(context.tr(LocaleKeys.profile_arabic)),
              onTap: () => context.setLocale(const Locale('ar')),
            ),
            ListTile(
              title: AppText(context.tr(LocaleKeys.profile_english)),
              onTap: () => context.setLocale(const Locale('en')),
            ),
          ],
        ),
      ),
    );
  }
}
