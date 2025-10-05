// import 'package:flutter/material.dart';
// // import 'adminadmin_product_list.dart';
// import 'admin_product_add_edit_screen.dart';

// class AdminDashboard extends StatelessWidget {
//   const AdminDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Admin Dashboard")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [

//             Container(
//               height: 100,
//               width: 200,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFFDDDDDD),offset: Offset(2, 0)
//                   )
//                 ],
//                 color: Colors.amber
//               ),
//             ),
//                Container(
//               height: 100,
//               width: 200,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFFDDDDDD),offset: Offset(2, 0)
//                   )
//                 ],
//                 color: Colors.amber
//               ),
//             ),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (_) => ()),
//                 // );
//               },
//               icon: Icon(Icons.add),
//               label: Text("Add New Product"),
//             ),
//             SizedBox(height: 20),
//             // Expanded(child: ()),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:e_commerce/views/admin/admin_edit_product.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminAddProduct()));
          },child:  _buildStatCard("Add Products", "120", Icons.add)),
          _buildStatCard("Total Products", "120", Icons.shopping_bag),
          _buildStatCard("Orders Pending", "15", Icons.pending_actions),
          _buildStatCard("Revenue", "\$12,340", Icons.attach_money),
          _buildStatCard("Users", "350", Icons.people),
        ], 
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        child: Container(width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [const Color.fromARGB(255, 151, 69, 166), const Color.fromARGB(255, 131, 90, 202)])
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                const SizedBox(height: 12),
                Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              ],
            ),
          ),
        ),
      );
  }
}
