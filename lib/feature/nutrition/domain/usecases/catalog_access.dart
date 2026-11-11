import 'package:dartz/dartz.dart';

import '../entities/nutrition.dart';
import '../repository/catalog_repository.dart';

class CatalogAccess {
  const CatalogAccess(this._repository, this._confirmedOwner);

  final CatalogRepository _repository;
  final String? Function() _confirmedOwner;

  Future<Either<CatalogFailure, List<Food>>> load() async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(CatalogFailure(CatalogError.unavailable));
    final result = await _repository.load(uid);
    return uid == _confirmedOwner()
        ? result
        : Left(CatalogFailure(CatalogError.unavailable));
  }

  Future<Either<CatalogFailure, Food>> save(Food food) async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(CatalogFailure(CatalogError.unavailable));
    if (food.id.isEmpty ||
        food.name.trim().isEmpty ||
        food.name.length > 120 ||
        food.source == NutritionSource.usda ||
        !food.per100g.hasValue ||
        !food.per100g.validPer100g) {
      return Left(CatalogFailure(CatalogError.invalid));
    }
    final result = await _repository.save(uid, food);
    return uid == _confirmedOwner()
        ? result
        : Left(CatalogFailure(CatalogError.unavailable));
  }
}
