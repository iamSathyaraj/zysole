// import 'dart:math';
import 'dart:developer';


import 'package:e_commerce/user/models/cart_model.dart';
import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final CartService _cartService = CartService();

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //  String _setError;
  // String get serError=>_setError;

  void loadCart(String userId) {
    _isLoading = true;
    notifyListeners();

    _cartService.getUserCart(userId).listen((items) {
      _cartItems = items;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addToCart(CartItem item) async {
    try {
      CartItem? existingItem =
          await _cartService.getCartItemByProduct(item.userId, item.productId);

      if (existingItem != null) {
        final updatedItem = CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          userId: existingItem.userId,
          name: existingItem.name,
          imageUrl: existingItem.imageUrl,
          price: existingItem.price,
          quantity: existingItem.quantity + item.quantity,
          color: item.color ?? existingItem.color,
          size: item.size ?? existingItem.size,
        );

        await _cartService.updateCartItem(updatedItem);
      } else {

        await _cartService.addToCart(item);
      }
    } catch (e) {
      // _setError=e.toString;
      log('Error adding to cart in provider: $e');
    }
  }

  Future<void> removeFromCart(String cartItemId) async {
    try {
      await _cartService.removeCartItem(cartItemId);
    } catch (e) {
      log('Error removing from cart in provider: $e');
    }
  }

  double get totalPrice {
  double total = 0;
  for (var item in _cartItems) {
    total += item.price * item.quantity;
  }
  return total;
}

int get totalItems {
  int count = 0;
  for (var item in _cartItems) {
    count += item.quantity;
  }
  return count;
}


  /// Clear all cart items for a user
  // Future<void> clearCart(String userId) async {
  //   try {
  //     await _cartService.clearCart(userId);
  //   } catch (e) {
  //     print('Error clearing cart in provider: $e');
  //   }
  // }





  // int get totalItems {
  //   return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  // }

  // double get totalPrice {
  //   return _cartItems.fold(
  //       0, (sum, item) => sum + (item.price * item.quantity));
  // }
}
