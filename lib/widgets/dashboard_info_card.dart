import 'package:flutter/material.dart';

class DashboardInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor; // Optional color for the value text

  const DashboardInfoCard({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Subtle shadow for the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero, // No external margin, will be handled by padding/spacing in parent grid
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out title and value
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700], // Softer grey for title
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8), // Spacing between title and value
            Text(
              value,
              style: TextStyle(
                fontSize: 24, // Larger font size for the value
                fontWeight: FontWeight.bold,
                color: valueColor ?? Theme.of(context).colorScheme.onSurface, // Use provided color or default
              ),
            ),
          ],
        ),
      ),
    );
  }
}