
import 'package:flutter_test/flutter_test.dart';
import 'package:budynok_slovo/models/product.dart';
import 'package:budynok_slovo/models/user.dart';
import 'package:budynok_slovo/utils/app_state.dart';

void main() {
  const product = Product(
    id: '1',
    name: 'Я (Романтика)',
    author: 'Микола Хвильовий',
    price: 150,
    imagePath: 'assets/images/romantyka.jpg',
  );

  group('AppState Tests', () {
    test('should add and remove favorite product', () {
      final appState = AppState();

      appState.toggleFavorite(product);
      expect(appState.favoriteProducts.length, 1);

      appState.toggleFavorite(product);
      expect(appState.favoriteProducts.length, 0);
    });

    test('should increase cart items count', () {
      final appState = AppState();

      expect(appState.cartItemsCount, 0);

      appState.addToCart(product);
      expect(appState.cartItemsCount, 1);

      appState.addToCart(product);
      expect(appState.cartItemsCount, 2);
    });

    test('should save current user', () {
      final appState = AppState();

      const user = User(
        name: "Петрик П'яточкін",
        email: 'Petruk@ukr.net',
        avatarPath: 'assets/images/Petruk.jpg',
      );

      appState.setCurrentUser(user);

      expect(appState.currentUser, user);
    });
  });
}
