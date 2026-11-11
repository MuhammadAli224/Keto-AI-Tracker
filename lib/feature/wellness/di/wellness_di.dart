import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../core/time/owner_calendar.dart';
import '../../owner/owner_barrel.dart';
import '../data/datasources/wellness/firestore_wellness_data_source.dart';
import '../data/repository/firestore_wellness_repository.dart';
import '../domain/repository/wellness_repository.dart';
import '../domain/usecases/wellness_access.dart';
import '../presentation/wellness/cubit/wellness_cubit.dart';

void initWellnessDI(GetIt getIt) {
  getIt.registerLazySingleton<WellnessRepository>(
    () => FirestoreWellnessRepository(
      FirestoreWellnessDataSource(
        FirebaseFirestore.instance,
        FirebaseAuth.instance,
      ),
    ),
  );
  getIt.registerLazySingleton(
    () => WellnessAccess(getIt(), () {
      final owner = getIt<OwnerIdentity>();
      return owner.canAnalyze ? owner.account?.uid : null;
    }),
  );
  getIt.registerFactoryParam<WellnessCubit, String, void>(
    (zone, _) => WellnessCubit(getIt(), OwnerCalendar(zone)),
  );
}
