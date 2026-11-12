import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/constant/box_key.dart';
import '../../../core/time/owner_calendar.dart';
import '../../owner/owner_barrel.dart';
import '../data/local_budget_data_source.dart';
import '../data/local_budget_repository.dart';
import '../data/owner_export_data_source.dart';
import '../domain/budget_access.dart';
import '../presentation/cubit/budget/budget_cubit.dart';

bool get supportsOwnerExport =>
    !kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS);

void initBudgetDI(GetIt getIt) {
  final owner = getIt<OwnerIdentity>();
  final repository = LocalBudgetRepository(
    LocalBudgetDataSource(getIt<Box>(instanceName: BoxKey.budget)),
    OwnerExportDataSource(FirebaseFirestore.instance, FirebaseAuth.instance),
  );
  final access = BudgetAccess(
    repository,
    () => owner.canAnalyze ? owner.account?.uid : null,
  );
  getIt.registerFactoryParam<BudgetCubit, String, void>(
    (zone, _) => BudgetCubit(access, OwnerCalendar(zone)),
  );
  getIt.registerFactory(() => ExportCubit(access));
}
