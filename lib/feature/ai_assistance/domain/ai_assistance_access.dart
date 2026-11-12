import '../../../core/domain/request_cancellation.dart';
import 'ai_assistance.dart';

abstract interface class AiAssistanceRepository {
  bool get available;
  Future<MealEstimate> interpret(
    String uid,
    String mealId,
    String photoRef,
    String locale,
    bool Function() canSend,
  );
  Future<CoachReply> coach(
    String uid,
    String message,
    String locale,
    bool includeGoals,
    bool Function() canSend,
  );
}

class AiAssistanceAccess {
  const AiAssistanceAccess(this._repository, this._confirmedUid);

  final AiAssistanceRepository _repository;
  final String? Function() _confirmedUid;

  bool get available => _repository.available && _confirmedUid() != null;

  Future<MealEstimate> interpret({
    required String mealId,
    required String photoRef,
    required String locale,
    required bool consent,
    required RequestCancellation cancellation,
  }) => _request(
    consent,
    cancellation,
    (uid, canSend) =>
        _repository.interpret(uid, mealId, photoRef, locale, canSend),
  );

  Future<CoachReply> coach({
    required String message,
    required String locale,
    required bool includeGoals,
    required bool consent,
    required RequestCancellation cancellation,
  }) => _request(
    consent && message.trim().isNotEmpty && message.length <= 1200,
    cancellation,
    (uid, canSend) =>
        _repository.coach(uid, message.trim(), locale, includeGoals, canSend),
  );

  Future<T> _request<T>(
    bool consent,
    RequestCancellation cancellation,
    Future<T> Function(String, bool Function()) request,
  ) async {
    final uid = _confirmedUid();
    if (!available || !consent || uid == null) throw AiFailure.unavailable;
    bool canSend() => !cancellation.isCancelled && _confirmedUid() == uid;
    if (!canSend()) throw AiFailure.unavailable;
    final result = await request(uid, canSend);
    if (!canSend()) throw AiFailure.unavailable;
    return result;
  }
}
