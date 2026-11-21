import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserRecord({
    required User user,
    required String firstName,
    required String lastName,
    required String role,
  }) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'registrationDateTime': FieldValue.serverTimestamp(),
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) {
    return _firestore.collection('users').doc(uid).get();
  }
}
