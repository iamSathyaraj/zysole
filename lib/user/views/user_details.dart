// import 'package:flutter/material.dart';

// class UserDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> user;

//   const UserDetailScreen({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user["name"]),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.blueAccent.shade100,
//                   child: Text(
//                     user["name"][0].toUpperCase(),
//                     style: const TextStyle(
//                         fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildDetailRow("Name", user["name"]),
//               _buildDetailRow("Email", user["email"]),
//               _buildDetailRow("Role", user["role"]),
//               _buildDetailRow("Status", user["status"]),
//               _buildDetailRow("Phone", user["phone"]),
//               _buildDetailRow("Joined On", user["joinedOn"]),
//               const SizedBox(height: 30),
//               Center(
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.edit, color: Colors.white),
//                   label: const Text("Edit User",
//                       style: TextStyle(color: Colors.white)),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Text(
//             "$label:",
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 15),
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 15, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class UserDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> user;

//   const UserDetailScreen({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff6f7fb),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ===== Header Section =====
//             Stack(
//               children: [
//                 // Gradient Header Background
//                 Container(
//                   height: 220,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xff6a11cb), Color(0xff2575fc)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30),
//                     ),
//                   ),
//                 ),

//                 // Profile Info Overlay
//                 Positioned.fill(
//                   top: 20,
//                   child: Column(
//                     children: [
//                       // Back Button
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back_ios_new_rounded,
//                                 color: Colors.white),
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                           const Text(
//                             "User Details",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 10),

//                       // Profile Avatar
//                       Hero(
//                         tag: user["email"],
//                         child: CircleAvatar(
//                           radius: 45,
//                           backgroundColor: Colors.white,
//                           child: CircleAvatar(
//                             radius: 42,
//                             backgroundColor: Colors.blue.shade100,
//                             child: Text(
//                               user["name"][0].toUpperCase(),
//                               style: const TextStyle(
//                                 fontSize: 40,
//                                 color: Colors.deepPurple,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),

//                       Text(
//                         user["name"],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         user["role"],
//                         style: const TextStyle(
//                             color: Colors.white70,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // ===== Info Card Section =====
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(18),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.95),
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 10,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildInfoTile(Icons.email, "Email", user["email"]),
//                       _buildInfoTile(Icons.phone, "Phone", user["phone"]),
//                       _buildInfoTile(Icons.verified_user, "Status", user["status"]),
//                       _buildInfoTile(Icons.date_range, "Joined On", user["joinedOn"]),

//                       const SizedBox(height: 30),
//                       const Divider(thickness: 1),
//                       const SizedBox(height: 20),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ElevatedButton.icon(
//                             onPressed: () {},
//                             icon: const Icon(Icons.edit, color: Colors.white),
//                             label: const Text("Edit",
//                                 style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 25),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                             ),
//                           ),
//                           ElevatedButton.icon(
//                             onPressed: () {},
//                             icon: const Icon(Icons.delete_outline,
//                                 color: Colors.white),
//                             label: const Text("Delete",
//                                 style: TextStyle(color: Colors.white)),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.redAccent,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 25),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoTile(IconData icon, String title, String value) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.deepPurple.shade50,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             padding: const EdgeInsets.all(10),
//             child: Icon(icon, color: Colors.deepPurple),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         fontSize: 13,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w500)),
//                 const SizedBox(height: 3),
//                 Text(value,
//                     style: const TextStyle(
//                         fontSize: 15,
//                         color: Colors.black87,
//                         fontWeight: FontWeight.w600)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
import 'package:e_commerce/user/user_model.dart';
import 'package:e_commerce/user/views/new_orderlist.dart';
import 'package:e_commerce/user/views/new_userdetail.dart';
import 'package:e_commerce/user/views/order_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;
  const UserDetailScreen({super.key,required this.userId});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  AppUser ?user;
  bool isLoading=true;
   

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetail();
  
  }


   Future<void> fetchUserDetail() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final result = await userProvider.fetchUserById(widget.userId);
    setState(() {
      user = result;
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
        if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text("User not found")),
      );
    }
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.32, // dynamic height
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const Text(
                              "User Details",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Hero(
                          tag: user?.email ??"",
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.blue.shade100,
                              child: Text(
                                (user?.name != null && user!.name.isNotEmpty)
                                    ? user!.name[0].toUpperCase()
                                    : "?",
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            user?.name ?? "Unknown User",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user?.role ?? "User",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       singleTitle(Icons.email, "Email", user?.email),
                      singleTitle(Icons.phone, "Phone", user?.phone),
                      singleTitle(Icons.verified_user, "Status", user?.status),
                      // singleTitle(Icons.date_range, "Joined On", user?.joinedOn ?? "-"),
                   
                      const SizedBox(height: 30),
                      const Divider(thickness: 1),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewUserdetail()));
                            },
                            icon: const Icon(Icons.edit, color: Colors.white),
                            label: const Text("Edit",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderDetailsScreen()));
                            },
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.white),
                            label: const Text("Delete",
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 12, 12, 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleTitle(IconData icon, String title, String? value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.deepPurple),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 3),
                Text(
                  value ?? "-",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
