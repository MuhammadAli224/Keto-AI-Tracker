import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/extension/space_extension.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../../diary/diary_barrel.dart';
import '../../../domain/entities/owner_profile.dart';
import '../widget/dashboard_cards.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  Timer? _dayTimer;

  @override
  void initState() {
    super.initState();
    _dayTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!mounted) return;
      final diary = context.read<DiaryCubit>();
      final today = diary.calendar.date(DateTime.now());
      if (diary.calendar.dayKey(diary.state.date) !=
          diary.calendar.dayKey(today)) {
        unawaited(diary.selectDay(today));
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _dayTimer?.cancel();
    super.dispose();
  }

  void _navigate(int index) {
    final route = switch (index) {
      1 => AppRoutes.diary,
      2 => AppRoutes.wellness,
      3 => AppRoutes.progress,
      _ => null,
    };
    if (route != null) context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;
    final locale = context.locale.toString();
    final today = context.read<DiaryCubit>().calendar.date(DateTime.now());
    final budget = NumberFormat.simpleCurrency(
      name: 'JOD',
      locale: locale,
      decimalDigits: 3,
    ).format(profile.weeklyBudgetJod);
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          context.tr(LocaleKeys.app_name),
          style: AppTextStyle.style20B,
        ),
        actions: [
          IconButton(
            tooltip: context.tr(LocaleKeys.profile_title),
            onPressed: () => context.push(AppRoutes.profile),
            icon: const Icon(Icons.person_outline),
          ),
          IconButton(
            tooltip: context.tr(LocaleKeys.common_settings),
            onPressed: () => context.push(AppRoutes.setting),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 20),
          children: [
            AppText(
              DateFormat.yMMMMEEEEd(locale).format(today),
              style: AppTextStyle.style16B,
            ),
            12.gap,
            NutritionDashboardCard(profile: profile),
            12.gap,
            WellnessDashboardCard(waterGoal: profile.waterMl),
            12.gap,
            WeightDashboardCard(profile: profile),
            12.gap,
            Card(
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet_outlined),
                    title: AppText(context.tr(LocaleKeys.profile_budget)),
                    subtitle: AppText(budget),
                    onTap: () => context.push(AppRoutes.budget),
                  ),
                  ListTile(
                    leading: const Icon(Icons.chat_bubble_outline),
                    title: AppText(context.tr(LocaleKeys.ai_coach)),
                    onTap: () => context.push(AppRoutes.coach),
                  ),
                  ListTile(
                    leading: const Icon(Icons.menu_book_outlined),
                    title: AppText(context.tr(LocaleKeys.nutrition_catalog)),
                    onTap: () => context.push(AppRoutes.foodCatalog),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: _navigate,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: context.tr(LocaleKeys.common_home),
          ),
          NavigationDestination(
            icon: const Icon(Icons.restaurant_outlined),
            label: context.tr(LocaleKeys.dashboard_meals),
          ),
          NavigationDestination(
            icon: const Icon(Icons.water_drop_outlined),
            label: context.tr(LocaleKeys.dashboard_water),
          ),
          NavigationDestination(
            icon: const Icon(Icons.show_chart),
            label: context.tr(LocaleKeys.dashboard_progress),
          ),
        ],
      ),
    );
  }
}
