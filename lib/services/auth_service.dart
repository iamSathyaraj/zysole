import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

final FirebaseAuth _auth =FirebaseAuth.instance;
final FirebaseFirestore _firestore=FirebaseFirestore.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();




// final CollectionReference _userCollection=FirebaseFirestore;
  // final 


  Future<AppUser?> signUp(AppUser appUser, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: appUser.email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {


        AppUser newUser = AppUser(
          id: user.uid,
          userName: appUser.userName,
          name: appUser.name,
          email: appUser.email,
          role: appUser.role,
          phone: appUser.phone
        );
        await _firestore.collection("users").doc(user.uid).set(newUser.toMap());
        return newUser;
      }
    } catch (e) {
      log("Error in Signup : $e");
      throw  Exception("Error in Signup $e");
    }
  }

  Future<AppUser?> loginUser(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = result.user;

    if (user != null) {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(user.uid).get();

      if (doc.exists) {
        return AppUser.fromMap(doc.data() as Map<String, dynamic>, user.uid);
      } else {
        throw Exception("User not found in Firestore");
      }
    } else {
      throw Exception("User not found");
    }
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message ?? "Login failed");
  } catch (e) {
    throw Exception("Login Error: $e");
  }
}


  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Logout Error: $e");
      throw Exception("logout error: $e");
    }
  }

   Future<void> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        await user.reload();
        log("Verification email sent");
      }
    } catch (e) {
      log("Send Email Verification Error: $e");
      throw Exception("Send Email Verification Error: $e");
    }
  }


  Future<AppUser?>signInWithGoogle()async{

    try{

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if(googleUser == null){
      // if the user cancelled the sign in
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential=GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
     UserCredential result = await _auth.signInWithCredential(credential);

     User? user = result.user;
    
    if(user!=null){
      DocumentSnapshot doc=await _firestore.collection("users").doc(user.uid).get();
          if(doc.exists){
            return AppUser.fromMap(doc.data()as Map<String, dynamic>, user.uid);
          } else {
            AppUser newUser=AppUser(id: user.uid,
             name: user.displayName!,
              email: user.email!,
              role: 'user');
              await _firestore.collection("users").doc(user.uid).set(newUser.toMap());
              return newUser;
          }
      } 
      // throw Exception("error in google sign in");
    // return result.user;

    } on FirebaseAuthException catch (e){
      log("firebase Auth error during google sign in ${e.message}");
      throw Exception("Google sign in filed $e");
    }
    
     catch (e){
      log("error in google sign in:$e");
      throw Exception("Google Sign-In failed. Please try again: $e");
      // return null;
    }
  }

  Future<void>googleSignOut()async{

    await _googleSignIn.signOut();

    await _auth.signOut();
  }


Future<void> updateUserProfile(AppUser updatedUser) async {
  try {
    await _firestore.collection('users').doc(updatedUser.id).update(updatedUser.toMap());
  } catch (e) {
    log("Error updating profile: $e");
    throw Exception("Failed to update profile: $e");
  }
}

}