import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // --- General Settings ---
        Text(
          'General Settings',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile & Account'),
                subtitle: const Text('Manage your personal information and login details'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigate to Profile Settings')),
                  );
                  // TODO: Implement navigation to a detailed Profile Settings screen
                },
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Security & Privacy'),
                subtitle: const Text('Change password, manage linked devices'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigate to Security Settings')),
                  );
                  // TODO: Implement navigation to a detailed Security & Privacy screen
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- App Preferences ---
        Text(
          'App Preferences',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Receive alerts for new orders, quotes, etc.'),
                value: true, // This should be a state variable in a StatefulWidget
                onChanged: (bool value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Notifications ${value ? 'enabled' : 'disabled'}')),
                  );
                  // TODO: Update notification preference in state/backend
                },
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                subtitle: const Text('English (US)'), // This should show current language
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open Language selection')),
                  );
                  // TODO: Implement language selection
                },
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Theme'),
                subtitle: const Text('Light / Dark Mode'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open Theme selection')),
                  );
                  // TODO: Implement theme selection
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- Admin Specific Settings (Optional) ---
        Text(
          'Admin Specific',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Manage Categories'),
                subtitle: const Text('Add, edit, or remove product categories'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigate to Category Management')),
                  );
                  // TODO: Implement navigation to Category Management
                },
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text('View System Logs'),
                subtitle: const Text('Review application activity logs'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Navigate to System Logs')),
                  );
                  // TODO: Implement navigation to System Logs viewer
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // --- About & Support ---
        Text(
          'About & Support',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('About App'),
                subtitle: const Text('Version, terms of service, privacy policy'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open About App information')),
                  );
                  // TODO: Implement About App screen
                },
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help & Support'),
                subtitle: const Text('FAQs, contact support'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Open Help & Support')),
                  );
                  // TODO: Implement Help & Support screen
                },
              ),
            ],
          ),
        ),
        SizedBox(height: kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom + 10.0), // Padding for bottom nav bar
      ],
    );
  }
}