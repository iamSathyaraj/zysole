import 'package:flutter/material.dart';
class OrdersScreen extends StatelessWidget {
  final List<Map<String, String>> datas = [
   { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
   { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
   { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
   { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
   { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"}   
    ];
  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       title: Text("Order list"),  
       backgroundColor: const Color(0xFFF7F5F5),    ),
      backgroundColor: const Color(0xFFF7F5F5),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          final data=datas[index];
          return
        Container(
          height: 120,
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(data["name"]??""),
              subtitle: Text(data["email"]??""),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(data["price"]??"",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 18),),
                  Text(data["quantity"]??"",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16),),
                ],
              ),
            ),
          ),
        );
  }
      ),
    );
  }
}
