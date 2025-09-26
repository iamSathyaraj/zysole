// import 'package:e_commerce/models/user_model.dart';
// import 'package:e_commerce/services/auth_service.dart';
// import 'package:flutter/material.dart';

// class AuthProvider extends ChangeNotifier {
//   final AuthService _authService=AuthService();

//   AppUser? _user;
//   AppUser? get user=>_user;
//    bool _isLoading = false;
//    bool get isLoading=>_isLoading;

//    Future<void>signUpUser(AppUser appUser, String password)async{

//     _isLoading=true;
//     notifyListeners();
//     AppUser? result= await _authService.signUp(appUser, password);

//     _isLoading=false;
//     notifyListeners();
//     if(result!=null){
//       _user =result;
//       notifyListeners();
      
//     }
//     // return false;   

//    }
//    Future<void>logoutUser()async{
//     await _authService.logout();
//     notifyListeners();
//    }
// Future<void> resendEmailVerification() async {
//     await _authService.sendEmailVerification();
//   }

// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AppUser? _user;
  bool _isLoading = false;
  String? _errorMessage;
  User? _firebaseUser;
User? get firebaseUser => _firebaseUser;

  // User? _firebaseUser;
  //      User? get firebaseUser => _firebaseUser;


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
  
  // Future<void> loginUser(String email, String password) async {
  //   try {
  //     _setLoading(true);
  //     UserCredential result = await _authService.loginUser(email, password);
  //     _setLoading(false);
  //     return result.user;
  //   } on FirebaseAuthException catch (e) {
  //     _setLoading(false);
  //     _setError(e.message ?? "Login failed");
  //     return null;
  //   }
  // }

Future<void> loginUser(String email, String password) async {
  try {
    _setLoading(true);
     _firebaseUser = await _authService.loginUser(email, password);
    _setLoading(false);
    notifyListeners();
  }  catch (e) {
    _setLoading(false);
    _setError("Login failed$e");
  }
}

  
  // Future<void> logoutUser() async {
  //   await _authService.logout();
  //   _user = null;
  //   notifyListeners();
  // }

  // Future<void> resendEmailVerification() async {
  //   try {
  //     await _authService.sendEmailVerification();
  //      _firebaseUser = FirebaseAuth.instance.currentUser;
  //   await _firebaseUser?.reload();
  //   } catch (e) {
  //     _setError("Failed to send verification email: $e");
  //   }
  // }


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

  }



