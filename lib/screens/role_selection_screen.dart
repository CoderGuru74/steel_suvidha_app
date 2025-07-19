import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/screens/home_screen.dart';
import 'package:figma_app/screens/seller_dashboard_screen.dart';
import 'package:figma_app/screens/admin_dashboard_screen.dart';
import 'package:figma_app/widgets/particle_background_painter.dart'; // NEW import for particle background

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30), // Slower animation for subtle particle movement
    )..repeat(); // Loop indefinitely
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set a professional dark background color directly on the Scaffold or a base Container
      backgroundColor: const Color(0xFF1C2C3F), // Deep professional blue-grey
      appBar: AppBar(
        title: const Text(
          'Select Your Role',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFB8CEE4),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // Particle Background Animation
          Positioned.fill(
            child: CustomPaint(
              painter: ParticleBackgroundPainter(_animationController, numberOfParticles: 80), // Control particle count
            ),
          ),
          // No need for a black overlay if base color and particles contrast well
          // Removed: Positioned.fill(child: Container(color: Colors.black.withOpacity(0.7))),

          // Role Selection Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15), // Semi-transparent white background for the card
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "How do you want to use the app?" Text with Animation
                    const Text(
                      'How do you want to use the app?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ).animate()
                    .fadeIn(duration: 800.ms, delay: 300.ms)
                    .slideY(begin: 0.1, end: 0, duration: 800.ms),

                    const SizedBox(height: 40),

                    // Role selection buttons - each button has its own .animate()
                    _buildRoleButton(
                      context,
                      'Buyer',
                      Icons.shopping_cart_outlined,
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      ),
                    ).animate()
                    .fadeIn(duration: 600.ms, delay: 0.ms)
                    .slideY(begin: 0.1, end: 0, duration: 600.ms),

                    const SizedBox(height: 20),

                    _buildRoleButton(
                      context,
                      'Seller',
                      Icons.storefront_outlined,
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SellerDashboardScreen()),
                      ),
                    ).animate()
                    .fadeIn(duration: 600.ms, delay: 150.ms)
                    .slideY(begin: 0.1, end: 0, duration: 600.ms),

                    const SizedBox(height: 20),

                    _buildRoleButton(
                      context,
                      'Admin',
                      Icons.admin_panel_settings_outlined,
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
                      ),
                    ).animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideY(begin: 0.1, end: 0, duration: 600.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 28),
      label: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB8CEE4),
        foregroundColor: const Color(0xFF131416),
        minimumSize: const Size(double.infinity, 60),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Color(0xFF131416), width: 1.5),
        ),
        elevation: 8,
      ),
    );
  }
}