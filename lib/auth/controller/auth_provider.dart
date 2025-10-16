import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/user/models/user_model.dart';
import 'package:e_commerce/services/auth_service.dart';

class AuthProviderr extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AppUser? _user;
  bool _isLoading = false;
  String? _errorMessage;
  User? _firebaseUser;
  User? get firebaseUser => _firebaseUser;

  // User? _firebaseUser;
  // User? get firebaseUser => _firebaseUser;


  AppUser? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
  Future<void> fetchCurrentUser() async {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get();

    if (doc.exists) {
      _user = AppUser.fromMap(doc.data() as Map<String, dynamic>, firebaseUser.uid);
      _firebaseUser = firebaseUser;
      notifyListeners();
    }
  }
}


  
  Future<void> signUpUser(AppUser appUser, String password) async {
    _setLoading(true);
    try {
      _user = await _authService.signUp(appUser, password);
       _firebaseUser = FirebaseAuth.instance.currentUser;
      _setError(null);
    } catch (e) {
      _setError("signUp failed: $e");
    }
    _setLoading(false);
  }

Future<void> loginUser(String email, String password) async {
  _setLoading(true);
  try {
    _user = await _authService.loginUser(email, password);

    if (_user != null) {
      _firebaseUser = FirebaseAuth.instance.currentUser;
      _setError(null);
    } else {
      _setError("User not found");
    }
  } catch (e) {
    _setError("Login failed: $e");
  }
  _setLoading(false);
}

   Future<void> signInWithGoogleAcc() async {
    _setLoading(true);
    _setError(null);
    try {
      // _firebaseUser = await _authService.signInWithGoogle();
      _user = await _authService.signInWithGoogle();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

   Future<void> logout() async {
    _setLoading(true);
    try {
      await _authService.logout();
      _user = null;
      _firebaseUser=null;
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateProfile(AppUser updatedUser) async {
  _setLoading(true);
  try {
    await _authService.updateUserProfile(updatedUser);
    _user = updatedUser; 
    _setError(null);
  } catch (e) {
    _setError("Profile update failed: $e");
  }
  _setLoading(false);
}


  }



