import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath; // Uses local asset path
  final String title;

  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Fixed width
      margin: const EdgeInsets.only(right: 12), // gap-3
      decoration: BoxDecoration(
        color: const Color(0xFFEEF3F8), // bg-[#eef3f8]
        borderRadius: BorderRadius.circular(12), // rounded-xl
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // NOW USING Image.asset for local images
          Image.asset(
            imagePath, // Use the provided local image path
            width: 80, // Adjust size as needed
            height: 80, // Adjust size as needed
            fit: BoxFit.contain, // Use contain for icons, or cover if they are meant to fill
          ),
          const SizedBox(height: 8), // gap-2
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF131416), // text-[#131416]
              fontSize: 16, // text-base
              fontWeight: FontWeight.bold, // font-bold
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}