import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/feature_card.dart';
import 'widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/banner.png'), // Add banner image in assets
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  FeatureCard(
                    title: 'Easy Ordering',
                    description: 'Order steel in few clicks with flexible payment options.',
                    icon: Icons.shopping_cart,
                  ),
                  SizedBox(height: 12),
                  FeatureCard(
                    title: 'Live Price',
                    description: 'Track real-time steel prices directly on the app.',
                    icon: Icons.trending_up,
                  ),
                  SizedBox(height: 12),
                  FeatureCard(
                    title: 'Quick Delivery',
                    description: 'Guaranteed 48-hr delivery across Patna.',
                    icon: Icons.local_shipping,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
