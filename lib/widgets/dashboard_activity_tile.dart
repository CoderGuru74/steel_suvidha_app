import 'package:flutter/material.dart';

class DashboardActivityTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const DashboardActivityTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // No elevation, as it's part of a list
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0), // Small vertical margin
      color: Colors.white, // Ensure white background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), // No border radius
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(0), // No border radius for InkWell effect either
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28, // Icon size matching the image
                color: Theme.of(context).primaryColor, // Use primary color for icons
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600, // Semi-bold for title
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600], // Lighter color for subtitle
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey), // Arrow icon on the right
            ],
          ),
        ),
      ),
    );
  }
}