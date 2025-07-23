// lib/screens/home_screen.dart (Now contains only the content for the Home tab)
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/widgets/custom_app_bar.dart';

// Renamed from HomeScreen to HomeScreenContent as it's now part of BuyerMainScreen
class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Keep Scaffold for its own AppBar
      appBar: CustomAppBar(
        title: 'Steel Suvidha', // Your app title
        showBackButton: false, // No back button on the main home tab
        showShoppingCart: true,
        breadcrumbs: const ['Home'],
        onShoppingCartPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shopping Cart Pressed from Home')),
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
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Text('Main Banner Image Missing', style: TextStyle(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7))),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
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
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideX(begin: -0.1, end: 0),
                        const SizedBox(height: 8),
                        const Text(
                          'Connect with verified suppliers and request steel with ease.',
                          style: TextStyle(
                            color: Colors.white70,
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

            // Search Bar & Request a Quote Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                      decoration: InputDecoration(
                        hintText: 'Search for metal type, shape, grade, quantity...',
                        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                        icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                        border: InputBorder.none,
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
                  color: Theme.of(context).colorScheme.onBackground,
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
                  _buildCategoryCard(context, 'Steel', 'assets/images/steel.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard(context, 'Aluminum', 'assets/images/aluminum.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard(context, 'Copper', 'assets/images/copper.png'),
                  const SizedBox(width: 15),
                  _buildCategoryCard(context, 'Plates', 'assets/images/close-up-metallic-plates.jpg'),
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
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 1400.ms),
                  const SizedBox(height: 20),
                  ...[
                    _buildHowItWorksStep(context, Icons.edit_note, 'Submit Request'),
                    _buildHowItWorksStep(context, Icons.receipt_long, 'Get Quotes'),
                    _buildHowItWorksStep(context, Icons.check_circle_outline, 'Choose & Order'),
                    _buildHowItWorksStep(context, Icons.local_shipping_outlined, 'Receive Delivery'),
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
                      color: Theme.of(context).colorScheme.onBackground,
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
                      _buildWhyChooseUsCard(context, Icons.verified_user_outlined, 'Trusted Suppliers'),
                      _buildWhyChooseUsCard(context, Icons.timer_outlined, 'Quick Response Time'),
                      _buildWhyChooseUsCard(context, Icons.verified, 'Quality Assurance'),
                      _buildWhyChooseUsCard(context, Icons.local_shipping_outlined, 'Reliable Delivery'),
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
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Ready to Get Started?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Request a Quote Now.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
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
    );
  }

  // Helper method for Featured Categories cards - now takes BuildContext
  Widget _buildCategoryCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigating to $title products')),
        );
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Icon(Icons.broken_image, color: Colors.grey.shade600, size: 40),
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
                  color: Theme.of(context).colorScheme.onSurface,
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

  // Helper method for "How It Works" steps - now takes BuildContext
  Widget _buildHowItWorksStep(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 30),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 18),
          ),
        ],
      ),
    );
  }

  // Helper method for "Why Choose Us" cards - now takes BuildContext
  Widget _buildWhyChooseUsCard(BuildContext context, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 40),
          const SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}