import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/budget.dart';
import 'budget_dto.auto_mappr.dart';

part 'budget_dto.freezed.dart';
part 'budget_dto.g.dart';

@freezed
abstract class FoodExpenseDto with _$FoodExpenseDto {
  const factory FoodExpenseDto({
    required String id,
    required String dayKey,
    required String timezone,
    required DateTime recordedAtUtc,
    required String description,
    required int fils,
  }) = _FoodExpenseDto;

  factory FoodExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$FoodExpenseDtoFromJson(json);
}

@freezed
abstract class FoodPriceDto with _$FoodPriceDto {
  const factory FoodPriceDto({
    required String foodId,
    required int filsPer100g,
  }) = _FoodPriceDto;

  factory FoodPriceDto.fromJson(Map<String, dynamic> json) =>
      _$FoodPriceDtoFromJson(json);
}

@freezed
abstract class PlannedDayDto with _$PlannedDayDto {
  const factory PlannedDayDto({required String dayKey, required String meals}) =
      _PlannedDayDto;

  factory PlannedDayDto.fromJson(Map<String, dynamic> json) =>
      _$PlannedDayDtoFromJson(json);
}

@AutoMappr([
  MapType<FoodExpenseDto, FoodExpense>(reverse: true),
  MapType<FoodPriceDto, FoodPrice>(reverse: true),
  MapType<PlannedDayDto, PlannedDay>(reverse: true),
])
class BudgetMapper extends $BudgetMapper {}
