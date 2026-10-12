import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  // Returns only the products of the selected category.
  // If the name is 'All', it returns every product.
  List<Product> getProducts() {
    if (categoryName == 'All') {
      return allProducts;
    }
    return allProducts.where((p) => p.category == categoryName).toList();
  }

  @override
  Widget build(BuildContext context) {
    final products = getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName == 'All' ? 'All Products' : categoryName),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: productGridDelegate,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
