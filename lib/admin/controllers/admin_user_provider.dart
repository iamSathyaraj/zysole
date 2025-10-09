import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/user/user_model.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<AppUser> _users = [];
  bool _isLoading = false;

  List<AppUser> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      QuerySnapshot snapshot = await _firestore.collection("users").get();
      _users = snapshot.docs
          .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      debugPrint("Error fetching users: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection("users").doc(userId).delete();
      _users.removeWhere((u) => u.id == userId);
      notifyListeners();
    } catch (e) {
      debugPrint("Error deleting user: $e");
    }
  }

  Future<void> blockStatusButton(AppUser user) async {
    try {
      final newStatus = user.status == "blocked" ? "active" : "blocked";
      await _firestore.collection("users").doc(user.id).update({"status": newStatus});
      user.status = newStatus;
      notifyListeners();
    } catch (e) {
      debugPrint("Error toggling block status: $e");
    }
  }
}
