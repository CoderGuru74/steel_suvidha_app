import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class InfoCard extends StatelessWidget {
  final String iconSvgPath; // Accepts SVG string directly
  final String title;

  const InfoCard({
    Key? key,
    required this.iconSvgPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // p-3
      decoration: BoxDecoration(
        color: const Color(0xFFEEF3F8), // bg-[#eef3f8]
        borderRadius: BorderRadius.circular(12), // rounded-xl
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Wrap content
        children: [
          SvgPicture.string(
            iconSvgPath,
            width: 24, // Icon size
            height: 24,
            colorFilter: ColorFilter.mode(
              const Color(0xFF2667A0), // Icon color, assuming primary blue
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8), // gap-2
          Expanded( // Ensure text takes remaining space
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF131416), // text-[#131416]
                fontSize: 14, // text-sm
                fontWeight: FontWeight.w600, // font-semibold
              ),
              overflow: TextOverflow.ellipsis, // Prevent overflow
              maxLines: 2, // Allow text to wrap if needed
            ),
          ),
        ],
      ),
    );
  }
}