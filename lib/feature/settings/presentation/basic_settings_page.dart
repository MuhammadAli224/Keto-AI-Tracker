import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/app_widget/app_text.dart';
import '../../../generated/app_strings.g.dart';
import 'cubit/settings_cubit.dart';

class BasicSettingsPage extends StatelessWidget {
  const BasicSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.common_settings))),
      body: SafeArea(
        child: ListView(
          children: [
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
