import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
import 'package:e_commerce/user/user_model.dart';
import 'package:e_commerce/user/views/user_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserManagement extends StatefulWidget {
  // final String userId;
  const UserManagement({super.key,
  });

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {

  @override
  void initState() {
    super.initState();
 Future.microtask(() =>
        Provider.of<UserProvider>(context, listen: false).fetchUsers()); 
         }
  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }
// }

// class UserManagement extends StatelessWidget {
  // final List<Map<String, dynamic>> users = [
  //   {"name": "John", "email": "john@gmail.com", "role": "Admin", "status": "active"},
  //   {"name": "Alice", "email": "alice@gmail.com", "role": "User", "status": "blocked"},
  //   {"name": "Bob", "email": "bob@gmail.com", "role": "User", "status": "active"},
  //   {"name": "Sara", "email": "sara@gmail.com", "role": "User", "status": "active"},
  //   {"name": "David", "email": "david@gmail.com", "role": "Admin", "status": "active"},
  // ];

  // UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<UserProvider>(context);
    final List<AppUser>userss=userProvider.users;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("User Management"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
            },
          ),
        ],
      ),
      body:userProvider.isLoading ? Center(
        child: CircularProgressIndicator(),
      ): userss.isEmpty? const Center(
        child: Text("No users Found"),
      ):
       ListView.builder(
        itemCount: userss.length,
        itemBuilder: (context, index) {
          final user = userss[index];
          bool isBlocked = user.status == "blocked";

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){ 
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserDetailScreen()));
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailScreen(userId: user.id)));
                },
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: user.role == "Admin" ? Colors.blue : Colors.grey,
                      size: 40,
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email),
                        SizedBox(height: 4),
                        Text(
                          "${user.role} • ${isBlocked ? "Blocked" : "Active"}",
                          style: TextStyle(
                            color: isBlocked ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: 
                     
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: (){
                                _deleteUser(context);
                              }
                            ),
                            IconButton(
                              icon: Icon(
                                isBlocked ? Icons.lock_open : Icons.lock,
                                color: isBlocked ? Colors.green : Colors.black,
                              ),
                              onPressed: () {
                                
                              },
                            ),
                            
                            // TextButton(onPressed: (){}, child: Text("View details"))
                          ],
                        ),
                        // TextButton(onPressed: (){}, child: Text("vie details"))
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }

  Future<void>_deleteUser(BuildContext context)async{

  return showDialog(
      context: context,
       builder: (context)=>AlertDialog(
      title: Text("Delete User"),
      content: Text("Are you sure want to delete the user"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancel")),
        TextButton(onPressed: (){

        }, child: Text("Add"))
      ],
       ));
  }
}
// import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
// import 'package:e_commerce/user/user_model.dart';
// import 'package:e_commerce/user/views/user_details.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserManagement extends StatefulWidget {
//   const UserManagement({super.key});

//   @override
//   State<UserManagement> createState() => _UserManagementState();
// }

// class _UserManagementState extends State<UserManagement> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() =>
//         Provider.of<UserProvider>(context, listen: false).fetchUsers());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final List<AppUser> userss = userProvider.users;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("User Management"),
//         actions: [
//           IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.filter_alt), onPressed: () {}),
//         ],
//       ),
//       body: userProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : userss.isEmpty
//               ? const Center(child: Text("No users found"))
//               : ListView.builder(
//                   itemCount: userss.length,
//                   itemBuilder: (context, index) {
//                     final user = userss[index];
//                     bool isBlocked = user.status == "blocked";

//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         elevation: 4,
//                         child: ListTile(
//                           leading: Icon(
//                             Icons.person,
//                             color:
//                                 user.role == "Admin" ? Colors.blue : Colors.grey,
//                             size: 40,
//                           ),
//                           title: Text(
//                             user.name,
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(user.email),
//                               const SizedBox(height: 4),
//                               Text(
//                                 "${user.role} • ${isBlocked ? "Blocked" : "Active"}",
//                                 style: TextStyle(
//                                   color: isBlocked ? Colors.red : Colors.green,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           trailing: Column(
//                             children: [
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () {
//                                       _deleteUser(context);
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       isBlocked
//                                           ? Icons.lock_open
//                                           : Icons.lock,
//                                       color: isBlocked
//                                           ? Colors.green
//                                           : Colors.black,
//                                     ),
//                                     onPressed: () {},
//                                   ),
//                                 ],
//                               ),
//                               TextButton(
//                                 onPressed: () {},
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) =>
//                                   //         UserDetailScreen(user: user),
//                                   //   ),
                                  
                                
//                                 child: const Text(
//                                   "View Details",
//                                   style: TextStyle(
//                                     color: Colors.blueAccent,
//                                     fontWeight: FontWeight.bold,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }

//   Future<void> _deleteUser(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Delete User"),
//         content: const Text("Are you sure want to delete this user?"),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           TextButton(onPressed: () {}, child: const Text("Delete")),
//         ],
//       ),
//     );
//   }
// }
// import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
// import 'package:e_commerce/user/user_model.dart';
// import 'package:e_commerce/user/views/user_details.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserManagement extends StatefulWidget {
//   const UserManagement({super.key});

//   @override
//   State<UserManagement> createState() => _UserManagementState();
// }

// class _UserManagementState extends State<UserManagement> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch users once when screen loads
//     Future.microtask(() =>
//         Provider.of<UserProvider>(context, listen: false).fetchUsers());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final List<AppUser> users = userProvider.users;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("User Management"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // TODO: implement search feature
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_alt),
//             onPressed: () {
//               // TODO: implement filter feature
//             },
//           ),
//         ],
//       ),

//       // BODY SECTION
//       body: userProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : users.isEmpty
//               ? const Center(
//                   child: Text("No users found"),
//                 )
//               : ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final user = users[index];
//                     bool isBlocked = user.status == "blocked";

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 6),
//                       child: Card(
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(12),
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.purple.shade100,
//                             child: Icon(
//                               Icons.person,
//                               color: user.role == "Admin"
//                                   ? Colors.blue
//                                   : Colors.purple,
//                             ),
//                           ),
//                           title: Text(
//                             user.name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 4),
//                               Text(user.email),
//                               const SizedBox(height: 6),
//                               Text(
//                                 "${user.role} • ${isBlocked ? "Blocked" : "Active"}",
//                                 style: TextStyle(
//                                   color: isBlocked
//                                       ? Colors.red
//                                       : Colors.green.shade700,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () {
//                                       _deleteUser(context, user.id);
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(
//                                       isBlocked
//                                           ? Icons.lock_open
//                                           : Icons.lock,
//                                       color: isBlocked
//                                           ? Colors.green
//                                           : Colors.black,
//                                     ),
//                                     onPressed: () {
//                                       _toggleUserStatus(
//                                           context, user.id, isBlocked);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) =>
//                                   //         UserDetailScreen(user: user),
//                                   //   ),
//                                   // );
//                                 },
//                                 child: const Text(
//                                   "View Details",
//                                   style: TextStyle(
//                                     color: Colors.blueAccent,
//                                     fontWeight: FontWeight.bold,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }

//   // Confirm Delete Dialog
//   Future<void> _deleteUser(BuildContext context, String? userId) async {
//     if (userId == null) return;
//     final userProvider =
//         Provider.of<UserProvider>(context, listen: false);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Delete User"),
//         content:
//             const Text("Are you sure you want to permanently delete this user?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               await userProvider.deleteUser(userId);
//             },
//             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   // Toggle user block/unblock
//   Future<void> _toggleUserStatus(
//       BuildContext context, String? userId, bool isBlocked) async {
//     if (userId == null) return;
//     final userProvider =
//         Provider.of<UserProvider>(context, listen: false);

//     // await userProvider.updateUserStatus(
//     //   userId,
//     //   isBlocked ? "active" : "blocked",
//     // );
//   }
// }
// import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
// import 'package:e_commerce/user/user_model.dart';
// import 'package:e_commerce/user/views/user_details.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UserManagement extends StatefulWidget {
//   const UserManagement({super.key});

//   @override
//   State<UserManagement> createState() => _UserManagementState();
// }

// class _UserManagementState extends State<UserManagement> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() => Provider.of<UserProvider>(context, listen: false).fetchUsers());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     final List<AppUser> users = userProvider.users;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("User Management"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_alt),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: userProvider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : users.isEmpty
//               ? const Center(child: Text("No users found"))
//               : ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     final user = users[index];
//                     bool isBlocked = user.status == "blocked";

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                       child: Card(
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4),
//                           child: ListTile(
//                             contentPadding: const EdgeInsets.all(10),
//                             leading: CircleAvatar(
//                               backgroundColor: Colors.purple.shade100,
//                               child: Icon(
//                                 Icons.person,
//                                 color: user.role == "Admin" ? Colors.blue : Colors.purple,
//                               ),
//                             ),
//                             title: Text(
//                               user.name,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(user.email),
//                                 const SizedBox(height: 6),
//                                 Text(
//                                   "${user.role} • ${isBlocked ? "Blocked" : "Active"}",
//                                   style: TextStyle(
//                                     color: isBlocked ? Colors.red : Colors.green.shade700,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             trailing: Container(
//   // Try shrinking the trailing section
//   width: 100,
//   constraints: const BoxConstraints(
//     minHeight: 10, // minimum height
//     maxHeight: 80, // maximum height
//   ),
//   alignment: Alignment.center,
//   child: Column(
//     mainAxisSize: MainAxisSize.min, // prevent overexpansion
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.delete, color: Colors.red, size: 21),
//             onPressed: () {
//               _deleteUser(context, user.id);
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               isBlocked ? Icons.lock_open : Icons.lock,
//               color: isBlocked ? Colors.green : Colors.black,
//               size: 21,
//             ),
//             onPressed: () {
//               _toggleUserStatus(context, user.id, isBlocked);
//             },
//           ),
//         ],
//       ),
//       Flexible(
//         child: TextButton(
//           style: TextButton.styleFrom(padding: EdgeInsets.zero),
//           onPressed: () {},
//           child: const Text(
//             "View Details",
//             style: TextStyle(
//               color: Colors.blueAccent,
//               fontWeight: FontWeight.bold,
//               decoration: TextDecoration.underline,
//               fontSize: 13,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

//                             // trailing: SizedBox(
//                             //   width: 100,
//                             //   child: Column(
//                             //     mainAxisSize: MainAxisSize.min,
//                             //     children: [
//                             //       Row(
//                             //         mainAxisSize: MainAxisSize.min,
//                             //         children: [
//                             //           IconButton(
//                             //             icon: const Icon(Icons.delete, color: Colors.red, size: 21),
//                             //             onPressed: () {
//                             //               _deleteUser(context, user.id);
//                             //             },
//                             //           ),
//                             //           IconButton(
//                             //             icon: Icon(
//                             //               isBlocked ? Icons.lock_open : Icons.lock,
//                             //               color: isBlocked ? Colors.green : Colors.black,
//                             //               size: 21,
//                             //             ),
//                             //             onPressed: () {
//                             //               _toggleUserStatus(context, user.id, isBlocked);
//                             //             },
//                             //           ),
//                             //         ],
//                             //       ),
//                             //       TextButton(
//                             //         style: TextButton.styleFrom(padding: EdgeInsets.zero),
//                             //         onPressed: () {
//                             //           // Navigator.push(
//                             //           //   context,
//                             //           //   MaterialPageRoute(
//                             //           //     builder: (context) => UserDetailScreen(user: user),
//                             //           //   ),
//                             //           // );
//                             //         },
//                             //         child: const Text(
//                             //           "View Details",
//                             //           style: TextStyle(
//                             //             color: Colors.blueAccent,
//                             //             fontWeight: FontWeight.bold,
//                             //             decoration: TextDecoration.underline,
//                             //             fontSize: 13,
//                             //           ),
//                             //         ),
//                             //       ),
//                             //     ],
//                             //   ),
//                             // ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }

//   Future<void> _deleteUser(BuildContext context, String? userId) async {
//     if (userId == null) return;
//     final userProvider = Provider.of<UserProvider>(context, listen: false);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Delete User"),
//         content: const Text("Are you sure you want to permanently delete this user?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               await userProvider.deleteUser(userId);
//             },
//             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _toggleUserStatus(BuildContext context, String? userId, bool isBlocked) async {
//     if (userId == null) return;
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     // await userProvider.updateUserStatus(userId, isBlocked ? "active" : "blocked");
//   }
// }
