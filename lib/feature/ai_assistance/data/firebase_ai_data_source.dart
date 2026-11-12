import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../domain/ai_assistance.dart';

class FirebaseAiDataSource {
  Future<void>? _activation;

  Future<Map<String, dynamic>> call(
    String operation,
    String uid,
    Map<String, Object> payload,
    bool Function() canSend,
  ) async {
    try {
      if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
        await (_activation ??= FirebaseAppCheck.instance.activate(
          providerApple: const AppleAppAttestProvider(),
        ));
      }
      if (!canSend() || FirebaseAuth.instance.currentUser?.uid != uid) {
        throw AiFailure.unavailable;
      }
      final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
          .httpsCallable(
            operation,
            options: HttpsCallableOptions(timeout: const Duration(seconds: 45)),
          )
          .call<Object?>(payload);
      final data = result.data;
      if (data is! Map) throw AiFailure.unavailable;
      return Map<String, dynamic>.from(data);
    } on FirebaseFunctionsException catch (error) {
      throw switch (error.code) {
        'resource-exhausted' || 'already-exists' => AiFailure.limited,
        'unavailable' || 'deadline-exceeded' => AiFailure.connection,
        _ => AiFailure.unavailable,
      };
    } on FirebaseException {
      _activation = null;
      throw AiFailure.unavailable;
    }
  }
}
