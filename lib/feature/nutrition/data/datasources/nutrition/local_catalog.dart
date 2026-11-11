import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../../model/nutrition_dto.dart';

/// Local owner-authored catalog, separate from Firestore's diary cache.
class LocalCatalog {
  const LocalCatalog(this._box);

  final Box<dynamic> _box;

  String _prefix(String uid) => '${Uri.encodeComponent(uid)}:';

  List<FoodDto> load(String uid) {
    final prefix = _prefix(uid);
    return [
      for (final key in _box.keys.whereType<String>())
        if (key.startsWith(prefix))
          FoodDto.fromJson(
            jsonDecode(_box.get(key) as String) as Map<String, dynamic>,
          ),
    ];
  }

  Future<void> save(String uid, FoodDto food) => _box.put(
    '${_prefix(uid)}${Uri.encodeComponent(food.id)}',
    jsonEncode(food.toJson()),
  );
}
