// lib/screens/request_quote_screen.dart
import 'package:flutter/material.dart';
import 'package:figma_app/widgets/custom_app_bar.dart'; // Make sure this import is here

class RequestQuoteScreen extends StatefulWidget {
  const RequestQuoteScreen({super.key});

  @override
  State<RequestQuoteScreen> createState() => _RequestQuoteScreenState();
}

class _RequestQuoteScreenState extends State<RequestQuoteScreen> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _targetPriceController = TextEditingController();
  final TextEditingController _deliveryAddressController = TextEditingController();
  final TextEditingController _specificationsController = TextEditingController();

  String? _selectedRequiredMetal;
  DateTime? _selectedDeliveryDate;

  @override
  void dispose() {
    _quantityController.dispose();
    _targetPriceController.dispose();
    _deliveryAddressController.dispose();
    _specificationsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDeliveryDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).primaryColor, // Header background
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, // Selected day background
              onPrimary: Colors.white, // Text color on selected day
              surface: Theme.of(context).colorScheme.surface, // Background of dialog
              onSurface: Theme.of(context).colorScheme.onSurface, // Text color on dialog background
            ),
            dialogBackgroundColor: Theme.of(context).colorScheme.surface,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDeliveryDate) {
      setState(() {
        _selectedDeliveryDate = picked;
      });
    }
  }

  void _submitRequest() {
    // Implement logic to submit the request
    print('Quantity: ${_quantityController.text}');
    print('Target Price: ${_targetPriceController.text}');
    print('Delivery Address: ${_deliveryAddressController.text}');
    print('Required Metal: $_selectedRequiredMetal');
    print('Specifications: ${_specificationsController.text}');
    print('Required Delivery Date: ${_selectedDeliveryDate?.toLocal().toString().split(' ')[0]}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quote Request Submitted!')),
    );
    // You might want to navigate back or to a confirmation screen
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold background color is managed by ThemeData.scaffoldBackgroundColor in main.dart
      appBar: CustomAppBar(
        title: 'Request a Quote',
        showBackButton: true,
        showShoppingCart: false,
        breadcrumbs: const ['Products', 'Request Quote'],
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 15),
            // Example Order Summary details - you can populate these dynamically
            _buildSummaryRow('Quantity', '1000 units'),
            _buildSummaryRow('Target Price', '\$80/unit'),
            _buildSummaryRow('Delivery', '2024-07-20'), // Example, should be dynamic
            _buildSummaryRow('Total Quantity', '10 tons'),
            _buildSummaryRow('Estimated Cost', '\$50,000'), // Example

            const SizedBox(height: 30),

            Text(
              'Required Metal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            _buildCustomDropdown<String>(
              value: _selectedRequiredMetal,
              hint: 'Select required metal',
              items: ['Steel', 'Aluminum', 'Copper', 'Brass'],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRequiredMetal = newValue;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              'Specifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _specificationsController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter specifications (e.g., grade, finish, dimensions, standards)',
                alignLabelWithHint: true,
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 20),

            Text(
              'Quantity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter quantity',
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 20),

            Text(
              'Target Price (Optional)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _targetPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter target price',
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 20),

            Text(
              'Delivery Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _deliveryAddressController,
              decoration: InputDecoration(
                hintText: 'Enter delivery address',
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 20),

            Text(
              'Required Delivery Date (Optional)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: _selectedDeliveryDate == null
                        ? 'Select date'
                        : _selectedDeliveryDate!.toLocal().toString().split(' ')[0],
                    suffixIcon: Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
                  ),
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement file upload logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Upload Files functionality coming soon!')),
                  );
                },
                icon: const Icon(Icons.cloud_upload_outlined, color: Colors.white),
                label: const Text(
                  'Upload Files',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade600, // A neutral color for upload button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitRequest,
                child: const Text(
                  'Submit Request',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'How it Works',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 15),
            _buildHowItWorksStep(Icons.receipt_long, 'Your request will be reviewed by our team, and you\'ll receive quotes from verified suppliers within 24 hours.'),
            _buildHowItWorksStep(Icons.notifications_active_outlined, 'We\'ll notify you via email and in-app notifications.'),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
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

  Widget _buildHowItWorksStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}