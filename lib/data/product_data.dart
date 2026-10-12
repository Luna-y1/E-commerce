import 'package:flutter/material.dart';
import '../models/product.dart';

// Category names with their icons.
// The home page shows these in the horizontal list.
final Map<String, IconData> categoryIcons = {
  'Electronics': Icons.devices,
  'Fashion': Icons.checkroom,
  'Shoes': Icons.directions_walk,
  'Beauty': Icons.face,
  'Accessories': Icons.watch,
  'Home': Icons.home,
};

// This function makes a placeholder image link with the product name written on it.
// To use a real image, just replace the link in the product below.
String makeImageUrl(String text) {
  return 'https://placehold.co/400x400/E0E0E0/555555/png?text=${text.replaceAll(' ', '+')}';
}

// All the products of the app (static data, no database needed).
final List<Product> allProducts = [
  // ---------- Electronics ----------
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: 'assets/headphones.jpg',
    price: 3500,
    rating: 4.5,
    description: 'Wireless headphones with clear sound and soft ear cushions. '
        'The battery lasts up to 20 hours.',
    badge: 'Sale',
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image: 'assets/smartwatch.jpg',
    price: 4500,
    rating: 4.2,
    description: 'Smart watch that counts your steps, checks your heart rate '
        'and shows phone notifications.',
    badge: 'New',
  ),
  Product(
    name: 'Laptop',
    category: 'Electronics',
    image: 'assets/laptop.jpg',
    price: 65000,
    rating: 4.7,
    description: 'A light laptop with 8GB RAM and 512GB storage. '
        'Good for studying and daily work.',
  ),

  // ---------- Fashion ----------
  Product(
    name: 'Cotton T-Shirt',
    category: 'Fashion',
    image: 'assets/tshirt.jpg',
    price: 800,
    rating: 4.0,
    description: 'Soft cotton t-shirt that is comfortable to wear every day.',
    badge: '-20%',
  ),
  Product(
    name: 'Jacket',
    category: 'Fashion',
    image: 'assets/jacket.jpg',
    price: 2800,
    rating: 4.3,
    description: 'Classic blue denim jacket. Goes well with most outfits.',
  ),

  // ---------- Shoes ----------
  Product(
    name: 'Sneakers',
    category: 'Shoes',
    image: 'assets/sneakers.jpg',
    price: 3200,
    rating: 4.4,
    description: 'Light sneakers with a strong grip. '
        'Good for running and walking.',
    badge: 'New',
  ),
  Product(
    name: 'Leather Sandals',
    category: 'Shoes',
    image: 'assets/sandals.jpg',
    price: 1500,
    rating: 3.9,
    description: 'Comfortable leather sandals for summer days.',
  ),

  // ---------- Beauty ----------
  Product(
    name: 'Face Cream',
    category: 'Beauty',
    image: 'assets/facecream.jpg',
    price: 900,
    rating: 4.1,
    description: 'Moisturizing face cream for soft and fresh skin.',
  ),
  Product(
    name: 'Perfume',
    category: 'Beauty',
    image: 'assets/perfume.jpg',
    price: 2500,
    rating: 4.6,
    description: 'A light perfume with a fresh smell that lasts all day.',
    badge: 'Sale',
  ),

  // ---------- Accessories ----------
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: 'assets/sunglasses.jpg',
    price: 1200,
    rating: 4.0,
    description: 'Stylish sunglasses with UV protection.',
  ),
  Product(
    name: 'Backpack',
    category: 'Accessories',
    image: 'assets/backpack.jpg',
    price: 2000,
    rating: 4.5,
    description: 'Strong backpack with a laptop pocket and lots of space.',
    badge: '-10%',
  ),

  // ---------- Home ----------
  Product(
    name: 'Table Lamp',
    category: 'Home',
    image: 'assets/lamp.jpg',
    price: 1100,
    rating: 4.2,
    description: 'Small table lamp with warm light. Good for a study desk.',
  ),
  Product(
    name: 'Cushion',
    category: 'Home',
    image: 'assets/cushions.jpg',
    price: 1300,
    rating: 4.3,
    description: 'Set of 2 soft cushions to make your sofa more comfortable.',
  ),
];
