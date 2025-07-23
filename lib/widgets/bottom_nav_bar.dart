// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<BottomNavigationBarItem>? items; // Re-added as optional

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.items, // Accept optional items
  });

  @override
  Widget build(BuildContext context) {
    // Default buyer items - these will be used if 'items' is not provided
    final List<BottomNavigationBarItem> defaultBuyerItems = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Products'),
      BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Quotes'),
      BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];

    return BottomNavigationBar(
      items: items ?? defaultBuyerItems, // Use provided items, or fallback to defaultBuyerItems
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed, // Ensures all labels are visible
      backgroundColor: Colors.white,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}