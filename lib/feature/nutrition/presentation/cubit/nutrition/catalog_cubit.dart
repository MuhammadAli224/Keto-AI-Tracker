import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../domain/entities/nutrition.dart';
import '../../../domain/repository/catalog_repository.dart';
import '../../../domain/usecases/catalog_access.dart';

part 'catalog_cubit.freezed.dart';

@freezed
sealed class CatalogState with _$CatalogState {
  const factory CatalogState.loading() = CatalogLoading;
  const factory CatalogState.failure(CatalogError error) = CatalogLoadFailure;
  const factory CatalogState.ready(
    List<Food> foods, {
    @Default(false) bool saving,
    CatalogError? saveError,
  }) = CatalogReady;
}

class CatalogCubit extends Cubit<CatalogState>
    with CubitLifecycleMixin<CatalogState> {
  CatalogCubit(this._access) : super(const CatalogState.loading());

  final CatalogAccess _access;
  static const _read = 'load';
  static const _write = 'save';

  Future<void> load() async {
    final current = state;
    if (isClosed || (current is CatalogReady && current.saving)) return;
    final request = beginRequest(_read);
    emit(const CatalogState.loading());
    try {
      final result = await _access.load();
      if (!isCurrentRequest(_read, request)) return;
      emit(
        result.fold(
          (failure) => CatalogState.failure(failure.error),
          CatalogState.ready,
        ),
      );
    } finally {
      finishRequest(_read, request);
    }
  }

  Future<void> save(Food food) async {
    final current = state;
    if (isClosed || current is! CatalogReady || current.saving) return;
    final request = beginRequest(_write);
    emit(current.copyWith(saving: true, saveError: null));
    try {
      final result = await _access.save(food);
      if (!isCurrentRequest(_write, request)) return;
      emit(
        result.fold(
          (failure) => current.copyWith(saveError: failure.error),
          (saved) => CatalogState.ready([
            ...current.foods.where((item) => item.id != saved.id),
            saved,
          ]),
        ),
      );
    } finally {
      finishRequest(_write, request);
    }
  }
}
