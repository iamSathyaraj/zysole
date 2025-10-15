import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<String> _categories = ['nike', 'adidas', 'puma']; // initial categories

  List<String> get categories => _categories;

  void addCategory(String newCategory) {
    if (!_categories.contains(newCategory)) {
      _categories.add(newCategory);
      notifyListeners();
    }
  }
}
