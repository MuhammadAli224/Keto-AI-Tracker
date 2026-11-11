// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:flutter_app/feature/wellness/data/model/wellness_dto.dart'
    as _i2;
import 'package:flutter_app/feature/wellness/domain/entities/wellness.dart'
    as _i3;

/// {@template package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
/// Available mappings:
/// - `WaterDto` → `WaterEntry`.
/// - `WaterEntry` → `WaterDto`.
/// - `FastDto` → `FastSession`.
/// - `FastSession` → `FastDto`.
/// {@endtemplate}
class $WellnessMapper implements _i1.AutoMapprInterface {
  const $WellnessMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.WaterDto>() ||
            sourceTypeOf == _typeOf<_i2.WaterDto?>()) &&
        (targetTypeOf == _typeOf<_i3.WaterEntry>() ||
            targetTypeOf == _typeOf<_i3.WaterEntry?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.WaterEntry>() ||
            sourceTypeOf == _typeOf<_i3.WaterEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.WaterDto>() ||
            targetTypeOf == _typeOf<_i2.WaterDto?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i2.FastDto>() ||
            sourceTypeOf == _typeOf<_i2.FastDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FastSession>() ||
            targetTypeOf == _typeOf<_i3.FastSession?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.FastSession>() ||
            sourceTypeOf == _typeOf<_i3.FastSession?>()) &&
        (targetTypeOf == _typeOf<_i2.FastDto>() ||
            targetTypeOf == _typeOf<_i2.FastDto?>())) {
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.WaterDto>() ||
            sourceTypeOf == _typeOf<_i2.WaterDto?>()) &&
        (targetTypeOf == _typeOf<_i3.WaterEntry>() ||
            targetTypeOf == _typeOf<_i3.WaterEntry?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$WaterDto_To__i3$WaterEntry((model as _i2.WaterDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.WaterEntry>() ||
            sourceTypeOf == _typeOf<_i3.WaterEntry?>()) &&
        (targetTypeOf == _typeOf<_i2.WaterDto>() ||
            targetTypeOf == _typeOf<_i2.WaterDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$WaterEntry_To__i2$WaterDto((model as _i3.WaterEntry?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i2.FastDto>() ||
            sourceTypeOf == _typeOf<_i2.FastDto?>()) &&
        (targetTypeOf == _typeOf<_i3.FastSession>() ||
            targetTypeOf == _typeOf<_i3.FastSession?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$FastDto_To__i3$FastSession((model as _i2.FastDto?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.FastSession>() ||
            sourceTypeOf == _typeOf<_i3.FastSession?>()) &&
        (targetTypeOf == _typeOf<_i2.FastDto>() ||
            targetTypeOf == _typeOf<_i2.FastDto?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$FastSession_To__i2$FastDto((model as _i3.FastSession?))
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
  /// {@macro package:flutter_app/feature/wellness/data/model/wellness_dto.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.WaterEntry _map__i2$WaterDto_To__i3$WaterEntry(_i2.WaterDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping WaterDto → WaterEntry failed because WaterDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<WaterDto, WaterEntry> to handle null values during mapping.',
      );
    }
    return _i3.WaterEntry(
      id: model.id,
      ml: model.ml,
      recordedAt: model.recordedAt,
      dayKey: model.dayKey,
      timezone: model.timezone,
      deleted: model.deleted,
    );
  }

  _i2.WaterDto _map__i3$WaterEntry_To__i2$WaterDto(_i3.WaterEntry? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping WaterEntry → WaterDto failed because WaterEntry was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<WaterEntry, WaterDto> to handle null values during mapping.',
      );
    }
    return _i2.WaterDto(
      id: model.id,
      ml: model.ml,
      recordedAt: model.recordedAt,
      dayKey: model.dayKey,
      timezone: model.timezone,
      deleted: model.deleted,
    );
  }

  _i3.FastSession _map__i2$FastDto_To__i3$FastSession(_i2.FastDto? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FastDto → FastSession failed because FastDto was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FastDto, FastSession> to handle null values during mapping.',
      );
    }
    return _i3.FastSession(
      id: model.id,
      startedAt: model.startedAt,
      plannedEndAt: model.plannedEndAt,
      timezone: model.timezone,
      status: model.status,
      actualEndAt: model.actualEndAt,
    );
  }

  _i2.FastDto _map__i3$FastSession_To__i2$FastDto(_i3.FastSession? input) {
    final model = input;
    if (model == null) {
      throw Exception(
        r'Mapping FastSession → FastDto failed because FastSession was null, and no default value was provided. '
        r'Consider setting the whenSourceIsNull parameter on the MapType<FastSession, FastDto> to handle null values during mapping.',
      );
    }
    return _i2.FastDto(
      id: model.id,
      startedAt: model.startedAt,
      plannedEndAt: model.plannedEndAt,
      timezone: model.timezone,
      status: model.status,
      actualEndAt: model.actualEndAt,
    );
  }
}
