import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/owner/owner_barrel.dart';
import '../../feature/splash_screen/splash_screen.dart';
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
    if (identity.account == null) {
      return path == AppRoutes.login ? null : AppRoutes.login;
    }
    if (path == AppRoutes.login ||
        path == AppRoutes.root ||
        path == AppRoutes.home) {
      return AppRoutes.profile;
    }
    return null;
  },
  routes: [
    GoRoute(path: AppRoutes.root, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.home, redirect: (_, __) => AppRoutes.profile),
    GoRoute(
      path: AppRoutes.login,
      builder: (_, __) => BlocProvider(
        create: (_) => getIt<OwnerAuthCubit>(),
        child: OwnerLoginPage(unavailable: identity.unavailable),
      ),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (_, __) {
        final uid = identity.account!.uid;
        return MultiBlocProvider(
          key: ValueKey(uid),
          providers: [
            BlocProvider(create: (_) => getIt<OwnerAuthCubit>()),
            BlocProvider(create: (_) => getIt<OwnerProfileCubit>(param1: uid)),
          ],
          child: const OwnerProfilePage(),
        );
      },
    ),
  ],
);
