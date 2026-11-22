
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onAddToCart,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  
void toggleFavorite() {
  widget.onFavoriteToggle?.call();
}

  void showImage() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Image.asset(widget.product.imagePath),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        toggleFavorite();
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: showImage,
                child: Image.asset(
                  widget.product.imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  frameBuilder: (context, child, frame, wasLoaded) {
                    if (frame == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return child;
                  },
                ),
              ),

              const SizedBox(height: 12),

              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(widget.product.author),

              const SizedBox(height: 8),

              Text('${widget.product.price} грн'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
  onPressed: toggleFavorite,
  icon: Icon(
    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
    color: widget.isFavorite ? Colors.red : null,
  ),
),

                  ElevatedButton(
                    onPressed: widget.onAddToCart,
                    child: const Text('До кошика'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
