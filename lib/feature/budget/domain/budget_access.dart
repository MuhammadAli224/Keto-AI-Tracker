import '../../../core/domain/request_cancellation.dart';
import '../../../core/time/owner_calendar.dart';
import 'budget.dart';

abstract interface class BudgetRepository {
  BudgetJournal load(String uid);
  Future<void> saveExpense(String uid, FoodExpense expense);
  Future<void> removeExpense(String uid, String id);
  Future<void> savePrice(String uid, String foodId, FoodPrice? price);
  Future<void> savePlan(String uid, PlannedDay day);
  Future<bool> export(String uid, bool Function() mayPresent);
}

class BudgetAccess {
  const BudgetAccess(this._repository, this._confirmedUid);

  final BudgetRepository _repository;
  final String? Function() _confirmedUid;

  String get ownerUid =>
      _confirmedUid() ?? (throw StateError('Owner unavailable'));

  void _check(String uid) {
    if (uid != _confirmedUid()) throw StateError('Owner changed');
  }

  BudgetJournal load(String uid) {
    _check(uid);
    return _repository.load(uid);
  }

  Future<void> saveExpense(String uid, FoodExpense expense) {
    _check(uid);
    if (expense.description.trim().isEmpty ||
        expense.description.length > 120 ||
        expense.fils <= 0 ||
        expense.fils > 100000000 ||
        !OwnerCalendar.supports(expense.timezone)) {
      throw ArgumentError('Invalid expense');
    }
    return _repository.saveExpense(uid, expense);
  }

  Future<void> removeExpense(String uid, String id) {
    _check(uid);
    return _repository.removeExpense(uid, id);
  }

  Future<void> savePrice(String uid, String foodId, int? fils) {
    _check(uid);
    if (foodId.isEmpty || (fils != null && (fils < 0 || fils > 100000000))) {
      throw ArgumentError('Invalid food price');
    }
    return _repository.savePrice(
      uid,
      foodId,
      fils == null ? null : FoodPrice(foodId: foodId, filsPer100g: fils),
    );
  }

  Future<void> savePlan(String uid, PlannedDay day) {
    _check(uid);
    if (day.meals.length > 600) throw ArgumentError('Plan is too long');
    return _repository.savePlan(uid, day);
  }

  Future<bool> export(
    String uid, {
    required bool consent,
    required RequestCancellation request,
  }) async {
    _check(uid);
    if (!consent || request.isCancelled) return false;
    return _repository.export(
      uid,
      () => !request.isCancelled && uid == _confirmedUid(),
    );
  }
}
