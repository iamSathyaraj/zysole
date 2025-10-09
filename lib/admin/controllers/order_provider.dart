import 'package:flutter/material.dart';
import 'package:e_commerce/admin/models/order_model.dart';
import 'package:e_commerce/admin/services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService = OrderService();

  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void fetchOrders() {
    _setLoading(true);
    _orderService.getOrders().listen(
      (ordersList) {
        _orders = ordersList;
        _setError(null);
        _setLoading(false);
      },
      onError: (error) {
        _setError(error.toString());
        _setLoading(false);
      }
    );
  }

   Future<void> addOrder(OrderModel order) async {
    _setLoading(true);
    try {
      await _orderService.createOrder(order);
      _setError(null);
    } catch (e) {
      _setError('Error adding order: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateOrder( String orderId, OrderModel order) async {
    _setLoading(true);
    try {
      await _orderService.updateOrder(orderId, order);
      _setError(null);
    } catch (e) {
      _setError('Error updating order: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteOrder(String orderId) async {
    _setLoading(true);
    try {
      await _orderService.deleteOrder(orderId);
      _setError(null);
    } catch (e) {
      _setError('Error deleting order: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<OrderModel?> getOrderById(String id) async {
    try {
      return await _orderService.getOrderById(id);
    } catch (e) {
      _setError('Error fetching order: $e');
      return null;
    }
  }
}
