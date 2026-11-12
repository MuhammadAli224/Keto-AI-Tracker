import 'package:dartz/dartz.dart';

import '../../domain/entities/nutrition.dart';
import '../../domain/repository/catalog_repository.dart';
import '../datasources/nutrition/local_catalog.dart';
import '../datasources/nutrition/usda_catalog.dart';
import '../model/nutrition_dto.dart';

class LocalCatalogRepository implements CatalogRepository {
  LocalCatalogRepository(this._local);

  final LocalCatalog _local;
  final _mapper = NutritionMapper();

  @override
  Future<Either<CatalogFailure, List<Food>>> load(String uid) async {
    try {
      return Right([
        for (final dto in [...usdaCatalog, ..._local.load(uid)])
          _mapper.convert<FoodDto, Food>(dto),
      ]);
    } catch (_) {
      return Left(CatalogFailure(CatalogError.localStorage));
    }
  }

  @override
  Future<Either<CatalogFailure, Food>> save(String uid, Food food) async {
    try {
      await _local.save(uid, _mapper.convert<Food, FoodDto>(food));
      return Right(food);
    } catch (_) {
      return Left(CatalogFailure(CatalogError.localStorage));
    }
  }
}
