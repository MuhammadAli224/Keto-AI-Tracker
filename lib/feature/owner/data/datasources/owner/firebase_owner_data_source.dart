import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> saveProfile(String uid, OwnerProfileDto profile) {
    final json = profile.toJson()
      ..remove('confirmedAt')
      ..remove('updatedAt');
    return _profile(uid).set({
      ...json,
      'updatedAt': FieldValue.serverTimestamp(),
      if (profile.confirmationVersion > 0 && profile.confirmedAt == null)
        'confirmedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
