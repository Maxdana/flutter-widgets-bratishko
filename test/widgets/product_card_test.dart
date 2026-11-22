
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budynok_slovo/models/product.dart';
import 'package:budynok_slovo/widgets/product_card.dart';

void main() {
  const product = Product(
    id: '1',
    name: 'Я (Романтика)',
    author: 'Микола Хвильовий',
    price: 150,
    imagePath: 'assets/images/romantyka.jpg',
  );

  group('ProductCard Tests', () {
    testWidgets('should show product information', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(product: product),
          ),
        ),
      );

      expect(find.text('Я (Романтика)'), findsOneWidget);
      expect(find.text('Микола Хвильовий'), findsOneWidget);
      expect(find.text('150.0 грн'), findsOneWidget);
    });

    testWidgets('should call favorite callback', (tester) async {
      bool favoritePressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              product: product,
              onFavoriteToggle: () {
                favoritePressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.favorite_border));

      expect(favoritePressed, true);
    });

    testWidgets('should call add to cart callback', (tester) async {
      bool addedToCart = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              product: product,
              onAddToCart: () {
                addedToCart = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('До кошика'));

      expect(addedToCart, true);
    });
  });
}
