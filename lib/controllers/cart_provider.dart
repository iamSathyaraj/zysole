import 'package:e_commerce/models/cart_model.dart';
import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final CartService _cartService = CartService();

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Load user's cart from Firebase
  void loadCart(String userId) {
    _isLoading = true;
    notifyListeners();

    _cartService.getUserCart(userId).listen((items) {
      _cartItems = items;
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Add product to cart
  Future<void> addToCart(CartItem item) async {
    try {
      // Check if the product already exists in cart
      CartItem? existingItem =
          await _cartService.getCartItemByProduct(item.userId, item.productId);

      if (existingItem != null) {
        // If it exists, increase quantity
        final updatedItem = CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          userId: existingItem.userId,
          name: existingItem.name,
          // imageUrl: existingItem.imageUrl,
          price: existingItem.price,
          quantity: existingItem.quantity + item.quantity,
          color: item.color ?? existingItem.color,
          size: item.size ?? existingItem.size,
        );

        await _cartService.updateCartItem(updatedItem);
      } else {
        // If not, add new item
        await _cartService.addToCart(item);
      }
    } catch (e) {
      print('Error adding to cart in provider: $e');
    }
  }

  /// Remove item from cart
  Future<void> removeFromCart(String cartItemId) async {
    try {
      await _cartService.removeCartItem(cartItemId);
    } catch (e) {
      print('Error removing from cart in provider: $e');
    }
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
