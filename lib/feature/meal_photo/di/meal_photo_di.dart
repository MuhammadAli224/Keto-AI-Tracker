import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/box_key.dart';
import '../../owner/owner_barrel.dart';
import '../data/firebase_meal_photo_repository.dart';
import '../data/local_meal_photos.dart';
import '../data/photo_queue_store.dart';
import '../domain/meal_photo_access.dart';
import '../presentation/meal_photo_cubit.dart';

bool get supportsMealPhotos =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS);

void initMealPhotoDI(GetIt getIt) {
  if (!supportsMealPhotos) return;
  final identity = getIt<OwnerIdentity>();
  final box = getIt<Box>(instanceName: BoxKey.appBox);
  final repository = FirebaseMealPhotoRepository(
    LocalMealPhotos(ImagePicker(), box),
    PhotoQueueStore(box),
    FirebaseAuth.instance,
    Connectivity(),
  );
  String? currentUid() => identity.canAnalyze ? identity.account?.uid : null;
  void synchronize() => repository.activate(currentUid());
  identity.addListener(synchronize);
  synchronize();
  getIt.registerSingleton(
    repository,
    dispose: (value) {
      identity.removeListener(synchronize);
      return value.dispose();
    },
  );
  final access = MealPhotoAccess(repository, currentUid);
  getIt.registerSingleton(access);
  getIt.registerFactoryParam<MealPhotoCubit, String, void>(
    (mealId, _) => MealPhotoCubit(access, mealId),
  );
}
