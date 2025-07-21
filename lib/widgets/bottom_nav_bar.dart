// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Requests',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor, // Use theme primary blue
      unselectedItemColor: Colors.grey.shade600, // Darker grey for unselected
      onTap: onItemTapped,
      backgroundColor: Colors.white, // White background for nav bar
      type: BottomNavigationBarType.fixed, // Ensure all labels are shown
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    );
  }
}