import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/diary/diary_barrel.dart';
import '../../feature/nutrition/nutrition_barrel.dart';
import '../../feature/owner/owner_barrel.dart';
import '../../feature/settings/presentation/basic_settings_page.dart';
import '../../feature/splash_screen/splash_screen.dart';
import '../../feature/wellness/wellness_barrel.dart';
import '../constant/routes.dart';
import '../context/global.dart';
import '../dependencies/dependencies_injection.dart';

final goRouters = _createRouter(getIt<OwnerIdentity>());

GoRouter _createRouter(OwnerIdentity identity) => GoRouter(
  navigatorKey: GlobalContext.navigatorKey,
  initialLocation: AppRoutes.root,
  refreshListenable: identity,
  redirect: (_, state) {
    final path = state.matchedLocation;
    if (!identity.ready) return path == AppRoutes.root ? null : AppRoutes.root;
    if (path == AppRoutes.setting) return null;
    if (kDebugMode && path == AppRoutes.profilePreview) return null;
    if (identity.account == null) {
      return path == AppRoutes.login ? null : AppRoutes.login;
    }
    if (!identity.canAnalyze) {
      return path == AppRoutes.profileSetup ? null : AppRoutes.profileSetup;
    }
    if (const {
      AppRoutes.login,
      AppRoutes.root,
      AppRoutes.profileSetup,
    }.contains(path)) {
      return AppRoutes.home;
    }
    return null;
  },
  routes: [
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.home, builder: (_, __) => const OwnerHomePage()),
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
            BlocProvider(
              create: (_) {
                final diary = getIt<DiaryCubit>(param1: profile.timezone);
                diary.selectDay(diary.state.date);
                return diary;
              },
            ),
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
      builder: (_, __) => const BasicSettingsPage(),
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

Widget _profileProviders(OwnerIdentity identity, {bool setup = false}) {
  final uid = identity.account?.uid;
  if (uid == null) return const SplashScreen();
  return MultiBlocProvider(
    key: ValueKey(uid),
    providers: [
      BlocProvider(create: (_) => getIt<OwnerAuthCubit>()),
      BlocProvider(create: (_) => getIt<OwnerProfileCubit>(param1: uid)),
    ],
    child: OwnerProfilePage(setup: setup, onRetry: identity.retryProfile),
  );
}
