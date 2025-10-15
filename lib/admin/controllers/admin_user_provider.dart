
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/user/user_model.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<AppUser> _users = [];
   AppUser? _selectedUser;
  bool _isLoading = false;
    String? _errorMessage;


  List<AppUser> get users => _users;
    AppUser? get selectedUser => _selectedUser;

  bool get isLoading => _isLoading;
    String? get errorMessage => _errorMessage;


  Future<void> fetchUsers() async {
    _isLoading = true; 
    _errorMessage=null;
    notifyListeners();

    try {
      QuerySnapshot snapshot = await _firestore.collection("users").get();
      _users = snapshot.docs
          .map((doc) => AppUser.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      _errorMessage = "Failed to fetch users. Please try again.";

      log("Error fetching users: $e");
    } finally{
     _isLoading=false;
  notifyListeners();
    }

    
  }

  Future<void> deleteUser(String userId) async {
    _errorMessage=null;
    try {
      await _firestore.collection("users").doc(userId).delete();
      _users.removeWhere((u) => u.id == userId);
      notifyListeners();
    } catch (e) {
      _errorMessage = "Error deleting user. Please try again.";

      log("Error deleting user: $e");
    }
  }

  Future<void> blockStatusButton(AppUser user) async {
    try {
      final newStatus = user.status == "blocked" ? "active" : "blocked";
      await _firestore.collection("users").doc(user.id).update({"status": newStatus});
      user.status = newStatus;
      notifyListeners();
    } catch (e) {
      _errorMessage="failed to change user status";
      log("Error changing block status: $e");
    }
  }

  Future<AppUser?> fetchUserById(String userId) async {
    _isLoading=true;
    _errorMessage=null;
      notifyListeners();
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        _selectedUser= AppUser.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      } else{
        _selectedUser=null;
        _errorMessage="user not found";
      }
    } catch (e) {
      _errorMessage="error Loading user details";
      log('Error fetching user by id: $e');
    } finally{
      _isLoading=false;
      notifyListeners();
    }
    // notifyListeners();
    // return null;
  }
}
