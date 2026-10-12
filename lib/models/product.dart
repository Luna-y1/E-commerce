// A simple model class that holds the information of one product.
class Product {
  final String name;
  final String category;
  final String image; // a web link (http...) or a local path (assets/images/...)
  final double price;
  final double rating;
  final String description;
  final String badge; // small label on the card like "Sale" or "New" (can be empty)

  Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.badge = '',
  });
}
