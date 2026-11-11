import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/nutrition.dart';

enum CatalogError { unavailable, invalid, localStorage }

class CatalogFailure extends Failure {
  CatalogFailure(this.error) : super(message: error.name);

  final CatalogError error;
}

abstract interface class CatalogRepository {
  Future<Either<CatalogFailure, List<Food>>> load(String uid);

  Future<Either<CatalogFailure, Food>> save(String uid, Food food);
}
