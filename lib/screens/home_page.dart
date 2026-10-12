import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Shows a small message at the bottom of the screen.
  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Opens the category page. Use 'All' to show every product.
  void openCategory(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: categoryName),
      ),
    );
  }

  // Title text like "Categories".
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Horizontal scrolling list of categories.
  Widget buildCategoryList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: categoryIcons.entries.map((entry) {
          return CategoryItem(
            name: entry.key,
            icon: entry.value,
            onTap: () => openCategory(context, entry.key),
          );
        }).toList(),
      ),
    );
  }

  // "Popular Products" title with a "See All" button.
  Widget buildPopularHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () => openCategory(context, 'All'),
            child: const Text('See All →'),
          ),
        ],
      ),
    );
  }

  // Shows the first 6 products in a grid.
  Widget buildPopularProducts() {
    final popularProducts = allProducts.take(6).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
      itemCount: popularProducts.length,
      gridDelegate: productGridDelegate,
      itemBuilder: (context, index) {
        return ProductCard(product: popularProducts[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showMessage(context, 'Search is not added yet'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => showMessage(context, 'Your cart is empty'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerCarousel(),
            buildSectionTitle('Categories'),
            buildCategoryList(context),
            buildPopularHeader(context),
            buildPopularProducts(),
          ],
        ),
      ),
    );
  }
}
