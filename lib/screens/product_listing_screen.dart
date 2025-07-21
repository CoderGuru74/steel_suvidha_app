// lib/screens/product_listing_screen.dart (White/Blue Theme)
import 'package:flutter/material.dart';
import 'package:figma_app/widgets/custom_app_bar.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart';
import 'package:figma_app/widgets/custom_filter_chip.dart';
import 'package:figma_app/widgets/product_spec_button.dart';
import 'package:figma_app/widgets/product_card.dart';
import 'package:figma_app/screens/home_screen.dart'; // Import the new Home Screen
import 'package:figma_app/screens/request_quote_screen.dart'; // Make sure this is present

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String? _selectedMetalType;
  String? _selectedCategory;
  String? _selectedBrandDropdown;
  String? _selectedBrandTab = 'Primary';
  List<String> _selectedBrands = [];
  String? _selectedGrade;
  String? _selectedProductSize;

  int _selectedIndex = 1; // Set to 1 for Products tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Requests')),
        );
        break;
      case 3:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navigate to Orders')),
        );
        break;
      case 4:
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
        showBackButton: true,
        showShoppingCart: true,
        breadcrumbs: const ['Home', 'Products'],
        onBackButtonPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        onShoppingCartPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shopping Cart Pressed')),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filters',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground, // Use theme text color
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Metal Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8), // Adjust text color
              ),
            ),
            const SizedBox(height: 10),
            _buildMetalTypeFilter(),
            const SizedBox(height: 20),
            Text(
              'Select Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildCustomDropdown(
              value: _selectedCategory,
              hint: 'Select',
              items: ['Angles', 'TMT Rebars', 'Flats', 'Squares', 'Channel'],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Categories: Angles, TMT Rebars, Flats, Squares, Channel',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Select Brand',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildCustomDropdown(
              value: _selectedBrandDropdown,
              hint: 'Select',
              items: ['Brand A', 'Brand B', 'Brand C'],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBrandDropdown = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildBrandTabs(),
            const SizedBox(height: 15),
            _buildBrandChips(),
            const SizedBox(height: 20),
            Text(
              'Select Grade',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildGradeChips(),
            const SizedBox(height: 20),
            Text(
              'Select Product',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildProductSpecButtons(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Applying Filters...')),
                  );
                  print('Selected Metal Type: $_selectedMetalType');
                  print('Selected Category: $_selectedCategory');
                  print('Selected Brand Dropdown: $_selectedBrandDropdown');
                  print('Selected Brand Tab: $_selectedBrandTab');
                  print('Selected Brands (Chips): $_selectedBrands');
                  print('Selected Grade: $_selectedGrade');
                  print('Selected Product Size: $_selectedProductSize');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF673AB7), // Use a contrasting blue/purple for this button
                  foregroundColor: Colors.white, // Text color on this button
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),
            ProductCard(
              productType: 'Carbon Steel',
              productName: 'Steel Plates',
              specs: 'Specs: 2mm, 4mm, 6mm',
              imageUrl: 'assets/images/close-up-metallic-plates.jpg', // Using one of your provided images
              onQuoteRequested: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quote requested for Steel Plates')),
                );
              },
            ),
            const SizedBox(height: 15),
            ProductCard(
              productType: 'Stainless Steel',
              productName: 'TMT Rebars',
              specs: 'Specs: 8mm, 10mm, 12mm',
              imageUrl: 'assets/images/steel.png', // Using one of your provided images
              onQuoteRequested: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quote requested for TMT Rebars')),
                );
              },
            ),
            const SizedBox(height: 15),
            ProductCard(
              productType: 'Aluminum',
              productName: 'Angles',
              specs: 'Specs: 25x25mm, 30x30mm',
              imageUrl: 'assets/images/aluminum.png', // Using one of your provided images
              onQuoteRequested: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Quote requested for Angles')),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildMetalTypeFilter() {
    return Row(
      children: [
        Expanded(
          child: CustomFilterChip(
            label: 'Steel',
            isSelected: _selectedMetalType == 'Steel',
            onSelected: (selected) {
              setState(() {
                _selectedMetalType = selected ? 'Steel' : null;
              });
            },
            inactiveBackgroundColor: Colors.grey.shade200, // Light grey
            inactiveLabelColor: Colors.black87,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomFilterChip(
            label: 'Stainless Steel',
            isSelected: _selectedMetalType == 'Stainless Steel',
            onSelected: (selected) {
              setState(() {
                _selectedMetalType = selected ? 'Stainless Steel' : null;
              });
            },
            inactiveBackgroundColor: Colors.grey.shade200,
            inactiveLabelColor: Colors.black87,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomFilterChip(
            label: 'Aluminum',
            isSelected: _selectedMetalType == 'Aluminum',
            onSelected: (selected) {
              setState(() {
                _selectedMetalType = selected ? 'Aluminum' : null;
              });
            },
            inactiveBackgroundColor: Colors.grey.shade200,
            inactiveLabelColor: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1), // Light border
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.grey), // Grey hint text
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black87), // Dark icon
          dropdownColor: Colors.white, // White dropdown background
          isExpanded: true,
          style: const TextStyle(color: Colors.black87, fontSize: 16), // Dark text style
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBrandTabs() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedBrandTab = 'Primary';
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _selectedBrandTab == 'Primary' ? Theme.of(context).primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: _selectedBrandTab == 'Primary' ? null : Border.all(color: Colors.grey.shade400),
            ),
            child: Text(
              'Primary',
              style: TextStyle(
                color: _selectedBrandTab == 'Primary' ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedBrandTab = 'Secondary';
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _selectedBrandTab == 'Secondary' ? Theme.of(context).primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: _selectedBrandTab == 'Secondary' ? null : Border.all(color: Colors.grey.shade400),
            ),
            child: Text(
              'Secondary',
              style: TextStyle(
                color: _selectedBrandTab == 'Secondary' ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBrandChips() {
    List<String> brands = _selectedBrandTab == 'Primary'
        ? ['SAIL', 'TATA', 'Jindal', 'JSW', 'VIZAG', 'Shyam Steel', 'SEL Tiger', 'SRMB', 'Any Primary Brand']
        : ['Secondary Brand X', 'Secondary Brand Y', 'Secondary Brand Z'];

    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: brands.map<Widget>((brand) {
        bool isSelected = _selectedBrands.contains(brand);
        return CustomFilterChip(
          label: brand,
          isSelected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedBrands.add(brand);
              } else {
                _selectedBrands.remove(brand);
              }
            });
          },
          inactiveBackgroundColor: Colors.grey.shade200, // Light grey
          inactiveLabelColor: Colors.black87,
          multiSelect: true,
        );
      }).toList(),
    );
  }

  Widget _buildGradeChips() {
    List<String> grades = ['500 D', '550 D', '600 D'];
    return Row(
      children: grades.map<Widget>((grade) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomFilterChip(
              label: grade,
              isSelected: _selectedGrade == grade,
              onSelected: (selected) {
                setState(() {
                  _selectedGrade = selected ? grade : null;
                });
              },
              inactiveBackgroundColor: Colors.grey.shade200, // Light grey
              inactiveLabelColor: Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProductSpecButtons() {
    List<String> sizes = ['6 mm', '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm'];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: sizes.length,
      itemBuilder: (context, index) {
        String size = sizes[index];
        return ProductSpecButton(
          label: size,
          isSelected: _selectedProductSize == size,
          onSelected: (selected) {
            setState(() {
              _selectedProductSize = selected ? size : null;
            });
          },
        );
      },
    );
  }
}