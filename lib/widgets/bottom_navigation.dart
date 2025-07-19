import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0; // Tracks the currently selected tab (0 for Home)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // In a real app, you would navigate to different screens here
    // based on the `index`. For example:
    // if (index == 0) {
    //   Navigator.pushReplacementNamed(context, '/home');
    // } else if (index == 1) {
    //   Navigator.pushReplacementNamed(context, '/products');
    // }
    // ... and so on for other tabs
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 1 ? Icons.inventory_2 : Icons.inventory_2_outlined), // Products icon
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 2 ? Icons.description : Icons.description_outlined), // Requests icon
          label: 'Requests',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 3 ? Icons.list_alt : Icons.list_alt_outlined), // Orders icon
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(_selectedIndex == 4 ? Icons.person : Icons.person_outlined), // Profile icon
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex, // The index of the currently selected item
      selectedItemColor: Colors.black, // Color for the selected icon and label
      unselectedItemColor: Colors.grey, // Color for unselected icons and labels
      onTap: _onItemTapped, // Callback when a tab is tapped
      type: BottomNavigationBarType.fixed, // Use fixed type for more than 3 items
      backgroundColor: Colors.white, // Background color of the bar
      elevation: 8, // Shadow beneath the bar
      showUnselectedLabels: true, // Show labels for unselected items
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    );
  }
}