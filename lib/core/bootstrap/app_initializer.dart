import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest_all.dart' as timezone;

import '../../feature/ai_assistance/di/ai_assistance_di.dart';
import '../../feature/budget/di/budget_di.dart';
import '../../feature/diary/di/diary_di.dart';
import '../../feature/home_widget/di/home_widget_di.dart';
import '../../feature/meal_photo/di/meal_photo_di.dart';
import '../../feature/nutrition/di/nutrition_di.dart';
import '../../feature/owner/di/owner_di.dart';
import '../../feature/progress/di/progress_di.dart';
import '../../feature/reminders/di/reminder_di.dart';
import '../../feature/wellness/di/wellness_di.dart';
import '../../global_imports.dart' hide AppBlocObserver;
import '../bloc/observer/block_observer.dart';
import '../widget/app_widget/app_text.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> init() async {
    timezone.initializeTimeZones();
    await _initLocalization();
    await _initHive();
    await _initHydratedBloc();
    await _initDependencyInjection();
    _initBlocObserver();
    await _initCoreServices();
    initProgressDI(getIt);
    initOwnerDI(getIt);
    initNutritionDI(getIt);
    initDiaryDI(getIt);
    initWellnessDI(getIt);
    initReminderDI(getIt);
    initHomeWidgetDI(getIt);
    initMealPhotoDI(getIt);
    initAiAssistanceDI(getIt);
    initBudgetDI(getIt);
    _configureErrorWidget();
  }

  static Future<void> _initLocalization() async {
    await EasyLocalization.ensureInitialized();
  }

  static Future<void> _initHive() async {
    await HiveServices().init();
  }

  static Future<void> _initHydratedBloc() async {
    final storageDirectory = kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          );

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: storageDirectory,
    );
  }

  static Future<void> _initDependencyInjection() async {
    await initGetIt();
  }

  static void _initBlocObserver() {
    Bloc.observer = AppBlocObserver();
  }

  static Future<void> _initCoreServices() async {
    await getIt<AppServices>().initAppServices();
  }

  static void _configureErrorWidget() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Builder(
        builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: AppColor.error,
                  size: 56,
                ),
                16.gap,
                AppText(
                  context.tr(LocaleKeys.common_unknownError),
                  style: AppTextStyle.style18B,
                ),
                if (kDebugMode) ...[
                  8.gap,
                  AppText(
                    details.exceptionAsString(),
                    style: AppTextStyle.style12.copyWith(color: AppColor.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    };
  }
}
