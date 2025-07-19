import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class StepTile extends StatelessWidget {
  final String iconSvgPath; // Accepts SVG string directly
  final String title;
  final bool isLast;

  const StepTile({
    Key? key,
    required this.iconSvgPath,
    required this.title,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.string(
              iconSvgPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                const Color(0xFF2667A0), // Icon color, assuming primary blue
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12), // gap-3
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF131416),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Padding(
            padding: const EdgeInsets.only(left: 12.0 + 24.0, top: 8.0, bottom: 8.0), // Align divider with step content
            child: Divider(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
      ],
    );
  }
}