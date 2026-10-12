import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_details_page.dart';
import 'product_image.dart';

// Grid settings used by both the home page and the category page.
const productGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  childAspectRatio: 0.68,
);

// One reusable card. We use it for every product in the app.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  // Go to the product details page and send the selected product.
  void openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  // Small label (Sale / New / -20%) shown on top of the image.
  Widget buildBadge() {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          product.badge,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }

  // Image area. Stack is used to put the badge on top of the image.
  Widget buildImageArea() {
    return Container(
      color: Colors.grey.shade200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ProductImage(image: product.image),
          if (product.badge.isNotEmpty) buildBadge(),
        ],
      ),
    );
  }

  // Name, price and the button below the image.
  Widget buildInfoArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text('Rs. ${product.price.toStringAsFixed(0)}'),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 32),
                padding: EdgeInsets.zero,
              ),
              onPressed: () => openDetails(context),
              child: const Text('View Details', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => openDetails(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: buildImageArea()),
            buildInfoArea(context),
          ],
        ),
      ),
    );
  }
}
