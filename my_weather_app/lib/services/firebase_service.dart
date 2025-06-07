import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      await _firestore.collection('users').doc(userId).set(userData, SetOptions(merge: true));
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return null;

    final doc = await _firestore.collection('users').doc(userId).get();
    return doc.data();
  }

  Future<String?> uploadUserPhoto(File file) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return null;

    final ref = _storage.ref().child('user_avatars/$userId.jpg');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
