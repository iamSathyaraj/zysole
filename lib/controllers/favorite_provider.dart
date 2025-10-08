
import 'package:flutter/material.dart';
import '../services/favorite_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteService _favoriteService = FavoriteService();
  List<String> _favoriteProductIds = [];
  bool _isLoading = false;

  List<String> get favoriteProductIds => _favoriteProductIds;
  bool get isLoading => _isLoading;

  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    _favoriteProductIds = await _favoriteService.getFavorites();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(String productId) async {
    if (_favoriteProductIds.contains(productId)) {
      await _favoriteService.removeFavorite(productId);
      _favoriteProductIds.remove(productId);
    } else {
      await _favoriteService.addFavorite(productId);
      _favoriteProductIds.add(productId);
    }
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }
}

