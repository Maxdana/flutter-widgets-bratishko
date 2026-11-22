
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
      debugPrint('Помилка: ID товару порожній');
      return;
    }

    try {
      _favoriteProducts = List.from(_favoriteProducts);

      if (_favoriteProducts.any((item) => item.id == product.id)) {
        _favoriteProducts.removeWhere((item) => item.id == product.id);
      } else {
        _favoriteProducts.add(product);
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Помилка зміни обраного: $e');
    }
  }

  // Додавання товару до кошика
  void addToCart(Product product) {
    if (product.id.isEmpty) {
      debugPrint('Помилка: ID товару порожній');
      return;
    }

    try {
      _cartItemsCount++;
      notifyListeners();
    } catch (e) {
      debugPrint('Помилка додавання до кошика: $e');
    }
  }
}
