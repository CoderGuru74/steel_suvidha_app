import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:figma_app/widgets/custom_app_bar.dart'; // Assume this exists

class RequestQuoteScreen extends StatefulWidget {
  const RequestQuoteScreen({super.key});

  @override
  State<RequestQuoteScreen> createState() => _RequestQuoteScreenState();
}

class _RequestQuoteScreenState extends State<RequestQuoteScreen> {
  String? _selectedMetal;
  final TextEditingController _specificationsController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _targetPriceController = TextEditingController();
  final TextEditingController _deliveryLocationController = TextEditingController();
  final TextEditingController _deliveryDateController = TextEditingController();

  DateTime? _selectedDeliveryDate;

  @override
  void dispose() {
    _specificationsController.dispose();
    _quantityController.dispose();
    _targetPriceController.dispose();
    _deliveryLocationController.dispose();
    _deliveryDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDeliveryDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDeliveryDate) {
      setState(() {
        _selectedDeliveryDate = picked;
        _deliveryDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitRequest() {
    print('Request Submitted:');
    print('Required Metal: $_selectedMetal');
    print('Specifications: ${_specificationsController.text}');
    print('Quantity: ${_quantityController.text}');
    print('Target Price: ${_targetPriceController.text}');
    print('Delivery Location: ${_deliveryLocationController.text}');
    print('Delivery Date: ${_deliveryDateController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quote Request Submitted!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Steel Suvidha',
        showBackButton: true,
        showShoppingCart: true,
        breadcrumbs: const ['Products', 'Request a Quote'],
        onBackButtonPressed: () {
          Navigator.pop(context);
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
              'Request a Quote',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildOrderSummary(),
            const SizedBox(height: 20),
            _buildSectionTitle('Required Metal'),
            _buildMetalDropdown(), // This is where the styling is applied
            const SizedBox(height: 20),
            _buildSectionTitle('Specifications'),
            _buildSpecificationsField(),
            const SizedBox(height: 20),
            _buildSectionTitle('Quantity'),
            _buildTextField(_quantityController, 'Enter quantity', keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            _buildSectionTitle('Target Price (Optional)'),
            _buildTextField(_targetPriceController, 'Enter target price', keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            _buildSectionTitle('Delivery Location'),
            _buildTextField(_deliveryLocationController, 'Enter delivery address'),
            const SizedBox(height: 20),
            _buildSectionTitle('Required Delivery Date (Optional)'),
            _buildDatePickerField(),
            const SizedBox(height: 20),
            _buildUploadFilesButton(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitRequest,
                child: const Text('Submit Request'),
              ),
            ),
            const SizedBox(height: 30),
            _buildHowItWorksSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSummaryItem('Quantity', '1000 units')),
            Expanded(child: _buildSummaryItem('Target Price', '\$50/unit')),
          ],
        ),
        const Divider(height: 20, thickness: 1),
        Row(
          children: [
            Expanded(child: _buildSummaryItem('Delivery', '2024-07-20')),
            Expanded(child: _buildSummaryItem('Total Quantity', '10 tons')),
          ],
        ),
        const Divider(height: 20, thickness: 1),
        Align(
          alignment: Alignment.centerLeft,
          child: _buildSummaryItem('Estimated Cost', '\$50,000'),
        ),
        const Divider(height: 20, thickness: 1),
      ],
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildMetalDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Adjusted vertical padding
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12), // Rounded corners for the container
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedMetal,
          hint: Text(
            'Select',
            style: TextStyle(color: Colors.grey),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
          onChanged: (String? newValue) {
            setState(() {
              _selectedMetal = newValue;
            });
          },
          items: <String>['Steel', 'Stainless Steel', 'Aluminum', 'Copper']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              // Apply styling to the child of DropdownMenuItem to make it look like a chip
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: value == _selectedMetal ? Theme.of(context).primaryColor : Colors.grey.shade200, // Background color based on selection
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the "chip"
                  border: Border.all(
                    color: value == _selectedMetal ? Theme.of(context).primaryColor : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    color: value == _selectedMetal ? Colors.white : Colors.black87, // Text color
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
          selectedItemBuilder: (BuildContext context) {
            // This builder is for what is shown in the closed dropdown button
            return <String>['Steel', 'Stainless Steel', 'Aluminum', 'Copper']
                .map<Widget>((String value) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: value == _selectedMetal ? Theme.of(context).primaryColor : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: value == _selectedMetal ? Theme.of(context).primaryColor : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: value == _selectedMetal ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _buildSpecificationsField() {
    return TextField(
      controller: _specificationsController,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Enter specifications',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
      ),
    );
  }

  Widget _buildDatePickerField() {
    return TextField(
      controller: _deliveryDateController,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: 'Select date',
        suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
      ),
    );
  }

  Widget _buildUploadFilesButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload Files Pressed')),
          );
          // Implement file upload logic here
        },
        icon: const Icon(Icons.cloud_upload_outlined),
        label: const Text('Upload Files'),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black87,
          side: BorderSide(color: Colors.grey.shade400),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHowItWorksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How it Works',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Your request will be reviewed by our team, and you\'ll receive quotes from verified suppliers within 24 hours. We\'ll notify you via email and in-app notifications.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}