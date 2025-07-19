import 'package:flutter/material.dart';
import 'package:figma_app/screens/home_screen.dart'; // Buyer's main page
import 'package:figma_app/screens/seller_dashboard_screen.dart';
import 'package:figma_app/screens/admin_dashboard_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Role'),
        backgroundColor: const Color(0xFFB8CEE4),
        automaticallyImplyLeading: false, // Prevent back button from login
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'How do you want to use the app?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF131416),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildRoleButton(
                context,
                'Buyer',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()), // Navigate to the existing HomeScreen
                ),
              ),
              const SizedBox(height: 20),
              _buildRoleButton(
                context,
                'Seller',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SellerDashboardScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildRoleButton(
                context,
                'Admin',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB8CEE4),
        foregroundColor: const Color(0xFF131416),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(title),
    );
  }
}