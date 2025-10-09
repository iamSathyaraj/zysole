class OrderModel {
  final String orderId;
  final String userId;
  final String userName;
  final String orderItem;
  final String orderStatus;
  final double orderAmount;
  final DateTime orderDate;


  OrderModel({
    required this.orderItem,
    required this.userId,
    required this.userName,
    required this.orderStatus,
    required this.orderDate,
    required this.orderAmount,
    required this.orderId
  });

  factory OrderModel.fromMap(Map<String, dynamic>data){
    return OrderModel(
      orderItem: data['orderItem'], 
      userId: data['userId'],
       userName: data['userName'],
        orderStatus: data['orderStatus'],
        orderDate: data['orderDate'],
         orderAmount: data['orderAmount'],
         orderId: data['orderId'
          
         ]);
  }

  Map<String, dynamic>toJson(){
   return {
     'orderItem':orderItem,
     'userId':orderId,
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