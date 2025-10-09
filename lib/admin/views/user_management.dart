import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
import 'package:e_commerce/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({super.key});

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
                trailing: Row(
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
                  ],
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
