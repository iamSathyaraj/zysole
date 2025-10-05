import 'package:e_commerce/views/admin/admin_dashboard.dart';
import 'package:e_commerce/views/admin/user_management.dart';
// import 'package:e_commerce_example/screens/admin_dashboard.dart';
// import 'package:e_commerce_example/screens/user_management.dart';
import 'package:flutter/material.dart';

// class AdminDashboard extends StatelessWidget {
  
class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
   final List<Widget>_screens=[
    DashboardScreen(),
    UserManagement()
  ];
 int selectedIndex=0;

 void onTimeTap(int index){
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
                onTimeTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("User Management"),
              onTap: () {
                onTimeTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("Product Management"),
              onTap: () {
                onTimeTap(2);
                Navigator.pushNamed(context, "/products");
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt_long),
              title: Text("Orders"),
              onTap: () {
               
               onTimeTap(3);
                Navigator.pushNamed(context, "/orders");
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Reports"),
              onTap: () {
                onTimeTap(4);
                Navigator.pushNamed(context, "/reports");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
      body: _screens[selectedIndex],
    );
  }
}