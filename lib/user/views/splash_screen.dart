
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/views/admin_drawer.dart';
import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/auth/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/auth/controller/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
    _checkUser();
  });
    // _checkUser();

  } 

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        return;
      }
      // if(userDoc.exists){

      final data = userDoc.data()!;
      final role = data['role'] ?? 'user';

      final authProvider=Provider.of<AuthProviderr>(context,listen: false);
      await authProvider.fetchCurrentUser();



      if (role == 'admin') {
      Navigator.pushAndRemoveUntil(context,
       MaterialPageRoute(builder: (context)=>const AdminDashboard()),
        (route)=>false);
      } else if(role=='user') {
       Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>BottomNavMenu()), (route)=>false);
      }else{
        Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
      // }

    } catch (e) {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}