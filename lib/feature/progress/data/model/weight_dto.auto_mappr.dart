// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_app/feature/progress/data/model/weight_dto.dart' as _i2;
import 'package:flutter_app/feature/progress/domain/entities/progress.dart'
    as _i3;

/// {@template package:flutter_app/feature/progress/data/model/weight_dto.dart}
/// Available mappings:
/// - `WeightDto` → `WeightEntry`.
/// - `WeightEntry` → `WeightDto`.
/// {@endtemplate}
class $WeightMapper implements _i1.AutoMapprInterface {
  const $WeightMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.WeightDto>() ||
            sourceTypeOf == _typeOf<_i2.WeightDto?>()) &&
        (targetTypeOf == _typeOf<_i3.WeightEntry>() ||
            targetTypeOf == _typeOf<_i3.WeightEntry?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.WeightEntry>() ||
            sourceTypeOf == _typeOf<_i3.WeightEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.WeightDto>() ||
            targetTypeOf == _typeOf<_i2.WeightDto?>())) {
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.WeightDto>() ||
            sourceTypeOf == _typeOf<_i2.WeightDto?>()) &&
        (targetTypeOf == _typeOf<_i3.WeightEntry>() ||
            targetTypeOf == _typeOf<_i3.WeightEntry?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$WeightDto_To__i3$WeightEntry((model as _i2.WeightDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.WeightEntry>() ||
            sourceTypeOf == _typeOf<_i3.WeightEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.WeightDto>() ||
            targetTypeOf == _typeOf<_i2.WeightDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$WeightEntry_To__i2$WeightDto((model as _i3.WeightEntry?))
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
  /// {@macro package:flutter_app/feature/progress/data/model/weight_dto.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.WeightEntry _map__i2$WeightDto_To__i3$WeightEntry(_i2.WeightDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping WeightDto → WeightEntry failed because WeightDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<WeightDto, WeightEntry> to handle null values during mapping.',
      );
    }
    return _i3.WeightEntry(
      id: model.id,
      kg: model.kg,
      measuredAt: model.measuredAt,
      timezone: model.timezone,
      notes: model.notes,
      deleted: model.deleted,
    );
  }

  _i2.WeightDto _map__i3$WeightEntry_To__i2$WeightDto(_i3.WeightEntry? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping WeightEntry → WeightDto failed because WeightEntry was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<WeightEntry, WeightDto> to handle null values during mapping.',
      );
    }
    return _i2.WeightDto(
      id: model.id,
      kg: model.kg,
      measuredAt: model.measuredAt,
      timezone: model.timezone,
      notes: model.notes,
      deleted: model.deleted,
    );
  }
}
