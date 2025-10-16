
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<List<String>> getFavorites() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final doc = await _firestore.collection('users').doc(user.uid).get();
    final data = doc.data();
    return List<String>.from(data?['favorites'] ?? []);
  }

  Future<void> addFavorite(String productId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore.collection('users').doc(user.uid).update({
      'favorites': FieldValue.arrayUnion([productId]),
    });
  }

  Future<void> removeFavorite(String productId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _firestore.collection('users').doc(user.uid).update({
      'favorites': FieldValue.arrayRemove([productId]),
    });
  }
}
