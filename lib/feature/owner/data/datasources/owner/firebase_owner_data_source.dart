import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../../../../progress/data/model/weight_dto.dart';

import '../../model/owner_profile_dto.dart';

class FirebaseOwnerDataSource {
  const FirebaseOwnerDataSource(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Stream<User?> watchAccount() => _auth.authStateChanges();

  Future<User?> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<void> signOut() => _auth.signOut();

  DocumentReference<Map<String, dynamic>> _profile(String uid) {
    if (_auth.currentUser?.uid != uid) {
      throw FirebaseException(plugin: 'owner', code: 'permission-denied');
    }
    return _firestore.collection('users').doc(uid);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchProfile(String uid) =>
      _profile(uid).snapshots(includeMetadataChanges: true);

  Future<void> saveProfile(
    String uid,
    OwnerProfileDto profile, {
    bool recordWeight = false,
  }) {
    final json = profile.toJson()
      ..remove('confirmedAt')
      ..remove('updatedAt');
    final ref = _profile(uid);
    final data = {
      ...json,
      'updatedAt': FieldValue.serverTimestamp(),
      if (profile.confirmationVersion > 0 && profile.confirmedAt == null)
        'confirmedAt': FieldValue.serverTimestamp(),
    };
    if (!recordWeight) return ref.set(data, SetOptions(merge: true));
    final weight = WeightDto(
      id: const Uuid().v4(),
      kg: profile.currentWeightKg,
      measuredAt: DateTime.now().toUtc(),
      timezone: profile.timezone,
    );
    final batch = _firestore.batch();
    batch.set(ref, data, SetOptions(merge: true));
    batch.set(ref.collection('weights').doc(weight.id), weight.toFirestore());
    return batch.commit();
  }
}
