// lib/screens/product_listing_screen.dart
import 'package:flutter/material.dart';
import 'package:figma_app/screens/request_quote_screen.dart'; // Import the new RequestQuoteScreen

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
    _selectedMetalType = widget.category;
    if (widget.category == 'Steel') {
      _selectedCategory = 'Plates';
    }
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
                });
              },
            ),
            const SizedBox(height: 20),

            _buildFilterExpansionTile(
              title: 'Select Product',
              options: _productSizes,
              selectedValue: _selectedProductSize,
              onSelected: (value) {
                setState(() {
                  _selectedProductSize = value;
                });
              },
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Applying filters... (Actual filtering logic needed)')),
                  );
                },
                child: const Text('Apply Filters', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Products',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                // Determine a dummy product name for demonstration
                String dummyProductName = (_selectedCategory != null && _selectedCategory!.isNotEmpty)
                    ? 'Carbon Steel - ${_selectedCategory!} ${index + 1}'
                    : 'Carbon Steel Plate ${index + 1}';

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
                          child: (index % 2 == 0)
                              ? Image.asset('assets/images/steel_plate_placeholder.png', fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50))
                              : Image.asset('assets/images/product_placeholder.png', fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50)),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dummyProductName, // Use dummy product name here
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Specs: ${3 - index}mm, ${6 - index}mm, ${9 - index}mm',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    // Navigate to RequestQuoteScreen, passing product name
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RequestQuoteScreen(productName: dummyProductName),
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
    );
  }
}