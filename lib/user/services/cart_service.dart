
// import 'dart:math';
import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/user/models/cart_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _cartCollection = 'carts';

  Future<void> addToCart(CartItem item) async {
    try {
      await _firestore
          .collection(_cartCollection)
          .doc(item.id)
          .set(item.toMap());
    } catch (e) {
      log('Error adding to cart: $e');
      rethrow;
    }
  }

  Future<void> updateCartItem(CartItem item) async {
    try {
      await _firestore
          .collection(_cartCollection)
          .doc(item.id)
          .update(item.toMap());
    } catch (e) {
      log('Error updating cart item: $e');
      rethrow;
    }
  }

  Future<void> removeCartItem(String cartItemId) async {
    try {
      await _firestore.collection(_cartCollection).doc(cartItemId).delete();
    } catch (e) {
      log('Error removing cart item: $e');
      rethrow;
    }
  }

  

  Stream<List<CartItem>> getUserCart(String userId) {
    return _firestore
        .collection(_cartCollection)
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList());
  }

  Future<CartItem?> getCartItemByProduct(
      String userId, String productId) async {
    final snapshot = await _firestore
        .collection(_cartCollection)
        .where('userId', isEqualTo: userId)
        .where('productId', isEqualTo: productId)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return CartItem.fromMap(snapshot.docs.first.data());
    }
    return null;
  }
}

