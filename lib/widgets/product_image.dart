import 'package:flutter/material.dart';

// Shows a product image.
// Works with web links (http...) and with local images (assets/...).
class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({super.key, required this.image});

  // If the image fails to load, show a grey icon instead of crashing.
  Widget showError(BuildContext context, Object error, StackTrace? stackTrace) {
    return const Center(
      child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http')) {
      return Image.network(image, fit: BoxFit.cover, errorBuilder: showError);
    }
    return Image.asset(image, fit: BoxFit.cover, errorBuilder: showError);
  }
}
