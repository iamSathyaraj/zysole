// import 'dart:async';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce/admin/views/admin_drawer.dart';
// import 'package:e_commerce/user/user_model.dart';
// import 'package:e_commerce/user/views/bottom_nav_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:e_commerce/user/views/home_screen.dart';
// import 'package:e_commerce/auth/login_screen.dart';
// import 'package:e_commerce/auth/sign%20up/verify_email_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     super.initState();
//     _checkUser();
//   }

//   void _checkUser() async {
//     await Future.delayed(Duration(seconds: 2));

//     User? user = FirebaseAuth.instance.currentUser;
//     // final users=FirebaseFirestore.instance.doc(user.uid)

//     if (user == null) {
//       Navigator.pushReplacement(
//         context,
//           MaterialPageRoute(
//             builder: (_) => LoginScreen()
//           )
//       );
//     return;
//     } 
     
//    try{
//     final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     if(!userDoc.exists){
//       FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//    }

//   if(userDoc.exists){
//     final data=userDoc.data()!;
//     final role=data['role']??'user';

//     if(role=='admin'){
//       Navigator.pushReplacement(context,
//        MaterialPageRoute(builder: (context)=>AdminDashboard()));
//     }else{
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavMenu()));
//     }
//   }
// }catch(e){
//   // log("error checking user role$e");
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
// }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//              height: 120,
//              width: 120,
//              child: Image.asset("assets/images/logo.png",
//               fit: BoxFit.contain
//              ),
//             ),
            
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/views/admin_drawer.dart';
import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/auth/login_screen.dart';

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

  Future<void> _checkUser() async {
    await Future.delayed(const Duration(seconds: 4));
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // 🔹 Not logged in → Go to login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    try {
      // 🔹 Check if Firestore user document exists
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        // 🔸 If Firestore data missing, logout & go to login
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
        return;
      }
      if(userDoc.exists){

      final data = userDoc.data()!;
      final role = data['role'] ?? 'user';

      // 🔹 Navigate based on role
      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminDashboard()),
        );
      } else if(role=='user') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNavMenu()),
        );
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
      }

    } catch (e) {
      // 🔸 Error fetching Firestore data
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
