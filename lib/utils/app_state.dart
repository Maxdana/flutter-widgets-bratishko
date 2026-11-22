
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  List<Product> _favoriteProducts = [];
  List<Product> _cartProducts = [];
  User? _currentUser;

  List<Product> get favoriteProducts => List.unmodifiable(_favoriteProducts);
  List<Product> get cartProducts => List.unmodifiable(_cartProducts);
  User? get currentUser => _currentUser;
  int get cartItemsCount => _cartProducts.length;

  void setCurrentUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

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

  void addToCart(Product product) {
    if (product.id.isEmpty) {
      debugPrint('Помилка: ID товару порожній');
      return;
    }

    try {
      _cartProducts = List.from(_cartProducts)..add(product);
      notifyListeners();
    } catch (e) {
      debugPrint('Помилка додавання до кошика: $e');
    }
  }
}
