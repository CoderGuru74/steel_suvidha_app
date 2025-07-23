// lib/screens/buyer_main_screen.dart
import 'package:flutter/material.dart';
import 'package:figma_app/screens/home_screen.dart';
import 'package:figma_app/screens/product_categories_screen.dart';
import 'package:figma_app/screens/quotes_history_screen.dart';
import 'package:figma_app/screens/order_history_screen.dart';
import 'package:figma_app/screens/account_screen.dart'; // Import the new AccountScreen
import 'package:figma_app/widgets/bottom_nav_bar.dart';

class BuyerMainScreen extends StatefulWidget {
  const BuyerMainScreen({super.key});

  @override
  State<BuyerMainScreen> createState() => _BuyerMainScreenState();
}

class _BuyerMainScreenState extends State<BuyerMainScreen> {
  int _selectedIndex = 0;

  // List of widgets (screens) to be displayed based on the selected tab
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreenContent(),          // Index 0: Home
    const ProductCategoriesScreen(),    // Index 1: Products
    const QuotesHistoryScreen(),        // Index 2: Quotes
    const OrderHistoryScreen(),         // Index 3: Orders
    const AccountScreen(),              // Index 4: Account (now shows dummy details)
  ];

  // Update the selected index when a tab is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        // The BottomNavBar now uses its internal default items.
      ),
    );
  }
}