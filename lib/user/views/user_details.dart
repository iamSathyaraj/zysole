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
  String? errorMessage;
   

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<UserProvider>(context,listen: false).fetchUserById(widget.userId);
    });
  
  }
   

    Future<void>_deleteUser()async{

  return showDialog(
      context: context,
       builder: (context)=>AlertDialog(
      title: Text("Delete User"),
      content: Text("Are you sure want to delete the user"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancel")),
        TextButton(onPressed: () async{
         final userProvider = Provider.of<UserProvider>(context, listen: false);
         await   userProvider.deleteUser(user!.id);
          //  Navigator.pop(context);
          if(context.mounted){
            Navigator.pop(context);
          }
        }, child: Text("Delete"))
      ],
       ));
  }

  //  Future<void> fetchUserDetail() async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //  await userProvider.fetchUserById(widget.userId);
  
  // }
  @override
  Widget build(BuildContext context) {
     final userProvider = context.watch<UserProvider>();

    final isLoading = userProvider.isLoading;
    final user = userProvider.selectedUser;
    final  String? error = userProvider.errorMessage;

        if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (user == null) {
      // if(error!=null){
      return const Scaffold(
        
        body: Center(child: Text("user not found")),
      );
      // }
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
                    height: screenHeight * 0.32, 
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
                          tag: user.email ??"",
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.blue.shade100,
                              child: Text(
                                (user.name != null && user.name.isNotEmpty)
                                    ? user.name[0].toUpperCase()
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
                            user.name ?? "Unknown User",
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
                          user.role ?? "User",
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
                              _deleteUser();
                              // Navigator.pop(context);
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
