// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_app/feature/budget/data/budget_dto.dart' as _i2;
import 'package:flutter_app/feature/budget/domain/budget.dart' as _i3;

/// {@template package:flutter_app/feature/budget/data/budget_dto.dart}
/// Available mappings:
/// - `FoodExpenseDto` → `FoodExpense`.
/// - `FoodExpense` → `FoodExpenseDto`.
/// - `FoodPriceDto` → `FoodPrice`.
/// - `FoodPrice` → `FoodPriceDto`.
/// - `PlannedDayDto` → `PlannedDay`.
/// - `PlannedDay` → `PlannedDayDto`.
/// {@endtemplate}
class $BudgetMapper implements _i1.AutoMapprInterface {
  const $BudgetMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.FoodExpenseDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodExpenseDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FoodExpense>() ||
            targetTypeOf == _typeOf<_i3.FoodExpense?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.FoodExpense>() ||
            sourceTypeOf == _typeOf<_i3.FoodExpense?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodExpenseDto>() ||
            targetTypeOf == _typeOf<_i2.FoodExpenseDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.FoodPriceDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodPriceDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FoodPrice>() ||
            targetTypeOf == _typeOf<_i3.FoodPrice?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.FoodPrice>() ||
            sourceTypeOf == _typeOf<_i3.FoodPrice?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodPriceDto>() ||
            targetTypeOf == _typeOf<_i2.FoodPriceDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.PlannedDayDto>() ||
            sourceTypeOf == _typeOf<_i2.PlannedDayDto?>()) &&
        (targetTypeOf == _typeOf<_i3.PlannedDay>() ||
            targetTypeOf == _typeOf<_i3.PlannedDay?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.PlannedDay>() ||
            sourceTypeOf == _typeOf<_i3.PlannedDay?>()) &&
        (targetTypeOf == _typeOf<_i2.PlannedDayDto>() ||
            targetTypeOf == _typeOf<_i2.PlannedDayDto?>())) {
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.FoodExpenseDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodExpenseDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FoodExpense>() ||
            targetTypeOf == _typeOf<_i3.FoodExpense?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$FoodExpenseDto_To__i3$FoodExpense(
            (model as _i2.FoodExpenseDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.FoodExpense>() ||
            sourceTypeOf == _typeOf<_i3.FoodExpense?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodExpenseDto>() ||
            targetTypeOf == _typeOf<_i2.FoodExpenseDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$FoodExpense_To__i2$FoodExpenseDto(
            (model as _i3.FoodExpense?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.FoodPriceDto>() ||
            sourceTypeOf == _typeOf<_i2.FoodPriceDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FoodPrice>() ||
            targetTypeOf == _typeOf<_i3.FoodPrice?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$FoodPriceDto_To__i3$FoodPrice(
            (model as _i2.FoodPriceDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.FoodPrice>() ||
            sourceTypeOf == _typeOf<_i3.FoodPrice?>()) &&
        (targetTypeOf == _typeOf<_i2.FoodPriceDto>() ||
            targetTypeOf == _typeOf<_i2.FoodPriceDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$FoodPrice_To__i2$FoodPriceDto((model as _i3.FoodPrice?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.PlannedDayDto>() ||
            sourceTypeOf == _typeOf<_i2.PlannedDayDto?>()) &&
        (targetTypeOf == _typeOf<_i3.PlannedDay>() ||
            targetTypeOf == _typeOf<_i3.PlannedDay?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$PlannedDayDto_To__i3$PlannedDay(
            (model as _i2.PlannedDayDto?),
          )
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.PlannedDay>() ||
            sourceTypeOf == _typeOf<_i3.PlannedDay?>()) &&
        (targetTypeOf == _typeOf<_i2.PlannedDayDto>() ||
            targetTypeOf == _typeOf<_i2.PlannedDayDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$PlannedDay_To__i2$PlannedDayDto(
            (model as _i3.PlannedDay?),
          )
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
  /// {@macro package:flutter_app/feature/budget/data/budget_dto.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.FoodExpense _map__i2$FoodExpenseDto_To__i3$FoodExpense(
    _i2.FoodExpenseDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FoodExpenseDto → FoodExpense failed because FoodExpenseDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FoodExpenseDto, FoodExpense> to handle null values during mapping.',
      );
    }
    return _i3.FoodExpense(
      id: model.id,
      dayKey: model.dayKey,
      timezone: model.timezone,
      recordedAtUtc: model.recordedAtUtc,
      description: model.description,
      fils: model.fils,
    );
  }

  _i2.FoodExpenseDto _map__i3$FoodExpense_To__i2$FoodExpenseDto(
    _i3.FoodExpense? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FoodExpense → FoodExpenseDto failed because FoodExpense was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FoodExpense, FoodExpenseDto> to handle null values during mapping.',
      );
    }
    return _i2.FoodExpenseDto(
      id: model.id,
      dayKey: model.dayKey,
      timezone: model.timezone,
      recordedAtUtc: model.recordedAtUtc,
      description: model.description,
      fils: model.fils,
    );
  }

  _i3.FoodPrice _map__i2$FoodPriceDto_To__i3$FoodPrice(
    _i2.FoodPriceDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FoodPriceDto → FoodPrice failed because FoodPriceDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FoodPriceDto, FoodPrice> to handle null values during mapping.',
      );
    }
    return _i3.FoodPrice(foodId: model.foodId, filsPer100g: model.filsPer100g);
  }

  _i2.FoodPriceDto _map__i3$FoodPrice_To__i2$FoodPriceDto(
    _i3.FoodPrice? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FoodPrice → FoodPriceDto failed because FoodPrice was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FoodPrice, FoodPriceDto> to handle null values during mapping.',
      );
    }
    return _i2.FoodPriceDto(
      foodId: model.foodId,
      filsPer100g: model.filsPer100g,
    );
  }

  _i3.PlannedDay _map__i2$PlannedDayDto_To__i3$PlannedDay(
    _i2.PlannedDayDto? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping PlannedDayDto → PlannedDay failed because PlannedDayDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<PlannedDayDto, PlannedDay> to handle null values during mapping.',
      );
    }
    return _i3.PlannedDay(dayKey: model.dayKey, meals: model.meals);
  }

  _i2.PlannedDayDto _map__i3$PlannedDay_To__i2$PlannedDayDto(
    _i3.PlannedDay? input,
  ) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping PlannedDay → PlannedDayDto failed because PlannedDay was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<PlannedDay, PlannedDayDto> to handle null values during mapping.',
      );
    }
    return _i2.PlannedDayDto(dayKey: model.dayKey, meals: model.meals);
  }
}
