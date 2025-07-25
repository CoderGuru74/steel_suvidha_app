import 'package:flutter/material.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart';
import 'package:figma_app/widgets/custom_app_bar.dart';
import 'package:figma_app/screens/seller_dashboard_screen.dart';
import 'package:figma_app/screens/seller_my_products_screen.dart';
// Imports for Orders tabs
import 'package:figma_app/screens/seller_new_orders_tab.dart';
import 'package:figma_app/screens/seller_in_progress_orders_tab.dart';
import 'package:figma_app/screens/seller_completed_orders_tab.dart';
// Import for Account Screen
import 'package:figma_app/screens/seller_account_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> with TickerProviderStateMixin {
  late TabController _bottomTabController; // Controller for bottom nav bar tabs
  late TabController _ordersTabController; // Controller specifically for Orders sub-tabs
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _bottomTabController = TabController(length: _sellerNavItems.length, vsync: this);
    _bottomTabController.addListener(() {
      if (_bottomTabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _bottomTabController.index;
        });
      }
    });

    // Initialize controller for the Orders sub-tabs
    _ordersTabController = TabController(length: 3, vsync: this); // 3 tabs: New, In Progress, Completed
  }

  @override
  void dispose() {
    _bottomTabController.dispose();
    _ordersTabController.dispose();
    super.dispose();
  }

  // UPDATED: List of bottom navigation bar items for Seller (Removed 'Quote Requests')
  final List<BottomNavigationBarItem> _sellerNavItems = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
    BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'My Products'),
    // REMOVED: BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Quote Requests'),
    BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
  ];

  // UPDATED: Content for each bottom navigation bar tab (Removed 'Quote Requests' placeholder)
  List<Widget> get _sellerTabsContent {
    return [
      // Index 0: Dashboard
      const SellerDashboardScreen(),

      // Index 1: My Products
      const SellerMyProductsScreen(),

      // Index 2: Orders section with its own TabBar and TabBarView (Shifted from Index 3)
      Column(
        children: [
          TabBar(
            controller: _ordersTabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'New Orders'),
              Tab(text: 'In Progress'),
              Tab(text: 'Completed'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _ordersTabController,
              children: [
                SellerNewOrdersTab(),
                SellerInProgressOrdersTab(),
                SellerCompletedOrdersTab(),
              ],
            ),
          ),
        ],
      ),

      // Index 3: Account (Shifted from Index 4)
      SellerAccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = _sellerNavItems[_selectedIndex].label ?? 'Seller Panel';

    return Scaffold(
      appBar: CustomAppBar(
        title: currentTitle,
        showBackButton: false,
        showShoppingCart: false,
        actions: [
          if (_selectedIndex == 0) // Example: Show a settings icon only on Dashboard
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings for Dashboard')),
                );
              },
            ),
          // NEW: Notification icon for the Orders tab
          if (_selectedIndex == 2) // Orders tab is now at index 2
            IconButton(
              icon: const Icon(Icons.notifications_none), // Notification bell icon
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications for Orders!')),
                );
                // TODO: Implement actual notification logic or navigate to a notification screen
              },
            ),
          // Add other actions for other tabs if needed
        ],
      ),
      body: TabBarView(
        controller: _bottomTabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swiping between bottom nav tabs
        children: _sellerTabsContent, // Now calling the getter
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
            _bottomTabController.animateTo(index);
          });
        },
        items: _sellerNavItems,
      ),
    );
  }
}