import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final String userName;
  final List <OrderItem> orderItems;
  final String orderStatus;
  final double orderAmount;
  final DateTime orderDate;


  OrderModel({
    required this.orderItems,
    required this.userId,
    required this.userName,
    required this.orderStatus,
    required this.orderDate,
    required this.orderAmount,
    required this.orderId
  });

  factory OrderModel.fromMap(Map<String, dynamic>data){
    return OrderModel(
orderItems: (data['orderItems'] as List<dynamic>)
          .map((item) => OrderItem.fromMap(item as Map<String, dynamic>))
          .toList(), 
               userId: data['userId'],
       userName: data['userName'],
        orderStatus: data['orderStatus'],
     orderDate: (data['orderDate'] as Timestamp).toDate(),
         orderAmount: data['orderAmount'],
         orderId: data['orderId'
          
         ]);
  }

  Map<String, dynamic>toJson(){
   return {
      'orderItems': orderItems.map((item) => item.toMap()).toList(),
     'userId':userId,
     'userName':userName,
     'orderStatus':orderStatus,
     'orderDate':orderDate,
     'orderAmount':orderAmount,
     'orderId':orderId
   };
}
}

class OrderItem{
  final String productId;
  final String productName;
  final String image;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.quantity
  });

  
  factory OrderItem.fromMap(Map<String, dynamic> data) {
    return OrderItem(
      productId: data['productId'] ?? '',
      productName: data['productName'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      image: data['image'] ?? '',
      quantity: data['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

}