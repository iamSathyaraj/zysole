// import 'package:e_commerce/user/views/user_details.dart';
// import 'package:flutter/material.dart';
// // import 'user_detail_screen.dart';

// class UserManagementScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> users = [
//     {
//       "name": "SATHYA",
//       "email": "sathya@gmail.com",
//       "role": "Admin",
//       "status": "Active",
//       "phone": "+91 9876543210",
//       "joinedOn": "2025-01-12",
//     },
//     {
//       "name": "thofee",
//       "email": "thoufee@gmail.com",
//       "role": "User",
//       "status": "Blocked",
//       "phone": "+91 9123456780",
//       "joinedOn": "2025-02-15",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("User Management"),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];
//           return Card(
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListTile(
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               leading: CircleAvatar(
//                 backgroundColor: user["status"] == "Active"
//                     ? Colors.green
//                     : Colors.redAccent,
//                 child: Text(
//                   user["name"][0].toUpperCase(),
//                   style: const TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               ),
//               title: Text(
//                 user["name"],
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(user["email"]),
//               trailing: 
//               TextButton(onPressed: (){
//                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailScreen(user: user)));
//                                              }, child: const
//               //  Icon(Icons.arrow_forward_ios_rounded, size: 18)
//               Text("View details..")
//                ),
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (_) => UserDetailScreen(user: user),
//                 //   ),
//                 // );
//                        },
//             ),
//           );
//                },
//       ),
//     );
//   }
// }
