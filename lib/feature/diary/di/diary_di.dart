import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/constant/box_key.dart';
import '../../../core/time/owner_calendar.dart';
import '../../meal_photo/domain/meal_photo_access.dart';
import '../../owner/owner_barrel.dart';
import '../data/datasources/diary/firestore_meal_data_source.dart';
import '../data/datasources/diary/local_meal_attachments.dart';
import '../data/repository/firestore_diary_repository.dart';
import '../domain/repository/diary_repository.dart';
import '../domain/usecases/diary_access.dart';
import '../presentation/cubit/diary/diary_cubit.dart';

void initDiaryDI(GetIt getIt) {
  getIt.registerLazySingleton<DiaryRepository>(
    () => FirestoreDiaryRepository(
      FirestoreMealDataSource(
        FirebaseFirestore.instance,
        FirebaseAuth.instance,
      ),
      LocalMealAttachments(getIt<Box>(instanceName: BoxKey.mealAttachments)),
    ),
  );
  getIt.registerLazySingleton(
    () => DiaryAccess(getIt(), () {
      final owner = getIt<OwnerIdentity>();
      return owner.canAnalyze ? owner.account?.uid : null;
    }),
  );
  getIt.registerFactoryParam<DiaryCubit, String, void>(
    (zone, _) => DiaryCubit(
      getIt(),
      OwnerCalendar(zone),
      deletePhoto: getIt.isRegistered<MealPhotoAccess>()
          ? getIt<MealPhotoAccess>().deleteLinked
          : null,
    ),
  );
}
