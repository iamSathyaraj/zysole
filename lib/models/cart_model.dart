
class CartItem {
  final String id; 
  final String productId; 
  final String userId; 
  final String name; 
  final String? imageUrl; 
  final double price; 
  final int quantity; 
  final String? color; 
  final String? size; 

  CartItem({
    required this.id,
    required this.productId,
    required this.userId,
    required this.name,
    this.imageUrl,
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
      'imageUrl': imageUrl,
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
      imageUrl: map['imageUrl'],
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 1,
      color: map['color'],
      size: map['size'],
    );
  }
}
