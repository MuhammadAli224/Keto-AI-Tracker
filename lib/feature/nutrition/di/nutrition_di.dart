import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/constant/box_key.dart';
import '../../owner/owner_barrel.dart';
import '../data/datasources/nutrition/local_catalog.dart';
import '../data/repository/local_catalog_repository.dart';
import '../domain/repository/catalog_repository.dart';
import '../domain/usecases/catalog_access.dart';
import '../presentation/nutrition/cubit/catalog_cubit.dart';

void initNutritionDI(GetIt getIt) {
  getIt.registerLazySingleton<CatalogRepository>(
    () => LocalCatalogRepository(
      LocalCatalog(getIt<Box>(instanceName: BoxKey.foodCatalog)),
    ),
  );
  getIt.registerLazySingleton(
    () => CatalogAccess(getIt(), () {
      final identity = getIt<OwnerIdentity>();
      return identity.canAnalyze ? identity.account?.uid : null;
    }),
  );
  getIt.registerFactory(() => CatalogCubit(getIt()));
}
