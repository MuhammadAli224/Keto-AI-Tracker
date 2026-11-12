import 'package:uuid/uuid.dart';

import '../domain/ai_assistance.dart';
import '../domain/ai_assistance_access.dart';
import 'firebase_ai_data_source.dart';

class FirebaseAiRepository implements AiAssistanceRepository {
  const FirebaseAiRepository(this._source, {required this.available});

  final FirebaseAiDataSource _source;
  @override
  final bool available;

  @override
  Future<MealEstimate> interpret(
    String uid,
    String mealId,
    String photoRef,
    String locale,
    bool Function() canSend,
  ) async {
    final result = await _request('interpretMeal', uid, locale, {
      'mealId': mealId,
      'photoRef': photoRef,
    }, canSend);
    if (result['needsReview'] != true) throw AiFailure.unavailable;
    return MealEstimate(
      ingredients: [
        for (final raw in result['ingredients'] as List)
          EstimatedIngredient(
            name: raw['name'] as String,
            grams: (raw['grams'] as num?)?.toDouble(),
            uncertainty: AiUncertainty.values.byName(
              raw['uncertainty'] as String,
            ),
            kind: AiIngredientKind.values.byName(raw['kind'] as String),
          ),
      ],
      questions: List<String>.from(result['clarificationQuestions'] as List),
    );
  }

  @override
  Future<CoachReply> coach(
    String uid,
    String message,
    String locale,
    bool includeGoals,
    bool Function() canSend,
  ) async {
    final result = await _request('askCoach', uid, locale, {
      'message': message,
      'includeGoals': includeGoals,
    }, canSend);
    return CoachReply(
      guidance: List<String>.from(result['guidance'] as List),
      questions: List<String>.from(result['clarificationQuestions'] as List),
    );
  }

  Future<Map<String, dynamic>> _request(
    String operation,
    String uid,
    String locale,
    Map<String, Object> data,
    bool Function() canSend,
  ) async {
    if (!available) throw AiFailure.unavailable;
    final result = await _source.call(operation, uid, {
      'requestId': const Uuid().v4(),
      'locale': locale == 'ar' ? 'ar' : 'en',
      'consent': true,
      ...data,
    }, canSend);
    if (result['mode'] != 'live') throw AiFailure.unavailable;
    return result;
  }
}
