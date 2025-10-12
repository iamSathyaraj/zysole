
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:e_commerce/admin/views/product/admin_edit_product.dart';
import 'package:e_commerce/admin/views/product/admin_product_detail_rogh.dart';
import 'package:e_commerce/admin/views/product/admin_product_list.dart';
import 'package:e_commerce/user/views/newscreen.dart';
import 'package:e_commerce/user/views/users_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider=Provider.of<ProductProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Admin Dashboard")),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminEditProduct()));
          },child:  _buildStatCard("Add Products", "120", Icons.add)),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProductListScreen()));
          }, child: _buildStatCard("Total Products", productProvider.products.length.toString() , Icons.shopping_bag)),
          _buildStatCard("Orders Pending", "15", Icons.pending_actions),
          _buildStatCard("Revenue", "\$12,340", Icons.attach_money),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserManagementScreen()));
          }, child: _buildStatCard("Users", "350", Icons.people)),
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
                Icon(icon, size: 40, color: const Color.fromARGB(255, 255, 255, 255)),
                const SizedBox(height: 12),
                Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(title, style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255))),
              ],
            ),
          ),
        ),
      );
  }
}

// import 'package:e_commerce/controllers/product_provider.dart';
// import 'package:e_commerce/models/product_model.dart';
// import 'package:e_commerce/views/admin/admin_edit_product.dart';
// import 'package:e_commerce/views/admin/admin_product_list.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final productProvider=Provider.of<ProductProvider>(context,listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Admin Dashboard")),
//       body: GridView.count(
//         padding: const EdgeInsets.all(16),
//         crossAxisCount: 2,
//         crossAxisSpacing: 12,
//         mainAxisSpacing: 12,
//         children: [
//           GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminAddProduct()));
//           },child:  _buildStatCard("Add Products", "120", Icons.add)),
//           GestureDetector(onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProductListScreen()));
//           }, child: _buildStatCard("Total Products", productProvider.products.length.toString() , Icons.shopping_bag)),
//           _buildStatCard("Orders Pending", "15", Icons.pending_actions),
//           _buildStatCard("Revenue", "\$12,340", Icons.attach_money),
//           _buildStatCard("Users", "350", Icons.people),
//         ], 
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon) {
//     return Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15)
//         ),
//         elevation: 4,
//         child: Container(width: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             gradient: LinearGradient(colors: [const Color.fromARGB(255, 151, 69, 166), const Color.fromARGB(255, 131, 90, 202)])
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 40, color: const Color.fromARGB(255, 255, 255, 255)),
//                 const SizedBox(height: 12),
//                 Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 Text(title, style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255))),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }

