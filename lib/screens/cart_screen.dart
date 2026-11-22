
import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  final AppState appState;

  const CartScreen({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF0F2B6),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF0F2B6),
            foregroundColor: const Color(0xFF263E30),
            title: const Text('КОШИК'),
          ),
          body: appState.cartProducts.isEmpty
              ? const Center(
                  child: Text(
                    'Кошик порожній',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF263E30),
                    ),
                  ),
                )
              : ListView(
                  children: appState.cartProducts.map((product) {
                    return ProductCard(
                      product: product,
                      isFavorite: appState.favoriteProducts.any(
                        (item) => item.id == product.id,
                      ),
                      onFavoriteToggle: () {
                        appState.toggleFavorite(product);
                      },
                      showCartButton: false,
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
