// lib/screens/seller_home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/widgets/custom_app_bar.dart'; // Re-using if possible, or adapting
import 'package:figma_app/widgets/bottom_nav_bar.dart'; // We'll adapt this for seller

class SellerHomeScreen extends StatefulWidget {
  final String? loggedInRole;
  const SellerHomeScreen({super.key, this.loggedInRole});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

// We need a TickerProviderStateMixin for TabController
class _SellerHomeScreenState extends State<SellerHomeScreen> with SingleTickerProviderStateMixin {
  int _bottomNavBarIndex = 0; // Current index for the bottom navigation bar
  late TabController _tabController; // Controller for the top tabs

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Dashboard, My Products, Quote Requests, My Orders
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Handle bottom navigation bar taps
  void _onBottomNavItemTapped(int index) {
    setState(() {
      _bottomNavBarIndex = index;
    });
    // TODO: Implement actual navigation for seller bottom tabs
    // For now, show a SnackBar or navigate within SellerHomeScreen sections
    switch (index) {
      case 0: // Home / Dashboard
        _tabController.animateTo(0); // Go to Dashboard tab
        break;
      case 1: // Products
        _tabController.animateTo(1); // Go to My Products tab
        break;
      case 2: // Quotes
        _tabController.animateTo(2); // Go to Quote Requests tab
        break;
      case 3: // Orders
        _tabController.animateTo(3); // Go to My Orders tab
        break;
      case 4: // Account (Profile)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Seller Account/Profile')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The AppBar needs to integrate the TabBar at the bottom
        title: const Text(
          'Steel Suvidha Seller Portal',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false, // Align title to left as per image
        backgroundColor: Colors.white,
        elevation: 1, // Subtle shadow for AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings Pressed')),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor, // Color for selected tab
          unselectedLabelColor: Colors.grey, // Color for unselected tabs
          indicatorColor: Theme.of(context).primaryColor, // Indicator line color
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(text: 'Dashboard'),
            Tab(text: 'My Products'),
            Tab(text: 'Quote Requests'),
            Tab(text: 'My Orders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // --- Dashboard Tab Content ---
          _buildDashboardTab(),
          // --- My Products Tab Content (Placeholder) ---
          Center(child: Text('My Products Content Here', style: Theme.of(context).textTheme.headlineSmall)),
          // --- Quote Requests Tab Content (Placeholder) ---
          Center(child: Text('Quote Requests Content Here', style: Theme.of(context).textTheme.headlineSmall)),
          // --- My Orders Tab Content (Placeholder) ---
          Center(child: Text('My Orders Content Here', style: Theme.of(context).textTheme.headlineSmall)),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _bottomNavBarIndex,
        onItemTapped: _onBottomNavItemTapped,
        // Define seller-specific items for the BottomNavBar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined), // Products icon
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment), // Quotes icon
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long), // Orders icon
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Account icon
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildOverviewCard('Pending Quote Requests', '3', Icons.pending_actions),
              _buildOverviewCard('Active Orders', '12', Icons.local_shipping),
              _buildOverviewCard('Sales YTD', '\$50,000', Icons.attach_money),
              _buildOverviewCard('Account Health Rating', 'Excellent', Icons.health_and_safety),
            ].animate(interval: 100.ms).fadeIn(duration: 400.ms).scale(begin: const Offset(0.9,0.9), end: const Offset(1.0,1.0)),
          ),
          const SizedBox(height: 30),

          const Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          _buildActivityItem(Icons.credit_card, 'New Order Received', 'Order #12345'),
          _buildActivityItem(Icons.description, 'Quote Request Received', 'Quote #67890'),
          // Add more recent activity items here
          const SizedBox(height: 30),

          const Text(
            'System Alerts',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          _buildAlertItem(Icons.warning_amber, 'Missing Product Information'),
          _buildAlertItem(Icons.access_time, 'Quote Deadline Approaching'),
          // Add more system alerts here
          const SizedBox(height: 30),

          // Action Buttons
          SizedBox(
            width: double.infinity,
            child: _buildActionButton('Add New Product', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add New Product Pressed')),
              );
              // TODO: Navigate to Add New Product Screen (where image_112a97.png and image_11a6d6.png might be used)
            }),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: _buildActionButton('View All Quote Requests', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View All Quote Requests Pressed')),
              );
              _tabController.animateTo(2); // Go to Quote Requests tab
            }),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: _buildActionButton('Manage Orders', () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Manage Orders Pressed')),
              );
              _tabController.animateTo(3); // Go to My Orders tab
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Helper for Overview Cards
  Widget _buildOverviewCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(icon, color: Colors.grey.shade400, size: 28),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Recent Activity items
  Widget _buildActivityItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600, size: 28),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for System Alerts items
  Widget _buildAlertItem(IconData icon, String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.red.shade700, size: 28), // Alerts typically red
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Action Buttons
  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade100, // Light blue as per image
        foregroundColor: Colors.blue.shade800, // Darker blue text
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0, // No shadow for these buttons as per image
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}