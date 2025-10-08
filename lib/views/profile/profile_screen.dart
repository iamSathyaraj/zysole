import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
     Future<void> showLogoutDialog(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              try {
                await authProvider.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Logout failed: $e")),
                );
              }
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
     final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    //  final userName = "Hello";
    // final userEmail = "hello@gmail.com";

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      appBar: AppBar(
        title: Text('Account Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: user==null? const Center(
        child: CircularProgressIndicator(),
      ):
      ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: 
                    user.profileImage !=null && user.profileImage!.isNotEmpty 
                    ? NetworkImage(user.profileImage!):
                    const AssetImage('assets/profile_placeholder.png')
                ),
                SizedBox(height: 12),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                  },
                  child: Text('Edit Profile',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
          Divider(height: 40),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                  ListTile(
              leading: Icon(Icons.history, color: Colors.deepPurple),
              title: Text('Order History'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
                        Divider(),

            ListTile(
              leading: Icon(Icons.payment, color: Colors.deepPurple),
              title: Text('Payment Methods'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
                        Divider(),

            ListTile(
              leading: Icon(Icons.location_on, color: Colors.deepPurple),
              title: Text('Addresses'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.deepPurple),
              title: Text('Notification Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
                        Divider(),

            ListTile(
              leading: Icon(Icons.help, color: Colors.deepPurple),
              title: Text('Support & Help'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
              ],
            ),
          ),
        
          Divider(height: 40),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: Text('Logout', style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}