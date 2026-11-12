import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../owner/owner_barrel.dart';
import '../data/firebase_ai_data_source.dart';
import '../data/firebase_ai_repository.dart';
import '../domain/ai_assistance_access.dart';
import '../presentation/cubit/ai_assistance/ai_assistance_cubit.dart';

void initAiAssistanceDI(GetIt getIt) {
  final identity = getIt<OwnerIdentity>();
  final repository = FirebaseAiRepository(
    FirebaseAiDataSource(),
    available:
        const bool.fromEnvironment('AI_ASSISTANCE_ENABLED') &&
        !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS),
  );
  String? confirmedUid() => identity.canAnalyze ? identity.account?.uid : null;
  final access = AiAssistanceAccess(repository, confirmedUid);
  getIt.registerFactory(
    () => AiAssistanceCubit(access, identity, confirmedUid),
  );
}
