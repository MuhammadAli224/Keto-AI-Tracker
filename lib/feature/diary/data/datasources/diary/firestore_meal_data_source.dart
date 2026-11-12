import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/meal_dto.dart';

class FirestoreMealDataSource {
  const FirestoreMealDataSource(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> _meals(String uid) {
    if (_auth.currentUser?.uid != uid) {
      throw FirebaseException(plugin: 'diary', code: 'permission-denied');
    }
    return _firestore.collection('users').doc(uid).collection('meals');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchDay(
    String uid,
    String dayKey,
  ) => _meals(
    uid,
  ).where('dayKey', isEqualTo: dayKey).snapshots(includeMetadataChanges: true);

  Future<void> save(String uid, MealDto meal) => _meals(uid).doc(meal.id).set({
    ...meal.toJson(),
    'eatenAtUtc': Timestamp.fromDate(meal.eatenAtUtc),
    'updatedAt': FieldValue.serverTimestamp(),
  });

  Future<void> delete(String uid, String id) => _meals(uid).doc(id).update({
    'status': 'deleted',
    'updatedAt': FieldValue.serverTimestamp(),
  });
}
