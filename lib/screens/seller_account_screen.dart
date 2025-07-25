import 'package:flutter/material.dart';

class SellerAccountScreen extends StatelessWidget {
  const SellerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Details',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple, // A nice color for headings
            ),
          ),
          const SizedBox(height: 20),
          _buildAccountInfoCard(
            context,
            'Profile Information',
            [
              _buildInfoRow('Seller Name', 'Captain Steelbeard'),
              _buildInfoRow('Email', 'steelbeard@ironforge.com'),
              _buildInfoRow('Phone', '+91 98765 43210'),
              _buildInfoRow('Company', 'Rusty Rivets Corp.'),
            ],
          ),
          const SizedBox(height: 20),
          _buildAccountInfoCard(
            context,
            'Payment Details',
            [
              _buildInfoRow('Bank Name', 'Goblin Savings Bank'),
              _buildInfoRow('Account No.', 'GRN123456789'),
              _buildInfoRow('IFSC Code', 'GSBF0000001'),
            ],
          ),
          const SizedBox(height: 20),
          _buildAccountInfoCard(
            context,
            'Address',
            [
              _buildInfoRow('Street', '13 Hammer Lane'),
              _buildInfoRow('City', 'Ironville'),
              _buildInfoRow('State', 'Metal Pradesh'),
              _buildInfoRow('PIN Code', '123456'),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile updated (just kidding)!')),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Matching the heading color
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfoCard(BuildContext context, String title, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Divider(height: 20, thickness: 1),
            ...children, // Spread the list of info rows
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // Align labels
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}