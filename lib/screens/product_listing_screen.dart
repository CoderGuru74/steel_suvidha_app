// lib/screens/product_listing_screen.dart (White/Blue Theme with Custom Chip Selection)
import 'package:flutter/material.dart';
import 'package:figma_app/widgets/custom_app_bar.dart';
import 'package:figma_app/widgets/bottom_nav_bar.dart';
import 'package:figma_app/widgets/custom_filter_chip.dart'; // Make sure this widget is correctly defined
import 'package:figma_app/widgets/product_card.dart';
import 'package:figma_app/screens/home_screen.dart';
import 'package:figma_app/screens/request_quote_screen.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String? _selectedMetalType;
  String? _selectedCategory;
  String? _selectedBrand;
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
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Metal Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildMetalTypeFilter(), // This remains as existing filter chips
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
            // This dropdown can remain a standard dropdown if you prefer, or changed to chip selection
            _buildStandardDropdown( // Reverted to a simpler dropdown for "Category"
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
            _buildChipSelectionField( // Custom chip selection for Brand
              context: context,
              title: 'Select Brand',
              selectedValue: _selectedBrand,
              options: [
                'SAIL', 'TATA', 'Jindal', 'JSW', 'VIZAG', 'Shyam Steel',
                'SEL Tiger', 'SRMB', 'Any Primary Brand',
                'Secondary Brand X', 'Secondary Brand Y', 'Secondary Brand Z'
              ],
              onChanged: (newValue) {
                setState(() {
                  _selectedBrand = newValue;
                });
              },
            ),
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
            _buildChipSelectionField( // Custom chip selection for Grade
              context: context,
              title: 'Select Grade',
              selectedValue: _selectedGrade,
              options: ['500 D', '550 D', '600 D'],
              onChanged: (newValue) {
                setState(() {
                  _selectedGrade = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Select Product Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 10),
            _buildChipSelectionField( // Custom chip selection for Product Size
              context: context,
              title: 'Select Size',
              selectedValue: _selectedProductSize,
              options: ['6 mm', '8 mm', '10 mm', '12 mm', '16 mm', '20 mm', '25 mm', '32 mm'],
              onChanged: (newValue) {
                setState(() {
                  _selectedProductSize = newValue;
                });
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Builder(
                builder: (BuildContext innerContext) {
                  return ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(innerContext).showSnackBar(
                        const SnackBar(content: Text('Applying Filters...')),
                      );
                      print('Selected Metal Type: $_selectedMetalType');
                      print('Selected Category: $_selectedCategory');
                      print('Selected Brand: $_selectedBrand');
                      print('Selected Grade: $_selectedGrade');
                      print('Selected Product Size: $_selectedProductSize');

                      print('DEBUG: Current innerContext is: $innerContext');
                      print('DEBUG: Navigator found: ${Navigator.of(innerContext).toString()}');

                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.push(
                          innerContext,
                          MaterialPageRoute(builder: (context) => const RequestQuoteScreen()),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF673AB7),
                      foregroundColor: Colors.white,
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
                  );
                }
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
              imageUrl: 'assets/images/close-up-metallic-plates.jpg',
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
              imageUrl: 'assets/images/steel.png',
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
              imageUrl: 'assets/images/aluminum.png',
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
            inactiveBackgroundColor: Colors.grey.shade200,
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

  // A standard dropdown for categories (can be replaced with chip selection too)
  Widget _buildStandardDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.grey),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black87),
          dropdownColor: Colors.white,
          isExpanded: true,
          style: const TextStyle(color: Colors.black87, fontSize: 16),
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

  // New widget to build the custom field that triggers the chip selection sheet
  Widget _buildChipSelectionField({
    required BuildContext context,
    required String title,
    required String? selectedValue,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    return GestureDetector(
      onTap: () async {
        final String? result = await _showChipSelectionSheet(
          context: context,
          title: title,
          options: options,
          selectedValue: selectedValue,
        );
        if (result != null) {
          onChanged(result);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: selectedValue == null
                  ? Text(
                      'Select',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: Text(
                        selectedValue,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // New function to show the modal bottom sheet with horizontally arranged chips
  Future<String?> _showChipSelectionSheet({
    required BuildContext context,
    required String title,
    required List<String> options,
    required String? selectedValue,
  }) async {
    String? tempSelectedValue = selectedValue;

    return await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true, // Allows content to take more height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext sheetContext) {
        return StatefulBuilder( // Use StatefulBuilder to allow internal state changes within the bottom sheet
          builder: (BuildContext context, StateSetter setStateInSheet) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.0,
                right: 16.0,
                top: 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Takes minimum space
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10.0, // Horizontal space between chips
                    runSpacing: 10.0, // Vertical space between lines of chips
                    children: options.map((option) {
                      bool isSelected = tempSelectedValue == option;
                      return CustomFilterChip( // Using your existing CustomFilterChip
                        label: option,
                        isSelected: isSelected,
                        onSelected: (selected) {
                          setStateInSheet(() { // Update state within the sheet
                            tempSelectedValue = selected ? option : null;
                          });
                        },
                        // You can customize colors here to match your theme
                        selectedBackgroundColor: Theme.of(context).primaryColor,
                        selectedLabelColor: Colors.white,
                        inactiveBackgroundColor: Colors.grey.shade200,
                        inactiveLabelColor: Colors.black87,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, tempSelectedValue); // Return selected value
                      },
                      child: const Text('Select'),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }
}