import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../screens/category_page.dart';

// Simple class to store the data of one banner.
class BannerData {
  final String title;
  final String subtitle;
  final Color color;
  final String category; // the category that opens when the banner is tapped

  BannerData({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.category,
  });
}

// Sliding banners at the top of the home page.
// It uses the carousel_slider package from pub.dev.
class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  // Builds one banner. Tapping it opens the matching category page.
  Widget buildBanner(BuildContext context, BannerData banner) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: banner.category),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: banner.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              banner.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              banner.subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final banners = [
      BannerData(
        title: 'Electronics Discount',
        subtitle: 'Up to 30% off on gadgets',
        color: Colors.blue.shade600,
        category: 'Electronics',
      ),
      BannerData(
        title: 'New Arrivals',
        subtitle: 'Check out the latest fashion',
        color: Colors.teal.shade600,
        category: 'Fashion',
      ),
      BannerData(
        title: 'Summer Sale',
        subtitle: 'Comfortable shoes for summer',
        color: Colors.orange.shade700,
        category: 'Shoes',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140,
          autoPlay: true,
          viewportFraction: 0.92,
        ),
        items: banners.map((banner) => buildBanner(context, banner)).toList(),
      ),
    );
  }
}
