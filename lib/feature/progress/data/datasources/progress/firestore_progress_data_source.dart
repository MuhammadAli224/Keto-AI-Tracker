import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/weight_dto.dart';

typedef ProgressQuery = QuerySnapshot<Map<String, dynamic>>;

class FirestoreProgressDataSource {
  const FirestoreProgressDataSource(this._db, this._auth);

  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  DocumentReference<Map<String, dynamic>> _owner(String uid) {
    if (_auth.currentUser?.uid != uid) {
      throw FirebaseException(plugin: 'progress', code: 'permission-denied');
    }
    return _db.collection('users').doc(uid);
  }

  CollectionReference<Map<String, dynamic>> _weights(String uid) =>
      _owner(uid).collection('weights');

  Stream<ProgressQuery> watchWeights(String uid) => _weights(uid)
      .orderBy('measuredAt', descending: true)
      .snapshots(includeMetadataChanges: true);

  Future<void> saveWeight(String uid, WeightDto weight) =>
      _weights(uid).doc(weight.id).set(weight.toFirestore());

  Future<void> deleteWeight(String uid, String id) => _weights(uid)
      .doc(id)
      .update({'deleted': true, 'updatedAt': FieldValue.serverTimestamp()});

  Future<ProgressQuery> dayRange(
    String uid,
    String collection,
    String first,
    String last,
  ) => _owner(uid)
      .collection(collection)
      .where('dayKey', isGreaterThanOrEqualTo: first)
      .where('dayKey', isLessThanOrEqualTo: last)
      .get();

  Future<ProgressQuery> timeRange(
    String uid,
    String collection,
    String field,
    DateTime first,
    DateTime lastExclusive,
  ) => _owner(uid)
      .collection(collection)
      .where(field, isGreaterThanOrEqualTo: Timestamp.fromDate(first))
      .where(field, isLessThan: Timestamp.fromDate(lastExclusive))
      .get();
}
