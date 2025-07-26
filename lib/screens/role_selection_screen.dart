// lib/screens/role_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import 'package:steel_suvidha/screens/login_screen.dart'; // Import your LoginScreen

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg', // Your steel background image
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          // Dark overlay for readability
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- NEW: Professional Welcome Message ---
                  Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 600), delay: Duration(milliseconds: 100)),
                      SlideEffect(begin: Offset(0, -0.1), end: Offset(0, 0), duration: Duration(milliseconds: 600), delay: Duration(milliseconds: 100)),
                    ],
                    child: Column(
                      children: [
                        Text(
                          'Welcome to Steel Suvidha!',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Please select your role to continue.',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), // Space after the new greeting

                  // Existing "Select Your Role" title (you can decide to keep or remove this
                  // since "Please select your role..." is now part of the welcome message)
                  // For now, let's remove it to avoid redundancy and use the new greeting.
                  /*
                  Text(
                    'Select Your Role',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  */

                  // Role Cards
                  _buildRoleCard(context, 'Buyer', Icons.shopping_cart, 'buyer'),
                  const SizedBox(height: 20),
                  _buildRoleCard(context, 'Seller', Icons.store, 'seller'),
                  const SizedBox(height: 20),
                  _buildRoleCard(context, 'Admin', Icons.security, 'admin'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(BuildContext context, String title, IconData icon, String role) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.9), // Slightly transparent card
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(selectedRole: role),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey.shade600),
            ],
          ),
        ),
      ),
    );
  }
}