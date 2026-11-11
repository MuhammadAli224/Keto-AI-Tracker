import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/owner/firebase_owner_data_source.dart';
import '../data/repository/firebase_owner_repository.dart';
import '../domain/repository/owner_repository.dart';
import '../domain/usecases/owner_access.dart';
import '../presentation/owner/cubit/owner_auth_cubit.dart';
import '../presentation/owner/cubit/owner_profile_cubit.dart';
import '../presentation/owner/owner_identity.dart';

void initOwnerDI(GetIt getIt) {
  if (getIt.isRegistered<OwnerIdentity>()) return;
  getIt.registerLazySingleton<OwnerRepository>(
    () => FirebaseOwnerRepository(
      FirebaseOwnerDataSource(
        FirebaseAuth.instance,
        FirebaseFirestore.instance,
      ),
    ),
  );
  getIt.registerLazySingleton(() => OwnerAccess(getIt()));
  getIt.registerFactory(() => OwnerAuthCubit(getIt()));
  getIt.registerFactoryParam<OwnerProfileCubit, String, void>(
    (uid, _) => OwnerProfileCubit(getIt(), uid),
  );
  getIt.registerSingleton(
    OwnerIdentity(getIt(), getIt())..start(),
    dispose: (identity) => identity.dispose(),
  );
}
