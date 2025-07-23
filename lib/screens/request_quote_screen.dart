// lib/screens/request_quote_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class RequestQuoteScreen extends StatefulWidget {
  final String productName; // To pre-fill or reference the product for which quote is requested

  const RequestQuoteScreen({super.key, required this.productName});

  @override
  State<RequestQuoteScreen> createState() => _RequestQuoteScreenState();
}

class _RequestQuoteScreenState extends State<RequestQuoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _targetPriceController = TextEditingController();
  final TextEditingController _deliveryLocationController = TextEditingController();
  final TextEditingController _deliveryDateController = TextEditingController(); // For displaying selected date

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _deliveryDateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      // For now, just show a SnackBar. In a real app, send data to backend.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Quote Request Submitted for ${widget.productName}!'),
          duration: const Duration(seconds: 2),
        ),
      );
      // You would typically send:
      // _quantityController.text, _targetPriceController.text,
      // _deliveryLocationController.text, _selectedDate, (and uploaded files)
      Navigator.pop(context); // Go back to the previous screen (ProductListingScreen)
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _targetPriceController.dispose();
    _deliveryLocationController.dispose();
    _deliveryDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request a Quote'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request for: ${widget.productName}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Quantity Field
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  hintText: 'Enter quantity',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Target Price (Optional)
              TextFormField(
                controller: _targetPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Target Price (Optional)',
                  hintText: 'Enter target price per unit',
                ),
              ),
              const SizedBox(height: 15),

              // Delivery Location
              TextFormField(
                controller: _deliveryLocationController,
                decoration: const InputDecoration(
                  labelText: 'Delivery Location',
                  hintText: 'Enter delivery address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter delivery location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Required Delivery Date (Optional)
              TextFormField(
                controller: _deliveryDateController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: const InputDecoration(
                  labelText: 'Required Delivery Date (Optional)',
                  hintText: 'Select date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 20),

              // Upload Files Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('File upload functionality coming soon!')),
                    );
                    // TODO: Implement file picking logic
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Upload Files'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Submit Request Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  child: const Text('Submit Request', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 30),

              // How it Works section
              const Text(
                'How it Works',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Your request will be reviewed by our team, and you\'ll receive quotes from verified suppliers within 24 hours. We\'ll notify you via email and in-app notifications.',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}