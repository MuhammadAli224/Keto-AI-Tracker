// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart'
    as _i2;
import 'package:flutter_app/feature/nutrition/domain/entities/nutrition.dart'
    as _i3;

/// {@template package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
/// Available mappings:
/// - `NutrientsDto` → `Nutrients`.
/// - `Nutrients` → `NutrientsDto`.
/// - `ServingDto` → `Serving`.
/// - `Serving` → `ServingDto`.
/// - `RecipeDto` → `Recipe`.
/// - `Recipe` → `RecipeDto`.
/// - `FoodDto` → `Food`.
/// - `Food` → `FoodDto`.
/// {@endtemplate}
class $NutritionMapper implements _i1.AutoMapprInterface {
  const $NutritionMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.NutrientsDto>() ||
            sourceTypeOf == _typeOf<_i2.NutrientsDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Nutrients>() ||
            targetTypeOf == _typeOf<_i3.Nutrients?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Nutrients>() ||
            sourceTypeOf == _typeOf<_i3.Nutrients?>()) &&
        (targetTypeOf == _typeOf<_i2.NutrientsDto>() ||
            targetTypeOf == _typeOf<_i2.NutrientsDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.ServingDto>() ||
            sourceTypeOf == _typeOf<_i2.ServingDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Serving>() ||
            targetTypeOf == _typeOf<_i3.Serving?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Serving>() ||
            sourceTypeOf == _typeOf<_i3.Serving?>()) &&
        (targetTypeOf == _typeOf<_i2.ServingDto>() ||
            targetTypeOf == _typeOf<_i2.ServingDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.RecipeDto>() ||
            sourceTypeOf == _typeOf<_i2.RecipeDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Recipe>() ||
            targetTypeOf == _typeOf<_i3.Recipe?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Recipe>() ||
            sourceTypeOf == _typeOf<_i3.Recipe?>()) &&
        (targetTypeOf == _typeOf<_i2.RecipeDto>() ||
            targetTypeOf == _typeOf<_i2.RecipeDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.FoodDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Food>() ||
            targetTypeOf == _typeOf<_i3.Food?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Food>() ||
            sourceTypeOf == _typeOf<_i3.Food?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodDto>() ||
            targetTypeOf == _typeOf<_i2.FoodDto?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(model, onMappingError: onMappingError);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model, onMappingError: onMappingError);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
        (item) => _safeConvert(item, onMappingError: onMappingError),
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model, onMappingError: onMappingError);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.NutrientsDto>() ||
            sourceTypeOf == _typeOf<_i2.NutrientsDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Nutrients>() ||
            targetTypeOf == _typeOf<_i3.Nutrients?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$NutrientsDto_To__i3$Nutrients(
            (model as _i2.NutrientsDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Nutrients>() ||
            sourceTypeOf == _typeOf<_i3.Nutrients?>()) &&
        (targetTypeOf == _typeOf<_i2.NutrientsDto>() ||
            targetTypeOf == _typeOf<_i2.NutrientsDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Nutrients_To__i2$NutrientsDto((model as _i3.Nutrients?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.ServingDto>() ||
            sourceTypeOf == _typeOf<_i2.ServingDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Serving>() ||
            targetTypeOf == _typeOf<_i3.Serving?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ServingDto_To__i3$Serving((model as _i2.ServingDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Serving>() ||
            sourceTypeOf == _typeOf<_i3.Serving?>()) &&
        (targetTypeOf == _typeOf<_i2.ServingDto>() ||
            targetTypeOf == _typeOf<_i2.ServingDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Serving_To__i2$ServingDto((model as _i3.Serving?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.RecipeDto>() ||
            sourceTypeOf == _typeOf<_i2.RecipeDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Recipe>() ||
            targetTypeOf == _typeOf<_i3.Recipe?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$RecipeDto_To__i3$Recipe((model as _i2.RecipeDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Recipe>() ||
            sourceTypeOf == _typeOf<_i3.Recipe?>()) &&
        (targetTypeOf == _typeOf<_i2.RecipeDto>() ||
            targetTypeOf == _typeOf<_i2.RecipeDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Recipe_To__i2$RecipeDto((model as _i3.Recipe?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.FoodDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodDto?>()) &&
        (targetTypeOf == _typeOf<_i3.Food>() ||
            targetTypeOf == _typeOf<_i3.Food?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$FoodDto_To__i3$Food((model as _i2.FoodDto?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Food>() ||
            sourceTypeOf == _typeOf<_i3.Food?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodDto>() ||
            targetTypeOf == _typeOf<_i2.FoodDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Food_To__i2$FoodDto((model as _i3.Food?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
    onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(model, canReturnNull: true);
    }
    try {
      return _convert(model, canReturnNull: true);
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.Nutrients _map__i2$NutrientsDto_To__i3$Nutrients(
    _i2.NutrientsDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping NutrientsDto → Nutrients failed because NutrientsDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<NutrientsDto, Nutrients> to handle null values during mapping.',
      );
    }
    return _i3.Nutrients(
      kcal: model.kcal,
      protein: model.protein,
      carbs: model.carbs,
      fiber: model.fiber,
      fat: model.fat,
      carbBasis: model.carbBasis,
    );
  }

  _i2.NutrientsDto _map__i3$Nutrients_To__i2$NutrientsDto(
    _i3.Nutrients? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Nutrients → NutrientsDto failed because Nutrients was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Nutrients, NutrientsDto> to handle null values during mapping.',
      );
    }
    return _i2.NutrientsDto(
      kcal: model.kcal,
      protein: model.protein,
      carbs: model.carbs,
      fiber: model.fiber,
      fat: model.fat,
      carbBasis: model.carbBasis,
    );
  }

  _i3.Serving _map__i2$ServingDto_To__i3$Serving(_i2.ServingDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping ServingDto → Serving failed because ServingDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<ServingDto, Serving> to handle null values during mapping.',
      );
    }
    return _i3.Serving(
      foodId: model.foodId,
      name: model.name,
      edibleGrams: model.edibleGrams,
      nutrients: _map__i2$NutrientsDto_To__i3$Nutrients(model.nutrients),
      source: model.source,
      sourceReference: model.sourceReference,
    );
  }

  _i2.ServingDto _map__i3$Serving_To__i2$ServingDto(_i3.Serving? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Serving → ServingDto failed because Serving was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Serving, ServingDto> to handle null values during mapping.',
      );
    }
    return _i2.ServingDto(
      foodId: model.foodId,
      name: model.name,
      edibleGrams: model.edibleGrams,
      nutrients: _map__i3$Nutrients_To__i2$NutrientsDto(model.nutrients),
      source: model.source,
      sourceReference: model.sourceReference,
    );
  }

  _i3.Recipe _map__i2$RecipeDto_To__i3$Recipe(_i2.RecipeDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping RecipeDto → Recipe failed because RecipeDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<RecipeDto, Recipe> to handle null values during mapping.',
      );
    }
    return _i3.Recipe(
      yieldGrams: model.yieldGrams,
      ingredients: model.ingredients
          .map<_i3.Serving>(
            (value) => _map__i2$ServingDto_To__i3$Serving(value),
          )
          .toList(),
    );
  }

  _i2.RecipeDto _map__i3$Recipe_To__i2$RecipeDto(_i3.Recipe? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Recipe → RecipeDto failed because Recipe was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Recipe, RecipeDto> to handle null values during mapping.',
      );
    }
    return _i2.RecipeDto(
      yieldGrams: model.yieldGrams,
      ingredients: model.ingredients
          .map<_i2.ServingDto>(
            (value) => _map__i3$Serving_To__i2$ServingDto(value),
          )
          .toList(),
    );
  }

  _i3.Food _map__i2$FoodDto_To__i3$Food(_i2.FoodDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FoodDto → Food failed because FoodDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FoodDto, Food> to handle null values during mapping.',
      );
    }
    return _i3.Food(
      id: model.id,
      name: model.name,
      source: model.source,
      per100g: _map__i2$NutrientsDto_To__i3$Nutrients(model.per100g),
      sourceReference: model.sourceReference,
      recipe: _map__i2$RecipeDto_To__i3$Recipe_Nullable(model.recipe),
    );
  }

  _i2.FoodDto _map__i3$Food_To__i2$FoodDto(_i3.Food? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Food → FoodDto failed because Food was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Food, FoodDto> to handle null values during mapping.',
      );
    }
    return _i2.FoodDto(
      id: model.id,
      name: model.name,
      source: model.source,
      per100g: _map__i3$Nutrients_To__i2$NutrientsDto(model.per100g),
      sourceReference: model.sourceReference,
      recipe: _map__i3$Recipe_To__i2$RecipeDto_Nullable(model.recipe),
    );
  }

  _i3.Recipe? _map__i2$RecipeDto_To__i3$Recipe_Nullable(_i2.RecipeDto? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i3.Recipe(
      yieldGrams: model.yieldGrams,
      ingredients: model.ingredients
          .map<_i3.Serving>(
            (value) => _map__i2$ServingDto_To__i3$Serving(value),
          )
          .toList(),
    );
  }

  _i2.RecipeDto? _map__i3$Recipe_To__i2$RecipeDto_Nullable(_i3.Recipe? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i2.RecipeDto(
      yieldGrams: model.yieldGrams,
      ingredients: model.ingredients
          .map<_i2.ServingDto>(
            (value) => _map__i3$Serving_To__i2$ServingDto(value),
          )
          .toList(),
    );
  }
}
