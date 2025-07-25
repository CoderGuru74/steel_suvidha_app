import 'package:flutter/material.dart';
import 'package:figma_app/screens/request_quote_screen.dart'; // Import the RequestQuoteScreen
import 'package:figma_app/screens/buyer_cart_screen.dart'; // Import the new BuyerCartScreen

// 1. Define a simple Product Data Model
class Product {
  final String name;
  final String metalType;
  final String category;
  final String? brand;
  final String? grade;
  final String? size; // Product size (e.g., '6 mm')
  final String imageUrl; // For placeholder image

  Product({
    required this.name,
    required this.metalType,
    required this.category,
    this.brand,
    this.grade,
    this.size,
    required this.imageUrl, // Add image URL
  });
}

class ProductListingScreen extends StatefulWidget {
  final String category;

  const ProductListingScreen({super.key, required this.category});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String? _selectedMetalType;
  String? _selectedCategory;
  String? _selectedBrand;
  String? _selectedGrade;
  String? _selectedProductSize;

  // List of all dummy products
  late List<Product> _allProducts;
  // List of products after applying filters
  List<Product> _filteredProducts = [];

  final List<String> _metalTypes = ['Steel', 'Stainless Steel', 'Aluminum'];
  final List<String> _categories = ['Angles', 'TMT Rebars', 'Flats', 'Squares', 'Channel', 'Plates'];
  final List<String> _brands = ['SAIL', 'TATA', 'Jindal', 'JSW', 'VIZAG', 'Shyam Steel', 'SEL Tiger', 'SRMB', 'Any Primary Brand'];
  final List<String> _grades = ['500 D', '550 D', '600 D', '415', '415 D', '500'];
  final List<String> _productSizes = [
    '6 mm', '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm',
    '40 mm', '50 mm', '60 mm', '75 mm', '100 mm',
  ];

  @override
  void initState() {
    super.initState();
    _selectedMetalType = widget.category; // Initialize with the category passed from previous screen

    // Initialize all products with some dummy data
    _allProducts = _generateDummyProducts();
    // Apply initial filters based on the selected category
    _applyFilters();
  }

  // Helper to generate a diverse set of dummy products
  List<Product> _generateDummyProducts() {
    List<Product> products = [];
    int idCounter = 0;
    for (String metal in _metalTypes) {
      for (String cat in _categories) {
        for (String brand in _brands.take(3)) { // Use a subset of brands for variety
          for (String grade in _grades.take(2)) { // Use a subset of grades
            for (String size in _productSizes.take(3)) { // Use a subset of sizes
              idCounter++;
              products.add(
                Product(
                  name: '$metal $cat $size (${brand.split(' ')[0]}, ${grade.split(' ')[0]})', // Shorter name for display
                  metalType: metal,
                  category: cat,
                  brand: brand,
                  grade: grade,
                  size: size,
                  imageUrl: idCounter % 2 == 0
                      ? 'assets/images/steel_plate_placeholder.png'
                      : 'assets/images/product_placeholder.png',
                ),
              );
            }
          }
        }
      }
    }
    // Add a few extra specific ones
    products.add(Product(name: 'Super Steel TMT 12 mm (SAIL, 500 D)', metalType: 'Steel', category: 'TMT Rebars', brand: 'SAIL', grade: '500 D', size: '12 mm', imageUrl: 'assets/images/steel_plate_placeholder.png'));
    products.add(Product(name: 'Alloy Plate 100 mm (Jindal, 600 D)', metalType: 'Aluminum', category: 'Plates', brand: 'Jindal', grade: '600 D', size: '100 mm', imageUrl: 'assets/images/product_placeholder.png'));
    products.add(Product(name: 'Copper Wire 6 mm (VIZAG)', metalType: 'Copper', category: 'Channel', brand: 'VIZAG', grade: '415', size: '6 mm', imageUrl: 'assets/images/product_placeholder.png'));
    return products;
  }

  // NEW: Function to apply filters based on current selections
  void _applyFilters() {
    _filteredProducts = _allProducts.where((product) {
      bool matchesMetalType = _selectedMetalType == null || product.metalType == _selectedMetalType;
      bool matchesCategory = _selectedCategory == null || product.category == _selectedCategory;
      bool matchesBrand = _selectedBrand == null || product.brand == _selectedBrand;
      bool matchesGrade = _selectedGrade == null || product.grade == _selectedGrade;
      bool matchesProductSize = _selectedProductSize == null || product.size == _selectedProductSize;

      return matchesMetalType && matchesCategory && matchesBrand && matchesGrade && matchesProductSize;
    }).toList();
  }

  Widget _buildChoiceChip(String label, String? selectedValue, ValueChanged<bool> onSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedValue == label,
      onSelected: onSelected,
      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
      labelStyle: TextStyle(
        color: selectedValue == label ? Theme.of(context).primaryColor : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selectedValue == label ? Theme.of(context).primaryColor : Colors.grey.shade300,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }

  Widget _buildFilterExpansionTile({
    required String title,
    required List<String> options,
    required String? selectedValue,
    required ValueChanged<String?> onSelected,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: options.map((option) => _buildChoiceChip(option, selectedValue, (bool selected) {
              onSelected(selected ? option : null);
            })).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Products'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home > Products > ${widget.category} > ${_selectedCategory ?? ''}',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 20),
            const Text(
              'Filters',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Text('Metal Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _metalTypes.map((type) => _buildChoiceChip(type, _selectedMetalType, (bool selected) {
                setState(() {
                  _selectedMetalType = selected ? type : null;
                  _applyFilters(); // Apply filters instantly
                });
              })).toList(),
            ),
            const SizedBox(height: 20),

            const Text('Select Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                hintText: 'Select...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                  _applyFilters(); // Apply filters instantly
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Categories: Angles, TMT Rebars, Flats, Squares, Channel, Plates',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 20),

            _buildFilterExpansionTile(
              title: 'Select Brand',
              options: _brands,
              selectedValue: _selectedBrand,
              onSelected: (value) {
                setState(() {
                  _selectedBrand = value;
                  _applyFilters(); // Apply filters instantly
                });
              },
            ),
            const SizedBox(height: 20),

            _buildFilterExpansionTile(
              title: 'Select Grade',
              options: _grades,
              selectedValue: _selectedGrade,
              onSelected: (value) {
                setState(() {
                  _selectedGrade = value;
                  _applyFilters(); // Apply filters instantly
                });
              },
            ),
            const SizedBox(height: 20),

            _buildFilterExpansionTile(
              title: 'Select Product Size', // Changed title for clarity
              options: _productSizes,
              selectedValue: _selectedProductSize,
              onSelected: (value) {
                setState(() {
                  _selectedProductSize = value;
                  _applyFilters(); // Apply filters instantly
                });
              },
            ),
            const SizedBox(height: 30),

            // REMOVED: The "Apply Filters" ElevatedButton is removed from here

            Text(
              'Products (${_filteredProducts.length} Found)', // Show count of filtered products
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Display filtered products
            _filteredProducts.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'No products found matching your criteria.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _filteredProducts.length, // Use filtered product count
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index]; // Get product from filtered list
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: Image.asset(product.imageUrl, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50)),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name, // Use actual product name
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Type: ${product.metalType}, Category: ${product.category}',
                                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                                    ),
                                    if (product.brand != null && product.brand!.isNotEmpty) Text('Brand: ${product.brand}', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                                    if (product.grade != null && product.grade!.isNotEmpty) Text('Grade: ${product.grade}', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                                    if (product.size != null && product.size!.isNotEmpty) Text('Size: ${product.size}', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RequestQuoteScreen(productName: product.name),
                                            ),
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Theme.of(context).primaryColor,
                                          side: BorderSide(color: Theme.of(context).primaryColor),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: const Text('Request Quote'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      // NEW: Floating Action Button for the Cart
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to BuyerCartScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BuyerCartScreen(), // Navigate to your new cart screen
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positions it at the bottom-right
    );
  }
}