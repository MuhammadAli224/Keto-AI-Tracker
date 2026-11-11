import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/diary/diary_barrel.dart';
import '../../feature/nutrition/nutrition_barrel.dart';
import '../../feature/owner/owner_barrel.dart';
import '../../feature/progress/progress_barrel.dart';
import '../../feature/reminders/reminders_barrel.dart';
import '../../feature/settings/presentation/basic_settings_page.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../feature/wellness/wellness_barrel.dart';
import '../../generated/app_strings.g.dart';
import '../constant/routes.dart';
import '../context/global.dart';
import '../dependencies/dependencies_injection.dart';
import '../widget/app_widget/app_text.dart';

final goRouters = _createRouter(getIt<OwnerIdentity>());

GoRouter _createRouter(OwnerIdentity identity) => GoRouter(
  navigatorKey: GlobalContext.navigatorKey,
  initialLocation: AppRoutes.root,
  refreshListenable: identity,
  redirect: (_, state) => _redirectOwner(identity, state),
  errorBuilder: (context, _) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.common_notFound))),
    body: Center(
      child: TextButton(
        onPressed: () => context.go(AppRoutes.home),
        child: AppText(context.tr(LocaleKeys.common_backToHome)),
      ),
    ),
  ),
  routes: [
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(
      path: AppRoutes.home,
      builder: (_, __) {
        final profile = identity.confirmedProfile;
        if (profile == null) return const SplashScreen();
        return MultiBlocProvider(
          key: ValueKey((identity.account?.uid, profile.timezone)),
          providers: [
            BlocProvider(create: (_) => _startDiary(profile.timezone)),
            BlocProvider(
              create: (_) =>
                  getIt<WellnessCubit>(param1: profile.timezone)..start(),
            ),
            BlocProvider(
              create: (_) =>
                  getIt<ProgressCubit>(param1: profile.timezone)..loadWeights(),
            ),
          ],
          child: OwnerHomePage(profile: profile),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.progress,
      builder: (_, __) {
        final profile = identity.confirmedProfile;
        if (profile == null) return const SplashScreen();
        return BlocProvider(
          key: ValueKey((identity.account?.uid, profile.timezone)),
          create: (_) => getIt<ProgressCubit>(param1: profile.timezone)
            ..loadWeights()
            ..loadReport(profile.waterMl),
          child: ProgressPage(profile: profile),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.wellness,
      builder: (_, __) {
        final profile = identity.confirmedProfile;
        if (profile == null) return const SplashScreen();
        return BlocProvider(
          key: ValueKey((identity.account?.uid, profile.timezone)),
          create: (_) =>
              getIt<WellnessCubit>(param1: profile.timezone)..start(),
          child: WellnessPage(
            waterGoal: profile.waterMl,
            windowStart: profile.windowStart,
            windowEnd: profile.windowEnd,
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.diary,
      builder: (_, __) {
        final profile = identity.confirmedProfile;
        if (profile == null) return const SplashScreen();
        return MultiBlocProvider(
          key: ValueKey((identity.account?.uid, profile.timezone)),
          providers: [
            BlocProvider(create: (_) => getIt<CatalogCubit>()..load()),
            BlocProvider(create: (_) => _startDiary(profile.timezone)),
          ],
          child: const DiaryPage(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.foodCatalog,
      builder: (_, __) => BlocProvider(
        key: ValueKey(identity.account?.uid),
        create: (_) => getIt<CatalogCubit>()..load(),
        child: const FoodCatalogPage(),
      ),
    ),
    GoRoute(
      path: AppRoutes.setting,
      builder: (_, __) => BasicSettingsPage(
        showProfile: identity.account != null,
        showReminders: identity.canAnalyze,
      ),
    ),
    GoRoute(
      path: AppRoutes.reminders,
      builder: (_, __) {
        final profile = identity.confirmedProfile;
        if (profile == null) return const SplashScreen();
        return BlocProvider(
          key: ValueKey((identity.account?.uid, profile.timezone)),
          create: (_) => getIt<ReminderCubit>(param1: profile),
          child: RemindersPage(timezone: profile.timezone),
        );
      },
    ),
    if (kDebugMode)
      GoRoute(
        path: AppRoutes.profilePreview,
        builder: (_, __) => const ProfilePreviewPage(),
      ),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, __) => BlocProvider(
        create: (_) => getIt<OwnerAuthCubit>(),
        child: OwnerLoginPage(unavailable: identity.unavailable),
      ),
    ),
    GoRoute(
      path: AppRoutes.profileSetup,
      builder: (_, __) => _profileProviders(identity, setup: true),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (_, __) => _profileProviders(identity),
    ),
  ],
);

const _protectedLinks = {
  AppRoutes.home,
  AppRoutes.profile,
  AppRoutes.diary,
  AppRoutes.foodCatalog,
  AppRoutes.wellness,
  AppRoutes.progress,
  AppRoutes.reminders,
};

String? _redirectOwner(OwnerIdentity identity, GoRouterState state) {
  final path = state.uri.path;
  final requested = state.uri.queryParameters['next'];
  final next = _protectedLinks.contains(path)
      ? path
      : _protectedLinks.contains(requested)
      ? requested
      : null;
  String guard(String route) => Uri(
    path: route,
    queryParameters: next == null ? null : {'next': next},
  ).toString();

  if (path == AppRoutes.setting) return null;
  if (kDebugMode && path == AppRoutes.profilePreview) return null;
  if (!identity.ready) {
    return path == AppRoutes.root ? null : guard(AppRoutes.root);
  }
  if (identity.account == null) {
    return path == AppRoutes.login ? null : guard(AppRoutes.login);
  }
  if (!identity.canAnalyze) {
    return path == AppRoutes.profileSetup
        ? null
        : guard(AppRoutes.profileSetup);
  }
  if (const {
    AppRoutes.root,
    AppRoutes.login,
    AppRoutes.profileSetup,
  }.contains(path)) {
    return next ?? AppRoutes.home;
  }
  return null;
}

DiaryCubit _startDiary(String zone) {
  final diary = getIt<DiaryCubit>(param1: zone);
  diary.selectDay(diary.state.date);
  return diary;
}

Widget _profileProviders(OwnerIdentity identity, {bool setup = false}) {
  final uid = identity.account?.uid;
  if (uid == null) return const SplashScreen();
  return MultiBlocProvider(
    key: ValueKey(uid),
    providers: [
      BlocProvider(create: (_) => getIt<OwnerAuthCubit>()),
      BlocProvider(create: (_) => getIt<OwnerProfileCubit>(param1: uid)),
    ],
    child: OwnerProfilePage(
      setup: setup,
      onRetry: identity.retryProfile,
      latestWeightKg: setup ? null : identity.latestWeightKg,
    ),
  );
}
