import 'package:flutter/material.dart';

class DashboardAlertTile extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback? onTap;

  const DashboardAlertTile({
    super.key,
    required this.icon,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // No elevation, part of a list
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0), // Small vertical margin
      color: Colors.white, // Ensure white background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), // No border radius
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28, // Icon size matching the image
                color: Theme.of(context).colorScheme.error, // Use theme's error color for alerts
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600, // Semi-bold for the message
                    color: Colors.black87,
                  ),
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