import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // No shadow
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Equivalent to px-2
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
          children: [
            // Logo or App Name (You can replace this with an Image.asset for your logo)
            const Text(
              'SteelSuvidha',
              style: TextStyle(
                color: Color(0xFF131416), // text-[#131416]
                fontSize: 20, // text-xl
                fontWeight: FontWeight.bold, // font-bold
              ),
            ),
            // Menu Icon (You can replace with SvgPicture.asset if you have an SVG icon)
            IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF131416)), // text-[#131416]
              onPressed: () {
                // Handle menu icon tap (e.g., open a drawer)
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // THIS IS CRUCIAL FOR AppBar
}