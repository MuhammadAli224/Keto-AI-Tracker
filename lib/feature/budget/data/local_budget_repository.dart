import '../domain/budget.dart';
import '../domain/budget_access.dart';
import 'budget_dto.dart';
import 'local_budget_data_source.dart';
import 'owner_export_data_source.dart';

class LocalBudgetRepository implements BudgetRepository {
  LocalBudgetRepository(this._local, this._export);

  final LocalBudgetDataSource _local;
  final OwnerExportDataSource _export;
  final _mapper = BudgetMapper();

  @override
  BudgetJournal load(String uid) => BudgetJournal(
    expenses: [
      for (final item in _local.load(uid, 'expenses'))
        _mapper.convert<FoodExpenseDto, FoodExpense>(
          FoodExpenseDto.fromJson(item),
        ),
    ],
    prices: [
      for (final item in _local.load(uid, 'prices'))
        _mapper.convert<FoodPriceDto, FoodPrice>(FoodPriceDto.fromJson(item)),
    ],
    plan: [
      for (final item in _local.load(uid, 'plan'))
        _mapper.convert<PlannedDayDto, PlannedDay>(
          PlannedDayDto.fromJson(item),
        ),
    ],
  );

  @override
  Future<void> saveExpense(String uid, FoodExpense expense) => _local.write(
    uid,
    'expenses',
    expense.id,
    _mapper.convert<FoodExpense, FoodExpenseDto>(expense).toJson(),
  );

  @override
  Future<void> removeExpense(String uid, String id) =>
      _local.write(uid, 'expenses', id, null);

  @override
  Future<void> savePrice(String uid, String foodId, FoodPrice? price) =>
      _local.write(
        uid,
        'prices',
        foodId,
        price == null
            ? null
            : _mapper.convert<FoodPrice, FoodPriceDto>(price).toJson(),
      );

  @override
  Future<void> savePlan(String uid, PlannedDay day) => _local.write(
    uid,
    'plan',
    day.dayKey,
    day.meals.isEmpty
        ? null
        : _mapper.convert<PlannedDay, PlannedDayDto>(day).toJson(),
  );

  @override
  Future<bool> export(String uid, bool Function() mayPresent) async {
    final records = await _export.read(uid);
    if (!mayPresent()) return false;
    return _export.save({
      'schemaVersion': 1,
      'exportedAtUtc': DateTime.now().toUtc().toIso8601String(),
      'units': {
        'currency': 'JOD',
        'filsPerDinar': 1000,
        'weight': 'kg',
        'servingAndMacros': 'g',
        'water': 'mL',
        'energy': 'kcal',
      },
      ...records,
      'expenses': _local.load(uid, 'expenses'),
    });
  }
}
