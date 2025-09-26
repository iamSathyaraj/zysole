import 'dart:async';
import 'package:e_commerce/views/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/views/home_screen.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/sign%20up/verify_email_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  void _checkUser() async {
    await Future.delayed(Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacement(
        context,
          MaterialPageRoute(
            builder: (_) => LoginScreen()
          )
      );
    // } else if (!user.emailVerified) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //      builder: (_) => VerifyEmailScreen()
    //     )
    //   );
    } else {
      Navigator.pushReplacement(
        context,MaterialPageRoute(
          builder: (_) => BottomNavMenu()
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
             height: 120,
             width: 120,
             child: Image.asset("assets/images/logo.png",
              fit: BoxFit.contain
             ),
            ),
            
            SizedBox(height: 20),
            Text( 
              'Shop Smarter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
