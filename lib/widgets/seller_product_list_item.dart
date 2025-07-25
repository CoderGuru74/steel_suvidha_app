import 'package:flutter/material.dart';

class SellerProductListItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productCategory;
  final String status; // e.g., "Active", "Inactive"
  final VoidCallback? onTap; // For future tap actions like editing product

  const SellerProductListItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productCategory,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'active':
        statusColor = Colors.green;
        break;
      case 'inactive':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0), // No horizontal margin, handled by padding in parent
      elevation: 0, // No extra elevation for list items, parent container can have it
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), // Not rounded as per image, fills width
      color: Colors.white, // Ensure white background for the item
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners for the image
                child: Image.asset(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.broken_image, color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Category: $productCategory',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}