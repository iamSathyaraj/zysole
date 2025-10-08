import 'package:e_commerce/views/admin/admin_dashboard.dart';
import 'package:e_commerce/views/admin/admin_product_list.dart';
import 'package:e_commerce/views/admin/order_list.dart';
import 'package:e_commerce/views/admin/user_management.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/controllers/auth_provider.dart' as custom_auth_provider;
// import 'package:e_commerce_example/screens/admin_dashboard.dart';
// import 'package:e_commerce_example/screens/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class AdminDashboard extends StatelessWidget {
  
class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
   final List<Widget>_screens=[
    DashboardScreen(),
    UserManagement(),
    OrdersScreen(),
    AdminProductListScreen(),
    LoginScreen()
    

  ];
 int selectedIndex=0;

 void onTapping(int index){
  setState(() {
    selectedIndex=index;
  });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.admin_panel_settings, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text("Admin Panel", style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                onTapping(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("User Management"),
              onTap: () {
                onTapping(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Orders Management"),
              onTap: () {
                onTapping(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text("products management"),
              onTap: () {
               
               onTapping(3);
                Navigator.pop(context);
              },
            ),
          
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () async{
              
                Navigator.pop(context);
                await Provider.of<custom_auth_provider.AuthProvider>(context, listen: false).logout();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        ),
      ),  
      body: _screens[selectedIndex],
    );
  }
}