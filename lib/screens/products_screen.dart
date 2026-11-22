
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/app_state.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  final AppState appState;

  const ProductsScreen({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    final products = [
      const Product(
        id: '1',
        name: 'Я (Романтика)',
        author: 'Микола Хвильовий',
        price: 150,
        imagePath: 'assets/images/romantyka.jpg',
      ),
      const Product(
        id: '2',
        name: 'Дерзання',
        author: 'Михайль Семенко',
        price: 160,
        imagePath: 'assets/images/derzannia.jpg',
      ),
      const Product(
        id: '3',
        name: 'Баляди про війну і відбудову',
        author: 'Майк Йогансен',
        price: 170,
        imagePath: 'assets/images/balady.jpg',
      ),
      const Product(
        id: '4',
        name: 'Золоті лисенята',
        author: 'Михайло Яловий',
        price: 180,
        imagePath: 'assets/images/zoloti_lysenyata.jpg',
      ),
      const Product(
        id: '5',
        name: 'Мина Мазайло',
        author: 'Микола Куліш',
        price: 190,
        imagePath: 'assets/images/myna_mazailo.jpg',
      ),
      const Product(
        id: '6',
        name: 'Місто',
        author: 'Валер’ян Підмогильний',
        price: 200,
        imagePath: 'assets/images/misto.jpg',
      ),
    ];

    return AnimatedBuilder(
      animation: appState,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Книжки'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 5),
                    Text('${appState.cartItemsCount}'),
                  ],
                ),
              ),
            ],
          ),
          body: ListView(
            children: products.map((product) {
              return ProductCard(
                product: product,
                onFavoriteToggle: () {
                  appState.toggleFavorite(product);
                },
                onAddToCart: () {
                  appState.addToCart(product);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
