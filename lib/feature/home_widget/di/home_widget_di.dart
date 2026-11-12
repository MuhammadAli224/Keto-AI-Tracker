import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/constant/box_key.dart';
import '../data/android_widget_bridge.dart';
import '../data/widget_snapshot_service.dart';
import '../presentation/cubit/home_widget/home_widget_cubit.dart';

bool get supportsHomeWidget =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

void initHomeWidgetDI(GetIt getIt) {
  if (!supportsHomeWidget) return;
  final service = WidgetSnapshotService(
    getIt<Box>(instanceName: BoxKey.appBox),
    getIt(),
    getIt(),
    getIt(),
    const AndroidWidgetBridge(),
  );
  getIt.registerSingleton(service, dispose: (value) => value.dispose());
  getIt.registerFactory(() => HomeWidgetCubit(service));
}
