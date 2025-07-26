import 'package:flutter/material.dart';
import 'package:figma_app/widgets/custom_app_bar.dart'; // Ensure this import is correct

class SellerSettingsScreen extends StatelessWidget {
  const SellerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Seller Settings',
        showBackButton: true, // Show back button to return to Seller Home
        showShoppingCart: false, // Ensure no cart icon on settings screen
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Settings
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
              title: const Text('Edit Profile'),
              subtitle: const Text('Update your personal and business information'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Edit Seller Profile')),
                );
                // TODO: Implement navigation to Seller Profile Edit Screen
              },
            ),
          ),
          // Notification Settings
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
              title: const Text('Notification Preferences'),
              subtitle: const Text('Manage alerts for orders, quotes, etc.'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Notification Settings')),
                );
                // TODO: Implement navigation to Notification Settings Screen
              },
            ),
          ),
          // Security Settings
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.security, color: Theme.of(context).primaryColor),
              title: const Text('Security & Privacy'),
              subtitle: const Text('Change password, manage linked devices'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Security Settings')),
                );
                // TODO: Implement navigation to Security Settings Screen
              },
            ),
          ),
          // Payment Settings (for payouts)
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.payment, color: Theme.of(context).primaryColor),
              title: const Text('Payment & Payouts'),
              subtitle: const Text('Manage bank details for transactions'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Payment Settings')),
                );
                // TODO: Implement navigation to Payment Settings Screen
              },
            ),
          ),
          // Help & Support
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.help, color: Theme.of(context).primaryColor),
              title: const Text('Help & Support'),
              subtitle: const Text('Access FAQs or contact support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Help & Support')),
                );
                // TODO: Implement navigation to Help & Support Screen
              },
            ),
          ),
          // Logout Option
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Implement logout logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logging out...')),
              );
              // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}