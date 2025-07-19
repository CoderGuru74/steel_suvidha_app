import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64, // min-h-[64px]
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // px-4 py-2
      decoration: BoxDecoration(
        color: const Color(0xFF131416), // bg-[#131416]
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), // rounded-t-xl
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, -2), // Shadow for elevation
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M224,208H32V72a16,16,0,0,1,16-16H208a16,16,0,0,1,16,16ZM208,56H48A8,8,0,0,0,40,64V192H216V72A8,8,0,0,0,208,56ZM92,104a12,12,0,1,0,12,12A12,12,0,0,0,92,104Zm72,36a12,12,0,1,0,12,12A12,12,0,0,0,164,140Z"></path></svg>',
            label: 'Home',
            isSelected: true, // Example: Home is selected
          ),
          _buildNavItem(
            iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M216,48H40A16,16,0,0,0,24,64V208a16,16,0,0,0,16,16H216a16,16,0,0,0,16-16V64A16,16,0,0,0,216,48ZM40,64H216V208H40ZM176,96a8,8,0,0,1-8,8H88a8,8,0,0,1-8-8V80a8,8,0,0,1,8-8h80a8,8,0,0,1,8,8Z"></path></svg>',
            label: 'Orders',
            isSelected: false,
          ),
          _buildNavItem(
            iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Zm0,192a88,88,0,1,1,88-88A88.1,88.1,0,0,1,128,216Zm40-88a8,8,0,0,1-8,8H136v32a8,8,0,0,1-16,0V144H96a8,8,0,0,1,0-16h32V96a8,8,0,0,1,16,0v32h32A8,8,0,0,1,168,128Z"></path></svg>',
            label: 'New Quote',
            isSelected: false,
          ),
          _buildNavItem(
            iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M240,128a15.72,15.72,0,0,1-4.69,11.16l-80,80a16,16,0,0,1-22.62-22.62L193.37,136H40a8,8,0,0,1,0-16H193.37L132.69,67.46a16,16,0,0,1,22.62-22.62l80,80A15.72,15.72,0,0,1,240,128Z"></path></svg>',
            label: 'Messages',
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconSvgPath,
    required String label,
    required bool isSelected,
  }) {
    final Color iconColor = isSelected ? const Color(0xFFB8CEE4) : const Color(0xFFA5A5A5); // Selected vs. unselected
    final Color textColor = isSelected ? const Color(0xFFB8CEE4) : const Color(0xFFA5A5A5);

    return InkWell(
      onTap: () {
        // Handle navigation tap
        print('Tapped $label');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.string(
            iconSvgPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 4), // gap-1
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 12, // text-xs
              fontWeight: FontWeight.w500, // font-medium
            ),
          ),
        ],
      ),
    );
  }
}