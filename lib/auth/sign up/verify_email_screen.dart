// // import 'package:flutter/material.dart';

// // class VerifyEmailScreen extends StatelessWidget {
// //   const VerifyEmailScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: SingleChildScrollView(
// //         child: Padding(padding: EdgeInsets.all(12),
// //         child: Column(
// //           children: [
// //             Image.asset("assets/images/banner.png"),
// //             SizedBox(height: 36),
// //             Text("Verify Your Email",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
// //             SizedBox(height: 25),
// //             Text("unknown@gmail.com",textAlign: TextAlign.center),
// //             SizedBox(height: 20),
// //             Text("congratulations lidh djhffsjfb spkjdfhhspdjf",textAlign: TextAlign.center),
// //             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("data")
// //             ),
// //             ),
// //             SizedBox(child: TextButton(onPressed: (){}, child: Text("rescent email")),
// //             )


// //           ],
// //         ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:e_commerce/controllers/auth_provider.dart';
// import 'package:e_commerce/views/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class VerifyEmailScreen extends StatelessWidget {
//   const VerifyEmailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
// Future<void> checkEmailVerified() async {
//   try {
//     final firebaseUser = FirebaseAuth.instance.currentUser;
//     await firebaseUser?.reload(); // refresh
//     if (firebaseUser != null && firebaseUser.emailVerified) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Email not verified yet.')),
//       );
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//   }
// }


//     return Scaffold(
//       appBar: AppBar(title: const Text('Verify Your Email')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'A verification email has been sent to ${authProvider.user?.email ?? ""}. '
//               'Please check your email and click the verification link.',
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await authProvider.resendEmailVerification();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Verification email resent!')),
//                 );
//               },
//               child: const Text('Resend Email'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: checkEmailVerified,
//               child: const Text('I have verified my email'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
