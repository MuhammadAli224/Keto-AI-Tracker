import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_assistance.freezed.dart';

enum AiUncertainty { low, medium, high }

enum AiIngredientKind { ingredient, sauce, oil }

enum AiFailure { unavailable, limited, connection }

@freezed
abstract class EstimatedIngredient with _$EstimatedIngredient {
  const factory EstimatedIngredient({
    required String name,
    required double? grams,
    required AiUncertainty uncertainty,
    required AiIngredientKind kind,
  }) = _EstimatedIngredient;
}

@freezed
abstract class MealEstimate with _$MealEstimate {
  const factory MealEstimate({
    required List<EstimatedIngredient> ingredients,
    required List<String> questions,
  }) = _MealEstimate;
}

@freezed
abstract class CoachReply with _$CoachReply {
  const factory CoachReply({
    required List<String> guidance,
    required List<String> questions,
  }) = _CoachReply;
}
