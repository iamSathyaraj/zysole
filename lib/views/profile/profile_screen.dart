import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/auth/login_screen.dart';
import 'package:e_commerce/user/views/address_screen.dart';
import 'package:e_commerce/views/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
//   }
// }

// class ProfileScreens extends StatelessWidget {
//   const ProfileScreens({super.key});
  
@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
  Provider.of<AuthProvider>(context, listen: false).fetchCurrentUser();
});

  }

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

 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      appBar: AppBar(
        title: Text('Account Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
     body: user == null
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            const Text("Loading profile..."),
            TextButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text("Logout & Try Again"),
            ),
          ],
        ),
      )
    :
      ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color.fromARGB(98, 102, 48, 196),const Color.fromARGB(255, 146, 98, 230)])
                ,
              color: const Color.fromARGB(255, 44, 107, 178),
               borderRadius: BorderRadius.circular(20)
              ),
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
          ),
          Divider(height: 40),
          Card(
            color: Colors.white,
            child: Column(
              children: [
                  ListTile(
              leading: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0x41683AB7),), padding: EdgeInsets.all(5), child: Icon(Icons.history, color: Colors.deepPurple)),
              title: Text('Order History'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
                        Divider(),

            ListTile(
              leading:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0x41683AB7),), padding: EdgeInsets.all(5), child: Icon(Icons.payment, color: Colors.deepPurple)),
              title: Text('Payment Methods'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
            Divider(),

            ListTile(
              leading: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0x41683AB7),), padding: EdgeInsets.all(5), child: Icon(Icons.location_on, color: Colors.deepPurple)),
              title: Text('Addresses'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0x41683AB7),), padding: EdgeInsets.all(5), child: Icon(Icons.notifications, color: Colors.deepPurple)),
              title: Text('Notification Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
              },
            ),
                        Divider(),

            ListTile(
              leading: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0x63683AB7),), padding: EdgeInsets.all(5), child: Icon(Icons.help, color: Colors.deepPurple)),
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