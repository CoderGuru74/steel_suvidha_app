import 'package:flutter/material.dart';
import 'package:figma_app/widgets/seller_product_list_item.dart';

// Define a simple model for a seller's product
class SellerProduct {
  final String id;
  final String imageUrl;
  final String name;
  final String category;
  final String status;

  // Add 'const' to the constructor here
  const SellerProduct({ // <--- ADDED 'const' KEYWORD HERE
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.status,
  });
}

class SellerMyProductsScreen extends StatelessWidget {
  const SellerMyProductsScreen({super.key});

  // Dummy product data based on the provided image
  // IMPORTANT: Ensure these image paths (e.g., 'assets/images/steel_beam.png')
  // exist in your project's 'assets/images/' folder, and that
  // 'assets/images/' is listed in your pubspec.yaml under 'flutter: assets:'.
  // If images are not found, the errorBuilder in SellerProductListItem will show a placeholder.
  final List<SellerProduct> dummyProducts = const [
    // Now these can be 'const' because the SellerProduct constructor is 'const'
    SellerProduct( // No 'const' needed here anymore as the list itself is const and infers it
      id: 'prod001',
      imageUrl: 'assets/images/steel_beam.png',
      name: 'Steel Beam',
      category: 'Steel',
      status: 'Active',
    ),
    SellerProduct(
      id: 'prod002',
      imageUrl: 'assets/images/rebar.png',
      name: 'Reinforcing Bar',
      category: 'Rebar',
      status: 'Active',
    ),
    SellerProduct(
      id: 'prod003',
      imageUrl: 'assets/images/steel_plate.png',
      name: 'Steel Plate',
      category: 'Steel',
      status: 'Inactive',
    ),
    SellerProduct(
      id: 'prod004',
      imageUrl: 'assets/images/steel_coil.png',
      name: 'Steel Coil',
      category: 'Steel',
      status: 'Active',
    ),
    SellerProduct(
      id: 'prod005',
      imageUrl: 'assets/images/steel_sheet.png',
      name: 'Steel Sheet',
      category: 'Steel',
      status: 'Active',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigate to Add New Product Screen')),
              );
            },
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Add New Product'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              foregroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
              ),
              elevation: 0,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: dummyProducts.length,
              itemBuilder: (context, index) {
                final product = dummyProducts[index];
                return SellerProductListItem(
                  imageUrl: product.imageUrl,
                  productName: product.name,
                  productCategory: product.category,
                  status: product.status,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped on ${product.name}')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}