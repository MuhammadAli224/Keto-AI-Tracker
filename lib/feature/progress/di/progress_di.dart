import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../core/time/owner_calendar.dart';
import '../../owner/owner_barrel.dart';
import '../data/datasources/progress/firestore_progress_data_source.dart';
import '../data/repository/firestore_progress_repository.dart';
import '../domain/repository/progress_repository.dart';
import '../domain/usecases/progress_access.dart';
import '../presentation/cubit/progress/progress_cubit.dart';

void initProgressDI(GetIt getIt) {
  getIt.registerLazySingleton<ProgressRepository>(
    () => FirestoreProgressRepository(
      FirestoreProgressDataSource(
        FirebaseFirestore.instance,
        FirebaseAuth.instance,
      ),
    ),
  );
  getIt.registerLazySingleton(
    () => ProgressAccess(getIt(), () {
      final owner = getIt<OwnerIdentity>();
      return owner.canAnalyze ? owner.account?.uid : null;
    }),
  );
  getIt.registerFactoryParam<ProgressCubit, String, void>(
    (zone, _) => ProgressCubit(getIt(), OwnerCalendar(zone)),
  );
}
