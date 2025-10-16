
import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:e_commerce/admin/views/product/admin_add_product.dart';
import 'package:e_commerce/admin/views/product/admin_edit_product.dart';
import 'package:e_commerce/admin/views/product/admin_product_detail_rogh.dart';
import 'package:e_commerce/admin/views/product/admin_product_list.dart';
import 'package:e_commerce/user/views/newscreen.dart';
import 'package:e_commerce/user/views/users_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

  class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  void initState() {
    super.initState();
    final productProvider=Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProducts();
    final usersCount = Provider.of<UserProvider>(context,listen: false);
    usersCount.fetchUsers();

  }
  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();


// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

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
          GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));

          },child:  Consumer<ProductProvider>(builder: (context, value, child) => 
             _buildStatCard("Add Products", value.products.length
            .toString(), Icons.add),
          )
          ),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProductListScreen()));

          }, child: Consumer<ProductProvider>(builder: (context, value, child) => 
            _buildStatCard("Total Products", value.products.length.toString() , Icons.shopping_bag))),
          _buildStatCard("Orders Pending",  "15", Icons.pending_actions),
          _buildStatCard("Revenue", "\$12,340", Icons.attach_money),
          GestureDetector(onTap: (){
          }, child: Consumer<UserProvider>(builder: (context, userValue, child) =>
             _buildStatCard("Users", userValue.users.length.toString(), Icons.people))),
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
