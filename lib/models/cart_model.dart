// class CartItemModel{
//   final String id;
//   final String productId;
//   final String userId;
//   final int quantity;
//   final double price;

//   CartItemModel({
//     required this.id,
//       required this.productId,
//       required this.userId,
//       required this.quantity,
//       required this.price

//   });

//   Map<String, dynamic>toMap(){
//     return{
//       'id':id,
//       'productId':productId,
//       'userId':userId,
//       'quantity':quantity,
//       'price':price

//     };
//   }
//     factory CartItemModel.fromMap(Map<String, dynamic> map) {
//     return CartItemModel(
//       id: map['id'],
//       productId: map['productId'],
//       userId: map['userId'],
//       quantity: map['quantity'],
//       price: map['price'],
//     );
//   }
// }
// class Cart {
//   final String userId;
//   final List<CartItem> items;

//   Cart({
//     required this.userId,
//     required this.items,
//   });
// }

// class CartItem {
//   final String productId;
//   final String name;
//   final int quantity;
//   final String? imageUrl;
//   final double? price;
//   final String? color;
//   final String? size;

//   CartItem({
//     required this.productId,
//     required this.name,
//     required this.quantity,
//     this.imageUrl,
//     this.price,
//     this.color,
//     this.size,
//   });
// }
class CartItem {
  final String id; // cart item document id
  final String productId; // product reference
  final String userId; // which user added this item
  final String name; // product name
  // final String? imageUrl; // product image
  final double price; // product price
  final int quantity; // quantity in cart
  final String? color; // optional (if product variants exist)
  final String? size; // optional (if product variants exist)

  CartItem({
    required this.id,
    required this.productId,
    required this.userId,
    required this.name,
    // this.imageUrl,
    required this.price,
    required this.quantity,
    this.color,
    this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'name': name,
      // 'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      productId: map['productId'],
      userId: map['userId'],
      name: map['name'],
      // imageUrl: map['imageUrl'],
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 1,
      color: map['color'],
      size: map['size'],
    );
  }
}
