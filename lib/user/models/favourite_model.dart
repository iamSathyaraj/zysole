class Favorite {
  final String id;
  final String userId;
  final String productId;

  Favorite({required this.id, required this.userId, required this.productId});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'productId': productId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map, String id) {
    return Favorite(
      id: id,
      userId: map['userId'],
      productId: map['productId'],
    );
  }
}
