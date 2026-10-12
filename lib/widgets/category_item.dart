import 'package:flutter/material.dart';

// One round category button (icon + name) for the horizontal list.
class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade50,
              child: Icon(icon, color: Colors.blue.shade700),
            ),
            const SizedBox(height: 6),
            Text(name, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
