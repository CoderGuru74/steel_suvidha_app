import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions; // Added actions parameter

  const CustomAppBar({Key? key, this.actions}) : super(key: key); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Steel Suvidha',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFB8CEE4), // Your app bar color
      elevation: 0, // No shadow
      actions: actions, // Pass the actions to the AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}