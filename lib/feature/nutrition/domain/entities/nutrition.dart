import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition.freezed.dart';

enum NutritionSource { usda, label, manual, recipe }

/// Whether the label counts dietary fiber in the carbohydrate amount.
enum CarbBasis { includesFiber, excludesFiber }

@freezed
abstract class Nutrients with _$Nutrients {
  const Nutrients._();

  const factory Nutrients({
    double? kcal,
    double? protein,
    double? carbs,
    double? fiber,
    double? fat,
    @Default(CarbBasis.includesFiber) CarbBasis carbBasis,
  }) = _Nutrients;

  double? get netCarbs {
    final carbohydrate = carbs;
    if (carbBasis == CarbBasis.excludesFiber) return carbohydrate;
    final dietaryFiber = fiber;
    if (carbohydrate == null || dietaryFiber == null) return null;
    return carbohydrate - dietaryFiber;
  }

  double? get calculatedKcal {
    final p = protein;
    final c = netCarbs;
    final f = fat;
    if (p == null || c == null || f == null) return null;
    return p * 4 + c * 4 + f * 9;
  }

  bool get hasValue => [kcal, protein, carbs, fiber, fat].any((n) => n != null);

  bool get validPer100g {
    final amounts = [protein, carbs, fiber, fat];
    final knownMass =
        (protein ?? 0) +
        (fat ?? 0) +
        (carbs ?? 0) +
        (carbBasis == CarbBasis.excludesFiber ? fiber ?? 0 : 0);
    return amounts.every(
          (n) => n == null || (n.isFinite && n >= 0 && n <= 100),
        ) &&
        (kcal == null || (kcal!.isFinite && kcal! >= 0 && kcal! <= 1000)) &&
        (netCarbs == null || netCarbs! >= 0) &&
        knownMass <= 100.1;
  }

  Nutrients scaled(double ratio) {
    if (!ratio.isFinite || ratio < 0) throw ArgumentError('Invalid ratio');
    return copyWith(
      kcal: kcal == null ? null : kcal! * ratio,
      protein: protein == null ? null : protein! * ratio,
      carbs: carbs == null ? null : carbs! * ratio,
      fiber: fiber == null ? null : fiber! * ratio,
      fat: fat == null ? null : fat! * ratio,
    );
  }

  static Nutrients total(Iterable<Nutrients> parts) {
    var total = const Nutrients(
      kcal: 0,
      protein: 0,
      carbs: 0,
      fiber: 0,
      fat: 0,
      carbBasis: CarbBasis.excludesFiber,
    );
    double? add(double? a, double? b) => a == null || b == null ? null : a + b;
    for (final part in parts) {
      total = Nutrients(
        kcal: add(total.kcal, part.kcal ?? part.calculatedKcal),
        protein: add(total.protein, part.protein),
        carbs: add(total.carbs, part.netCarbs),
        fiber: add(total.fiber, part.fiber),
        fat: add(total.fat, part.fat),
        carbBasis: CarbBasis.excludesFiber,
      );
    }
    return total;
  }
}

@freezed
abstract class Food with _$Food {
  const Food._();

  const factory Food({
    required String id,
    required String name,
    required NutritionSource source,
    required Nutrients per100g,
    String? sourceReference,
    Recipe? recipe,
  }) = _Food;

  Serving serve(double edibleGrams, {String? displayName}) {
    if (!Serving.validWeight(edibleGrams)) {
      throw ArgumentError('Invalid edible weight');
    }
    if (!per100g.validPer100g) throw StateError('Invalid nutrition data');
    return Serving(
      foodId: id,
      name: displayName ?? name,
      edibleGrams: edibleGrams,
      nutrients: per100g.scaled(edibleGrams / 100),
      source: source,
      sourceReference: sourceReference,
    );
  }
}

/// Immutable as-consumed snapshot. Weight excludes bones, shells and peel
/// unless that part is eaten. Nutrient quantities are for the recorded grams.
@freezed
abstract class Serving with _$Serving {
  const factory Serving({
    required String foodId,
    required String name,
    required double edibleGrams,
    required Nutrients nutrients,
    required NutritionSource source,
    String? sourceReference,
  }) = _Serving;

  static bool validWeight(double? grams) =>
      grams != null && grams.isFinite && grams > 0 && grams <= 100000;
}

@freezed
abstract class Recipe with _$Recipe {
  const Recipe._();

  const factory Recipe({
    required double yieldGrams,
    required List<Serving> ingredients,
  }) = _Recipe;

  Nutrients per100g() {
    if (!Serving.validWeight(yieldGrams) ||
        ingredients.isEmpty ||
        ingredients.any((item) => !Serving.validWeight(item.edibleGrams))) {
      throw ArgumentError('Invalid recipe weight or ingredients');
    }
    final nutrients = Nutrients.total(
      ingredients.map((item) => item.nutrients),
    ).scaled(100 / yieldGrams);
    if (!nutrients.validPer100g) throw ArgumentError('Invalid recipe yield');
    return nutrients;
  }
}

Nutrients totalMeal(Iterable<Serving> portions) =>
    Nutrients.total(portions.map((portion) => portion.nutrients));

Nutrients totalDay(Iterable<Iterable<Serving>> meals) =>
    totalMeal(meals.expand((meal) => meal));
