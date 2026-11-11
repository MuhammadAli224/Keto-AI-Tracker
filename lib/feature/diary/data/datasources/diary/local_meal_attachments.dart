import 'package:hive_ce/hive.dart';

class LocalMealAttachments {
  const LocalMealAttachments(this._box);

  final Box<dynamic> _box;

  String _key(String uid, String id) =>
      '${Uri.encodeComponent(uid)}:${Uri.encodeComponent(id)}';

  String? read(String uid, String id) => _box.get(_key(uid, id)) as String?;

  Future<void> store(String uid, String id, String ref) =>
      _box.put(_key(uid, id), ref);
}
