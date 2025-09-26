class CartItemModel{
  final String id;
  final String productId;
  final String userId;
  final int quantity;
  final double price;

  CartItemModel({
    required this.id,
      required this.productId,
      required this.userId,
      required this.quantity,
      required this.price

  });

  Map<String, dynamic>toMap(){
    return{
      'id':id,
      'productId':productId,
      'userId':userId,
      'quantity':quantity,
      'price':price

    };
  }
    factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      productId: map['productId'],
      userId: map['userId'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }
}