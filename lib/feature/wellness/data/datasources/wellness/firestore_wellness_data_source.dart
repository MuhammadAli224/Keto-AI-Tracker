import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/wellness.dart';
import '../../model/wellness_dto.dart';

class FirestoreWellnessDataSource {
  const FirestoreWellnessDataSource(this._db, this._auth);

  final FirebaseFirestore _db;
  final FirebaseAuth _auth;

  DocumentReference<Map<String, dynamic>> _owner(String uid) {
    if (_auth.currentUser?.uid != uid) {
      throw FirebaseException(plugin: 'wellness', code: 'permission-denied');
    }
    return _db.collection('users').doc(uid);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> watchWater(
    String uid,
    String day,
  ) => _owner(uid)
      .collection('water')
      .where('dayKey', isEqualTo: day)
      .snapshots(includeMetadataChanges: true);

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchFast(String uid) =>
      _owner(uid)
          .collection('fasting')
          .doc('current')
          .snapshots(includeMetadataChanges: true);

  Future<void> addWater(String uid, WaterDto entry) =>
      _owner(uid).collection('water').doc(entry.id).set({
        ...entry.toJson(),
        'recordedAt': Timestamp.fromDate(entry.recordedAt),
        'updatedAt': FieldValue.serverTimestamp(),
      });

  Future<void> deleteWater(String uid, String id) => _owner(uid)
      .collection('water')
      .doc(id)
      .update({'deleted': true, 'updatedAt': FieldValue.serverTimestamp()});

  Future<void> saveFast(String uid, FastDto session) {
    final owner = _owner(uid);
    final current = owner.collection('fasting').doc('current');
    final actualEnd = session.actualEndAt;
    final data = {
      ...session.toJson(),
      'startedAt': Timestamp.fromDate(session.startedAt),
      'plannedEndAt': Timestamp.fromDate(session.plannedEndAt),
      'actualEndAt': actualEnd == null ? null : Timestamp.fromDate(actualEnd),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    if (session.status == FastStatus.active) return current.set(data);
    final batch = _db.batch();
    batch.set(current, data);
    batch.set(owner.collection('fastingHistory').doc(session.id), data);
    return batch.commit();
  }
}
