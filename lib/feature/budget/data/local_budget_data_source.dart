import 'dart:convert';

import 'package:hive_ce/hive.dart';

class LocalBudgetDataSource {
  const LocalBudgetDataSource(this._box);

  final Box<dynamic> _box;

  String _prefix(String uid, String collection) =>
      '${Uri.encodeComponent(uid)}:$collection:';

  List<Map<String, dynamic>> load(String uid, String collection) {
    final prefix = _prefix(uid, collection);
    return [
      for (final key in _box.keys.whereType<String>())
        if (key.startsWith(prefix))
          jsonDecode(_box.get(key) as String) as Map<String, dynamic>,
    ];
  }

  Future<void> write(
    String uid,
    String collection,
    String id,
    Map<String, dynamic>? item,
  ) {
    final key = '${_prefix(uid, collection)}${Uri.encodeComponent(id)}';
    return item == null ? _box.delete(key) : _box.put(key, jsonEncode(item));
  }
}
