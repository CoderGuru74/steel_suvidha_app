import 'package:flutter/material.dart';
import 'package:figma_app/widgets/dashboard_info_card.dart'; // Import the info card
import 'package:figma_app/widgets/dashboard_activity_tile.dart'; // Import the activity tile
import 'package:figma_app/widgets/dashboard_alert_tile.dart'; // Import the alert tile

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0), // Padding around the whole screen content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 1: Overview Cards
          Text(
            'Overview',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 12.0, // Space between columns
            mainAxisSpacing: 12.0, // Space between rows
            shrinkWrap: true, // Make grid take only needed space
            physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling, handled by SingleChildScrollView
            children: const [
              DashboardInfoCard(
                title: 'Pending Quote Requests',
                value: '3',
              ),
              DashboardInfoCard(
                title: 'Active Orders',
                value: '12',
              ),
              DashboardInfoCard(
                title: 'Sales YTD',
                value: '\$50,000',
              ),
              DashboardInfoCard(
                title: 'Account Health Rating',
                value: 'Excellent',
                valueColor: Colors.green, // Highlight "Excellent" in green
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Section 2: Recent Activity
          Text(
            'Recent Activity',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              DashboardActivityTile(
                icon: Icons.local_shipping,
                title: 'New Order Received',
                subtitle: 'Order #12345',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View Order #12345')),
                  );
                },
              ),
              DashboardActivityTile(
                icon: Icons.description,
                title: 'Quote Request Received',
                subtitle: 'Quote #67890',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View Quote #67890')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Section 3: System Alerts
          Text(
            'System Alerts',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              DashboardAlertTile(
                icon: Icons.warning_amber_rounded,
                message: 'Missing Product Information',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address Missing Product Info')),
                  );
                },
              ),
              DashboardAlertTile(
                icon: Icons.access_time,
                message: 'Quote Deadline Approaching',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Review Quote Deadlines')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Section 4: Action Buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Add New Product')),
                );
                // Ideally, this would navigate to SellerMyProductsScreen or a dedicated AddProductScreen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1), // Light blue background
                foregroundColor: Theme.of(context).primaryColor, // Blue text
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0), // Blue border
                ),
                elevation: 0,
              ),
              child: const Text('Add New Product'),
            ),
          ),
          const SizedBox(height: 12), // Space between buttons
          SizedBox(
            width: double.infinity,
            child: OutlinedButton( // Used OutlinedButton for differentiation
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to All Quote Requests')),
                );
                // This might navigate to the 'Quote Requests' tab within SellerHomeScreen
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, // Blue text
                side: BorderSide(color: Colors.grey.shade400), // Grey border for secondary action
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('View All Quote Requests'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton( // Used OutlinedButton
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Manage Orders')),
                );
                // This might navigate to the 'Orders' tab within SellerHomeScreen
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, // Blue text
                side: BorderSide(color: Colors.grey.shade400), // Grey border
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Manage Orders'),
            ),
          ),
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }
}