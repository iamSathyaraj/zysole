
// import 'package:flutter/material.dart';

// class OrderDetailsScreen extends StatelessWidget {
//   const OrderDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> orderData = {
//       'customerName': 'John Doe',
//       'customerEmail': 'john@example.com',
//       'customerAddress': '123 Main Street, New York, USA',
//       'orderId': 'ORD123456',
//       'orderDate': 'Oct 5, 2025',
//       'paymentMethod': 'UPI',
//       'status': 'Delivered',
//       'items': [
//         {
//           'name': 'Nike Sneakers',
//           'quantity': 1,
//           'price': 4999,
//           'image': 'https://via.placeholder.com/150'
//         },
//         {
//           'name': 'Blue Denim Shirt',
//           'quantity': 2,
//           'price': 1299,
//           'image': 'https://via.placeholder.com/150'
//         },
//       ],
//       'subtotal': 7597,
//       'shipping': 50,
//       'total': 7647,
//     };

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Order Details', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // 🧍 Customer Info Card
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 35,
//                       backgroundColor: Colors.grey[300],
//                       child: Icon(Icons.person, size: 40, color: Colors.grey[800]),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(orderData['customerName'],
//                               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 5),
//                           Text(orderData['customerEmail'],
//                               style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                           const SizedBox(height: 5),
//                           Text(orderData['customerAddress'],
//                               style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Order Information',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 10),
//                     _buildInfoRow('Order ID', orderData['orderId'].toString()),
//                     _buildInfoRow('Order Date', orderData['orderDate'].toString()),
//                     _buildInfoRow('Payment Method', orderData['paymentMethod'].toString()),
//                     _buildInfoRow('Status', orderData['status'].toString()),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // 🛒 Product List
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Products',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 10),
//                     ...List.generate(orderData['items'].length, (index) {
//                       final product = orderData['items'][index];
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 12),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 product['image'],
//                                 height: 60,
//                                 width: 60,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(product['name'].toString(),
//                                       style: const TextStyle(
//                                           fontSize: 16, fontWeight: FontWeight.bold)),
//                                   const SizedBox(height: 4),
//                                   Text('Qty: ${product['quantity']}',
//                                       style: TextStyle(color: Colors.grey[600])),
//                                 ],
//                               ),
//                             ),
//                             Text("₹${product['price']}",
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // 💰 Payment Summary
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Payment Summary',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 10),
//                     _buildInfoRow('Subtotal', "₹${orderData['subtotal'].toString()}"),
//                     _buildInfoRow('Shipping', "₹${orderData['shipping'].toString()}"),
//                     const Divider(),
//                     _buildInfoRow('Total', "₹${orderData['total'].toString()}",
//                         valueColor: Colors.green, isBold: true),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // 🖤 Back Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: const Text(
//                   "Back to Orders",
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔧 Helper widget for key-value rows
//   static Widget _buildInfoRow(String label, String value,
//       {Color? valueColor, bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               color: valueColor ?? Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
