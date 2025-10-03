import 'package:flutter/material.dart';
// import 'adminadmin_product_list.dart';
import 'admin_product_add_edit_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDDDDDD),offset: Offset(2, 0)
                  )
                ],
                color: Colors.amber
              ),
            ),
               Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDDDDDD),offset: Offset(2, 0)
                  )
                ],
                color: Colors.amber
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) => ()),
                // );
              },
              icon: Icon(Icons.add),
              label: Text("Add New Product"),
            ),
            SizedBox(height: 20),
            // Expanded(child: ()),
          ],
        ),
      ),
    );
  }
}
