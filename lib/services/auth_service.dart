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
          name: appUser.name,
          email: appUser.email,
          role: appUser.role,
        );
        await _firestore.collection("users").doc(user.uid).set(newUser.toMap());
        return newUser;
      }
    } catch (e) {
      log("Error in Signup : $e");
      throw  Exception("Error in Signup $e");
    }
  }


   Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    }  catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }


    //   Future<AppUser?>loginUser(String email, String password)async{


    //    try{
    //        UserCredential result=await _auth.signInWithEmailAndPassword(
    //          email: email,
    //          password: password);

    //          User? user=result.user;
    //          if(user !=null){
    //             throw Exception("please verify your email before login");
    //          }
    //          DocumentSnapshot doc = await _firestore.collection("users").doc(user!.uid).get(); 

    //          if(doc.exists){

    //           return AppUser.fromMap(doc.data()as Map<String, dynamic>, user.uid);
    //          } else{
    //           throw Exception("User not found in database");
    //          }
    //  }on FirebaseAuthException catch(e){
    //    throw Exception("Login Error: ${e.message}");
    //   // print("Login Error: ${e.message}");
    //   // return null;
    //  } catch (e) {
    //   print("General Login Error: $e");
    // }
    // return null;
    //   }

Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Logout Error: $e");
    }
  }

   Future<void> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        await user.reload();
        print("Verification email sent");
      }
    } catch (e) {
      print("Send Email Verification Error: $e");
    }
  }


  Future<AppUser?>signInWithGoogle()async{

    try{

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if(googleUser == null){
      return null;
    }

    final GoogleSignInAuthentication googleAuth=await googleUser.authentication;

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
          }
      }
    // return result.user;

    } catch (e){
      log("error in google sign in:$e");
      return null;
    }
  }

  Future<void>googleSignOut()async{

    await _googleSignIn.signOut();

    await _auth.signOut();
  }

}