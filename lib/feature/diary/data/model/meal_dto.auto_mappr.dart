// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_app/feature/diary/data/model/meal_dto.dart' as _i2;
import 'package:flutter_app/feature/diary/domain/entities/meal_entry.dart'
    as _i3;
import 'package:flutter_app/feature/nutrition/data/model/nutrition_dto.dart'
    as _i4;
import 'package:flutter_app/feature/nutrition/domain/entities/nutrition.dart'
    as _i5;

/// {@template package:flutter_app/feature/diary/data/model/meal_dto.dart}
/// Available mappings:
/// - `MealDto` → `MealEntry`.
/// - `MealEntry` → `MealDto`.
/// - `NutrientsDto` → `Nutrients`.
/// - `Nutrients` → `NutrientsDto`.
/// - `ServingDto` → `Serving`.
/// - `Serving` → `ServingDto`.
/// {@endtemplate}
class $MealMapper implements _i1.AutoMapprInterface {
  const $MealMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.MealDto>() ||
            sourceTypeOf == _typeOf<_i2.MealDto?>()) &&
        (targetTypeOf == _typeOf<_i3.MealEntry>() ||
            targetTypeOf == _typeOf<_i3.MealEntry?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.MealEntry>() ||
            sourceTypeOf == _typeOf<_i3.MealEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.MealDto>() ||
            targetTypeOf == _typeOf<_i2.MealDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.NutrientsDto>() ||
            sourceTypeOf == _typeOf<_i4.NutrientsDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Nutrients>() ||
            targetTypeOf == _typeOf<_i5.Nutrients?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.Nutrients>() ||
            sourceTypeOf == _typeOf<_i5.Nutrients?>()) &&
        (targetTypeOf == _typeOf<_i4.NutrientsDto>() ||
            targetTypeOf == _typeOf<_i4.NutrientsDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.ServingDto>() ||
            sourceTypeOf == _typeOf<_i4.ServingDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Serving>() ||
            targetTypeOf == _typeOf<_i5.Serving?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.Serving>() ||
            sourceTypeOf == _typeOf<_i5.Serving?>()) &&
        (targetTypeOf == _typeOf<_i4.ServingDto>() ||
            targetTypeOf == _typeOf<_i4.ServingDto?>())) {
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.MealDto>() ||
            sourceTypeOf == _typeOf<_i2.MealDto?>()) &&
        (targetTypeOf == _typeOf<_i3.MealEntry>() ||
            targetTypeOf == _typeOf<_i3.MealEntry?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$MealDto_To__i3$MealEntry((model as _i2.MealDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.MealEntry>() ||
            sourceTypeOf == _typeOf<_i3.MealEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.MealDto>() ||
            targetTypeOf == _typeOf<_i2.MealDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$MealEntry_To__i2$MealDto((model as _i3.MealEntry?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.NutrientsDto>() ||
            sourceTypeOf == _typeOf<_i4.NutrientsDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Nutrients>() ||
            targetTypeOf == _typeOf<_i5.Nutrients?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$NutrientsDto_To__i5$Nutrients(
            (model as _i4.NutrientsDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.Nutrients>() ||
            sourceTypeOf == _typeOf<_i5.Nutrients?>()) &&
        (targetTypeOf == _typeOf<_i4.NutrientsDto>() ||
            targetTypeOf == _typeOf<_i4.NutrientsDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$Nutrients_To__i4$NutrientsDto((model as _i5.Nutrients?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.ServingDto>() ||
            sourceTypeOf == _typeOf<_i4.ServingDto?>()) &&
        (targetTypeOf == _typeOf<_i5.Serving>() ||
            targetTypeOf == _typeOf<_i5.Serving?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$ServingDto_To__i5$Serving((model as _i4.ServingDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.Serving>() ||
            sourceTypeOf == _typeOf<_i5.Serving?>()) &&
        (targetTypeOf == _typeOf<_i4.ServingDto>() ||
            targetTypeOf == _typeOf<_i4.ServingDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$Serving_To__i4$ServingDto((model as _i5.Serving?))
          as TARGET);
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
  /// {@macro package:flutter_app/feature/diary/data/model/meal_dto.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.MealEntry _map__i2$MealDto_To__i3$MealEntry(_i2.MealDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping MealDto → MealEntry failed because MealDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<MealDto, MealEntry> to handle null values during mapping.',
      );
    }
    return _i3.MealEntry(
      id: model.id,
      dayKey: model.dayKey,
      eatenAtUtc: model.eatenAtUtc,
      timezone: model.timezone,
      type: model.type,
      status: model.status,
      servings: model.servings
          .map<_i5.Serving>(
            (value) => _map__i4$ServingDto_To__i5$Serving(value),
          )
          .toList(),
      updatedAt: model.updatedAt,
    );
  }

  _i2.MealDto _map__i3$MealEntry_To__i2$MealDto(_i3.MealEntry? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping MealEntry → MealDto failed because MealEntry was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<MealEntry, MealDto> to handle null values during mapping.',
      );
    }
    return _i2.MealDto(
      id: model.id,
      dayKey: model.dayKey,
      eatenAtUtc: model.eatenAtUtc,
      timezone: model.timezone,
      type: model.type,
      status: model.status,
      servings: model.servings
          .map<_i4.ServingDto>(
            (value) => _map__i5$Serving_To__i4$ServingDto(value),
          )
          .toList(),
      updatedAt: model.updatedAt,
    );
  }

  _i5.Nutrients _map__i4$NutrientsDto_To__i5$Nutrients(
    _i4.NutrientsDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping NutrientsDto → Nutrients failed because NutrientsDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<NutrientsDto, Nutrients> to handle null values during mapping.',
      );
    }
    return _i5.Nutrients(
      kcal: model.kcal,
      protein: model.protein,
      carbs: model.carbs,
      fiber: model.fiber,
      fat: model.fat,
      carbBasis: model.carbBasis,
    );
  }

  _i4.NutrientsDto _map__i5$Nutrients_To__i4$NutrientsDto(
    _i5.Nutrients? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Nutrients → NutrientsDto failed because Nutrients was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Nutrients, NutrientsDto> to handle null values during mapping.',
      );
    }
    return _i4.NutrientsDto(
      kcal: model.kcal,
      protein: model.protein,
      carbs: model.carbs,
      fiber: model.fiber,
      fat: model.fat,
      carbBasis: model.carbBasis,
    );
  }

  _i5.Serving _map__i4$ServingDto_To__i5$Serving(_i4.ServingDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping ServingDto → Serving failed because ServingDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<ServingDto, Serving> to handle null values during mapping.',
      );
    }
    return _i5.Serving(
      foodId: model.foodId,
      name: model.name,
      edibleGrams: model.edibleGrams,
      nutrients: _map__i4$NutrientsDto_To__i5$Nutrients(model.nutrients),
      source: model.source,
      sourceReference: model.sourceReference,
    );
  }

  _i4.ServingDto _map__i5$Serving_To__i4$ServingDto(_i5.Serving? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping Serving → ServingDto failed because Serving was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<Serving, ServingDto> to handle null values during mapping.',
      );
    }
    return _i4.ServingDto(
      foodId: model.foodId,
      name: model.name,
      edibleGrams: model.edibleGrams,
      nutrients: _map__i5$Nutrients_To__i4$NutrientsDto(model.nutrients),
      source: model.source,
      sourceReference: model.sourceReference,
    );
  }
}
