// lib/screens/account_screen.dart
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // As it's a bottom nav bar destination
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center items in the column
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey, // Placeholder for an avatar image
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Iron Man Jr. (Avenger of Steel)', // Comedic name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'The Unbendable Buyer', // Comedic tagline
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildAccountDetailCard(
              context,
              icon: Icons.email,
              title: 'Email',
              value: 'tony.stark.junior@starkindustries.com',
            ),
            _buildAccountDetailCard(
              context,
              icon: Icons.phone,
              title: 'Phone',
              value: '+91 98765 43210',
            ),
            _buildAccountDetailCard(
              context,
              icon: Icons.location_on,
              title: 'Primary Location',
              value: 'Avengers Tower, New York, USA',
            ),
            _buildAccountDetailCard(
              context,
              icon: Icons.business,
              title: 'Company',
              value: 'Stark Industries (Steel Division)',
            ),
            _buildAccountDetailCard(
              context,
              icon: Icons.credit_card,
              title: 'Membership Tier',
              value: 'Vibranium Elite (Lifetime)',
            ),
            _buildAccountDetailCard(
              context,
              icon: Icons.date_range,
              title: 'Member Since',
              value: 'October 26, 2023 (The Day I Needed More Steel)',
            ),
            const SizedBox(height: 30),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Editing Profile... (Not implemented)')),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging out... (Not implemented)')),
                  );
                  // TODO: Implement actual logout logic
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.red.shade700),
                  foregroundColor: Colors.red.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountDetailCard(BuildContext context, {required IconData icon, required String title, required String value}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 28),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey), // Optional arrow
          ],
        ),
      ),
    );
  }
}