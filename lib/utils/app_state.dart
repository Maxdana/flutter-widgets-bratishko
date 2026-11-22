
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  List<Product> _favoriteProducts = [];
  User? _currentUser;
  int _cartItemsCount = 0;

  // Отримання даних
  List<Product> get favoriteProducts => List.unmodifiable(_favoriteProducts);

  User? get currentUser => _currentUser;

  int get cartItemsCount => _cartItemsCount;

  // Зміна користувача
  void setCurrentUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  // Додавання або видалення з обраного
  void toggleFavorite(Product product) {
    if (product.id.isEmpty) {
      return;
    }

    _favoriteProducts = List.from(_favoriteProducts);

    if (_favoriteProducts.any((item) => item.id == product.id)) {
      _favoriteProducts.removeWhere((item) => item.id == product.id);
    } else {
      _favoriteProducts.add(product);
    }

    notifyListeners();
  }

  // Додавання товару до кошика
  void addToCart(Product product) {
    if (product.id.isEmpty) {
      return;
    }

    _cartItemsCount++;
    notifyListeners();
  }
}
