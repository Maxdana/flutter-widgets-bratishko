
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onAddToCart;
  final bool showCartButton;

  const ProductCard({
    super.key,
    required this.product,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onAddToCart,
    this.showCartButton = true,
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
          child: InteractiveViewer(
            child: Image.asset(widget.product.imagePath),
          ),
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
        color: const Color(0xFFF8F8DE),
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: const BorderSide(
            color: Color(0xFFE5E5B8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: showImage,
                child: Image.asset(
                  widget.product.imagePath,
                  height: 100,
                  fit: BoxFit.contain,
                  frameBuilder: (context, child, frame, wasLoaded) {
                    if (frame == null) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 100,
                          width: 70,
                          color: Colors.white,
                        ),
                      );
                    }
                    return child;
                  },
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF263E30),
                  fontFamily: 'serif',
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.product.author,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF596A55),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${widget.product.price} грн.',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF263E30),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  SizedBox(
                    width: 36,
                    height: 32,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: toggleFavorite,
                      icon: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 19,
                        color: widget.isFavorite
                            ? Colors.red
                            : const Color(0xFF263E30),
                      ),
                    ),
                  ),
                  if (widget.showCartButton)
                    Expanded(
                      child: SizedBox(
                        height: 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF263E30),
                            foregroundColor: const Color(0xFFF8F8DE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: widget.onAddToCart,
                          child: const Text(
                            'До кошика',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
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
