import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FigmaCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const FigmaCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(description,
                      style: GoogleFonts.poppins(fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
