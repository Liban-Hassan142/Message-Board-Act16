import 'package:cloud_firestore/cloud_firestore.dart';

class BoardService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> postMessage({
    required String text,
    required String authorUid,
    required String authorName,
  }) async {
    await _db.collection('messages').add({
      'text': text,
      'authorUid': authorUid,
      'authorName': authorName,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> messageStream() {
    return _db.collection('messages').orderBy('createdAt').snapshots();
  }

  Future<void> editMessage({
    required String messageId,
    required String newText,
  }) async {
    await _db.collection('messages').doc(messageId).update({
      'text': newText,
      'editedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteMessage({required String messageId}) async {
    await _db.collection('messages').doc(messageId).delete();
  }
}
