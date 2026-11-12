import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget.freezed.dart';

@freezed
abstract class FoodExpense with _$FoodExpense {
  const factory FoodExpense({
    required String id,
    required String dayKey,
    required String timezone,
    required DateTime recordedAtUtc,
    required String description,
    required int fils,
  }) = _FoodExpense;
}

@freezed
abstract class FoodPrice with _$FoodPrice {
  const factory FoodPrice({required String foodId, required int filsPer100g}) =
      _FoodPrice;
}

@freezed
abstract class PlannedDay with _$PlannedDay {
  const factory PlannedDay({required String dayKey, required String meals}) =
      _PlannedDay;
}

@freezed
abstract class BudgetJournal with _$BudgetJournal {
  const factory BudgetJournal({
    @Default([]) List<FoodExpense> expenses,
    @Default([]) List<FoodPrice> prices,
    @Default([]) List<PlannedDay> plan,
  }) = _BudgetJournal;
}

DateTime weekStart(DateTime date) =>
    date.subtract(Duration(days: date.weekday - DateTime.monday));
