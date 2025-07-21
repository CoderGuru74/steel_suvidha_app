// lib/widgets/product_card.dart
import 'package:flutter/material.dart'; // This should be the ONLY import line at the very top

class ProductCard extends StatelessWidget {
  final String productType;
  final String productName;
  final String specs;
  final String imageUrl;
  final VoidCallback onQuoteRequested;

  const ProductCard({
    super.key,
    required this.productType,
    required this.productName,
    required this.specs,
    required this.imageUrl,
    required this.onQuoteRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Use theme surface color (white)
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Lighter shadow
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row( // <--- This is the Row widget
        children: [ // <--- Its children must be inside the 'children:' named argument
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade300, // Lighter placeholder
                child: Center(
                  child: Icon(Icons.broken_image, color: Colors.grey.shade600, size: 40),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productType,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor, // Use theme primary blue
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface, // Use theme text color
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  specs,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), // Adjust text color
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onQuoteRequested,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF673AB7), // Use a distinct blue/purple for this button
                      foregroundColor: Colors.white, // Text color on this button
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Request a Quote',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}