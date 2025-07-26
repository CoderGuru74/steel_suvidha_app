// lib/screens/product_categories_screen.dart
import 'package:flutter/material.dart';
import 'package:steel_suvidha/screens/product_listing_screen.dart'; // Import the detailed listing screen

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hide back button for bottom nav bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Metal Type',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildCategoryCard(context, 'Steel', Icons.tungsten),
                  _buildCategoryCard(context, 'Aluminum', Icons.lightbulb_outline), // Placeholder icon
                  _buildCategoryCard(context, 'Copper', Icons.offline_bolt), // Placeholder icon
                  _buildCategoryCard(context, 'Zinc', Icons.filter_vintage), // Placeholder icon
                  _buildCategoryCard(context, 'Alloys', Icons.link), // Placeholder icon
                  // Add more categories as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          // Navigate to the detailed product listing page for the selected category
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductListingScreen(category: title), // Pass the category
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}