// lib/screens/home_screen.dart (Corrected Buyer Homepage - White/Blue Theme)
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/screens/product_listing_screen.dart'; // To navigate to product listing
import 'package:figma_app/widgets/custom_app_bar.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Set to 0 for Home tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on the tapped item
    switch (index) {
      case 0: // Home tab (this screen)
        break;
      case 1: // Products tab
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProductListingScreen()),
        );
        break;
      case 2: // Requests tab
      // TODO: Navigate to Requests screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Requests')),
        );
        break;
      case 3: // Orders tab
      // TODO: Navigate to Orders screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Orders')),
        );
        break;
      case 4: // Profile tab
      // TODO: Navigate to Profile screen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Profile')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color handled by ThemeData in main.dart
      appBar: CustomAppBar(
        title: 'Steel Suvidha',
        showBackButton: false,
        showShoppingCart: true,
        breadcrumbs: const ['Home'],
        onShoppingCartPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shopping Cart Pressed')),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main Banner Section
            Stack(
              children: [
                Image.asset(
                  'assets/images/banner.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey.shade300, // Lighter placeholder
                    child: Center(
                      child: Text('Main Banner Image Missing', style: TextStyle(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7))),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.4), // Keep dark overlay for text contrast
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Find the Steel You\nNeed, Fast.',
                          style: TextStyle(
                            color: Colors.white, // Keep white text on dark overlay
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 8),
                        const Text(
                          'Connect with verified suppliers and request steel with ease.',
                          style: TextStyle(
                            color: Colors.white70, // Keep white text on dark overlay
                            fontSize: 14,
                          ),
                        ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideX(begin: -0.1, end: 0),
                      ],
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 800.ms),
            const SizedBox(height: 20),

            // Search Bar & Request a Quote Button (outside of banner image)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface, // Use theme surface color
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300), // Light border
                    ),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface), // Use theme text color
                      decoration: InputDecoration(
                        hintText: 'Search for metal type, shape, grade, quantity...',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)), // Adjust hint color
                        icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)), // Adjust icon color
                        border: InputBorder.none, // Remove default TextField border
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Requesting a Quote...')),
                        );
                      },
                      // Colors handled by ElevatedButtonTheme in main.dart
                      child: const Text(
                        'Request a Quote',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 800.ms).slideY(begin: 0.1, end: 0),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Featured Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Featured Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground, // Use theme text color
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 1000.ms),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 150, // Height for the horizontal scroll view
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildCategoryCard('Steel', 'assets/images/steel.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard('Aluminum', 'assets/images/aluminum.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard('Copper', 'assets/images/copper.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard('Plates', 'assets/images/close-up-metallic-plates.jpg'),
                  const SizedBox(width: 15),
                ].animate(interval: 100.ms).fadeIn(duration: 400.ms, delay: 1200.ms).slideX(begin: 0.1, end: 0),
              ),
            ),
            const SizedBox(height: 40),

            // How It Works Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How It Works',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground, // Use theme text color
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 1400.ms),
                  const SizedBox(height: 20),
                  ...[
                    _buildHowItWorksStep(Icons.edit_note, 'Submit Request'),
                    _buildHowItWorksStep(Icons.receipt_long, 'Get Quotes'),
                    _buildHowItWorksStep(Icons.check_circle_outline, 'Choose & Order'),
                    _buildHowItWorksStep(Icons.local_shipping_outlined, 'Receive Delivery'),
                  ].animate(interval: 100.ms).fadeIn(duration: 400.ms, delay: 1600.ms).slideX(begin: -0.05, end: 0),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Why Choose Us Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose Us',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground, // Use theme text color
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 1800.ms),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildWhyChooseUsCard(Icons.verified_user_outlined, 'Trusted Suppliers'),
                      _buildWhyChooseUsCard(Icons.timer_outlined, 'Quick Response Time'),
                      _buildWhyChooseUsCard(Icons.verified, 'Quality Assurance'),
                      _buildWhyChooseUsCard(Icons.local_shipping_outlined, 'Reliable Delivery'),
                    ].animate(interval: 100.ms).fadeIn(duration: 400.ms, delay: 2000.ms).scale(begin: const Offset(0.9,0.9), end: const Offset(1.0,1.0)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Ready to Get Started? Request a Quote Now.
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface, // Use theme surface color
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Ready to Get Started?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface, // Use theme text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Request a Quote Now.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), // Adjust text color
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Requesting a Quote from bottom button...')),
                        );
                      },
                      // Colors handled by ElevatedButtonTheme in main.dart
                      child: const Text(
                        'Request a Quote',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 600.ms, delay: 2400.ms).slideY(begin: 0.1, end: 0),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Helper method for Featured Categories cards
  Widget _buildCategoryCard(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigating to $title products')),
        );
      },
      child: Container(
        width: 150, // Fixed width for horizontal scroll
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface, // Use theme surface color
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Lighter shadow
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300, // Lighter placeholder
                    child: Center(
                      child: Icon(Icons.broken_image, color: Colors.grey.shade600, size: 40), // Darker placeholder icon
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, // Use theme text color
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for "How It Works" steps
  Widget _buildHowItWorksStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 30), // Use theme primary color for icons
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 18), // Use theme text color
          ),
        ],
      ),
    );
  }

  // Helper method for "Why Choose Us" cards
  Widget _buildWhyChooseUsCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Use theme surface color
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Lighter shadow
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 40), // Use theme primary color for icons
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface, // Use theme text color
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}