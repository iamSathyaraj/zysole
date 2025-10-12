// import 'package:flutter/material.dart';
// class OrdersScreen extends StatelessWidget {
//   final List<Map<String, String>> datas = [
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"}   
//     ];
//   OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//        title: Text("Order list"),  
//        backgroundColor: const Color(0xFFF7F5F5),    ),
//       backgroundColor: const Color(0xFFF7F5F5),
//       body: ListView.builder(
//         itemCount: datas.length,
//         itemBuilder: (context, index) {
//           final data=datas[index];
//           return
//         Container(
//           height: 120,
//           child: Card(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             margin: const EdgeInsets.all(8),
//             child: ListTile(
//               title: Text(data["name"]??""),
//               subtitle: Text(data["email"]??""),
//               trailing: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:  [
//                   Text(data["price"]??"",
//                   style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 18),),
//                   Text(data["quantity"]??"",
//                   style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 16),),
//                 ],
//               ),
//             ),
//           ),
//         );
//   }
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// class OrdersScreen extends StatelessWidget {
//   final List<Map<String, String>> datas = [
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"280"},
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"450"},
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"600"} ,
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"300"} ,
//    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"500"}   
//     ];
//   OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//        title: Text("Order list"),  
//        backgroundColor: const Color(0xFFF7F5F5),  
//        ),
//       backgroundColor: const Color(0xFFF7F5F5),
//       body: ListView.builder(
//         itemCount: datas.length,
//         itemBuilder: (context, index) {
//           final data=datas[index];
//           return
//         Container(
//           height: 120,
//           child: Card(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             margin: const EdgeInsets.all(8),
//             child: ListTile(
//               title: Text(data["name"]??""),
//               subtitle: Text(data["email"]??""),
//               trailing: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:  [
//                   Text(data["price"]??"",
//                   style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 18),),
//                   Text(data["quantity"]??"",
//                   style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 16),),
//                 ],
//               ),
//             ),
//           ),
//         );
//   }
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
    final List<String> statuses = ["Pending", "Shipped", "Delivered", "Cancelled"];
 

  final List<Map<String, dynamic>> orders = [
    {
      'orderId': 'ORD123456',
      'customerName': 'Sreehari',
      'date': '2025-09-15',
      'status': 'Pending',
      'amount': 120.5,
    },
    {
      'orderId': 'ORD123457',
      'customerName': 'Fabin',
      'date': '2025-09-14',
      'status': 'Delivered',
      'amount': 89.99,
    },
    {
      'orderId': 'ORD123458',
      'customerName': 'Thoufee',
      'date': '2025-09-13',
      'status': 'Cancelled',
      'amount': 45.0,
    },
    {
      'orderId': 'ORD123459',
      'customerName': 'Bijoy',
      'date': '2025-09-12',
      'status': 'Shipped',
      'amount': 200.0,
    },
  ];
  

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'shipped':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Orders List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount: orders.length,
        separatorBuilder: (_, __) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order ID & Amount row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order: ${order['orderId']}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '\$${order['amount'].toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Customer Name
                  Text(
                    'Customer: ${order['customerName']}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),

                  // Date & Status Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date: ${order['date']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                       DropdownButton<String>(
                        value: order['status'],
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: statusColor(order['status']),
                          fontWeight: FontWeight.w600,
                        ),
                        underline: Container(
                          height: 1,
                          color: Colors.deepPurple,
                        ),
                        items: statuses.map((status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(
                              status,
                              style: TextStyle(color: statusColor(status)),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            orders[index]['status'] = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// // import 'package:flutter/material.dart';
// // class OrdersScreen extends StatelessWidget {
// //   final List<Map<String, String>> datas = [
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"},
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"} ,
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"uytgfigh"}   
// //     ];
// //   OrdersScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //        title: Text("Order list"),  
// //        backgroundColor: const Color(0xFFF7F5F5),    ),
// //       backgroundColor: const Color(0xFFF7F5F5),
// //       body: ListView.builder(
// //         itemCount: datas.length,
// //         itemBuilder: (context, index) {
// //           final data=datas[index];
// //           return
// //         Container(
// //           height: 120,
// //           child: Card(
// //             color: const Color.fromARGB(255, 255, 255, 255),
// //             margin: const EdgeInsets.all(8),
// //             child: ListTile(
// //               title: Text(data["name"]??""),
// //               subtitle: Text(data["email"]??""),
// //               trailing: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children:  [
// //                   Text(data["price"]??"",
// //                   style: TextStyle(fontWeight: FontWeight.bold,
// //                   fontSize: 18),),
// //                   Text(data["quantity"]??"",
// //                   style: TextStyle(fontWeight: FontWeight.bold,
// //                   fontSize: 16),),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //   }
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // class OrdersScreen extends StatelessWidget {
// //   final List<Map<String, String>> datas = [
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"280"},
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"450"},
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"600"} ,
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"300"} ,
// //    { "name": "sdfdsf","email": "EFDafad@gmail.com","quantity": "WQEWDSA","price":"500"}   
// //     ];
// //   OrdersScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //        title: Text("Order list"),  
// //        backgroundColor: const Color(0xFFF7F5F5),  
// //        ),
// //       backgroundColor: const Color(0xFFF7F5F5),
// //       body: ListView.builder(
// //         itemCount: datas.length,
// //         itemBuilder: (context, index) {
// //           final data=datas[index];
// //           return
// //         Container(
// //           height: 120,
// //           child: Card(
// //             color: const Color.fromARGB(255, 255, 255, 255),
// //             margin: const EdgeInsets.all(8),
// //             child: ListTile(
// //               title: Text(data["name"]??""),
// //               subtitle: Text(data["email"]??""),
// //               trailing: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children:  [
// //                   Text(data["price"]??"",
// //                   style: TextStyle(fontWeight: FontWeight.bold,
// //                   fontSize: 18),),
// //                   Text(data["quantity"]??"",
// //                   style: TextStyle(fontWeight: FontWeight.bold,
// //                   fontSize: 16),),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //   }
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// class OrdersScreen extends StatefulWidget {
//   const OrdersScreen({super.key});

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//     final List<String> statuses = ["Pending", "Shipped", "Delivered", "Cancelled"];
 

//   final List<Map<String, dynamic>> orders = [
//     {
//       'orderId': 'ORD123456',
//       'customerName': 'Sreehari',
//       'date': '2025-09-15',
//       'status': 'Pending',
//       'amount': 120.5,
//     },
//     {
//       'orderId': 'ORD123457',
//       'customerName': 'Fabin',
//       'date': '2025-09-14',
//       'status': 'Delivered',
//       'amount': 89.99,
//     },
//     {
//       'orderId': 'ORD123458',
//       'customerName': 'Thoufee',
//       'date': '2025-09-13',
//       'status': 'Cancelled',
//       'amount': 45.0,
//     },
//     {
//       'orderId': 'ORD123459',
//       'customerName': 'Bijoy',
//       'date': '2025-09-12',
//       'status': 'Shipped',
//       'amount': 200.0,
//     },
//   ];
  

//   Color statusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'pending':
//         return Colors.orange;
//       case 'completed':
//         return Colors.green;
//       case 'cancelled':
//         return Colors.red;
//       case 'shipped':
//         return Colors.blue;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders List'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: ListView.separated(
//         padding: EdgeInsets.all(12),
//         itemCount: orders.length,
//         separatorBuilder: (_, __) => SizedBox(height: 12),
//         itemBuilder: (context, index) {
//           final order = orders[index];
//           return Card(
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Order ID & Amount row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Order: ${order['orderId']}',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                       ),
//                       Text(
//                         '\$${order['amount'].toStringAsFixed(2)}',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),

//                   // Customer Name
//                   Text(
//                     'Customer: ${order['customerName']}',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   SizedBox(height: 4),

//                   // Date & Status Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Date: ${order['date']}',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                        DropdownButton<String>(
//                         value: order['status'],
//                         dropdownColor: Colors.white,
//                         style: TextStyle(
//                           color: statusColor(order['status']),
//                           fontWeight: FontWeight.w600,
//                         ),
//                         underline: Container(
//                           height: 1,
//                           color: Colors.deepPurple,
//                         ),
//                         items: statuses.map((status) {
//                           return DropdownMenuItem<String>(
//                             value: status,
//                             child: Text(
//                               status,
//                               style: TextStyle(color: statusColor(status)),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           setState(() {
//                             orders[index]['status'] = value!;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }