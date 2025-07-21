// lib/screens/role_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // For animations
import 'package:figma_app/screens/home_screen.dart';
import 'package:figma_app/widgets/custom_app_bar.dart'; // Import custom app bar

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? _selectedRole;

  void _navigateToDashboard() {
    if (_selectedRole == 'Buyer') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (_selectedRole == 'Seller') {
      // TODO: Navigate to Seller Dashboard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seller Dashboard Coming Soon!')),
      );
    } else if (_selectedRole == 'Admin') {
      // TODO: Navigate to Admin Dashboard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Admin Dashboard Coming Soon!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color handled by ThemeData in main.dart
      appBar: CustomAppBar(
        title: 'Select Your Role',
        showBackButton: true, // Allow going back to login/splash
        showShoppingCart: false,
        breadcrumbs: const ['Login', 'Role Selection'],
        onBackButtonPressed: () {
          Navigator.pop(context); // Go back to the previous screen (Login)
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'I am a...',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground, // Use theme text color
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: -0.1, end: 0),
              const SizedBox(height: 40),
              _buildRoleOption(
                context,
                'Buyer',
                'Source steel from verified suppliers',
                Icons.shopping_cart_outlined,
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideX(begin: -0.1, end: 0),
              const SizedBox(height: 20),
              _buildRoleOption(
                context,
                'Seller',
                'List and sell steel products',
                Icons.storefront_outlined,
              ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideX(begin: 0.1, end: 0),
              const SizedBox(height: 20),
              _buildRoleOption(
                context,
                'Admin',
                'Manage platform operations',
                Icons.admin_panel_settings_outlined,
              ).animate().fadeIn(duration: 600.ms, delay: 800.ms).slideX(begin: -0.1, end: 0),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _navigateToDashboard,
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleOption(
      BuildContext context, String role, String description, IconData icon) {
    bool isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor // Use theme primary for selected
              : Theme.of(context).colorScheme.surface, // Use theme surface for unselected
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300, // Lighter border
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isSelected ? 0.3 : 0.05), // Lighter shadow for unselected
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Theme.of(context).primaryColor, // Icon color changes based on selection
              size: 35,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface, // Text color changes
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white70 : Theme.of(context).colorScheme.onSurface.withOpacity(0.7), // Text color changes
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.white, size: 25),
          ],
        ),
      ),
    );
  }
}