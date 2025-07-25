import 'package:flutter/material.dart';
import 'package:figma_app/widgets/seller_order_item_card.dart';
import 'package:intl/intl.dart'; // <--- CORRECTED IMPORT PATH

class SellerInProgressOrdersTab extends StatefulWidget {
  const SellerInProgressOrdersTab({super.key});

  @override
  State<SellerInProgressOrdersTab> createState() => _SellerInProgressOrdersTabState();
}

class _SellerInProgressOrdersTabState extends State<SellerInProgressOrdersTab> {
  // IMPORTANT: Removed 'const' from the list initialization
  final List<SellerOrder> dummyInProgressOrders = [ // <--- NO 'const' here
    SellerOrder( // <--- NO 'const' here
      id: '12345',
      buyerName: 'Rohan Sharma',
      quantity: '100 tons',
      price: '\$50,000',
      productName: 'Steel Rods',
      status: 'Accepted',
    ),
    SellerOrder( // <--- NO 'const' here
      id: '67890',
      buyerName: 'Neha Verma',
      quantity: '50 tons',
      price: '\$25,000',
      productName: 'Steel Sheets',
      status: 'Accepted',
    ),
    SellerOrder( // <--- NO 'const' here
      id: '11223',
      buyerName: 'Arjun Patel',
      quantity: '75 tons',
      price: '\$37,500',
      productName: 'Steel Beams',
      status: 'Accepted',
    ),
  ];

  final Map<String, DateTime?> _selectedDeliveryDates = {};

  @override
  void initState() {
    super.initState();
    for (var order in dummyInProgressOrders) {
      _selectedDeliveryDates[order.id] = null;
    }
  }

  Future<void> _selectDate(BuildContext context, String orderId) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDeliveryDates[orderId] ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2028),
    );
    if (picked != null && picked != _selectedDeliveryDates[orderId]) {
      setState(() {
        _selectedDeliveryDates[orderId] = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: dummyInProgressOrders.length,
      itemBuilder: (context, index) {
        final order = dummyInProgressOrders[index];
        final selectedDate = _selectedDeliveryDates[order.id];

        return SellerOrderItemCard(
          order: order,
          additionalInfoWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Expected Delivery Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectDate(context, order.id),
                child: AbsorbPointer(
                  child: TextField(
                    controller: TextEditingController(
                      text: selectedDate != null ? DateFormat('yyyy-MM-dd').format(selectedDate) : '',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Select Date',
                      suffixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actionWidget: ElevatedButton(
            onPressed: selectedDate != null
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Generated Invoice for Order ${order.id}')),
                    );
                  }
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Generated Estimate for Order ${order.id}')),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: Text(
              selectedDate != null ? 'Generate Invoice' : 'Generate Estimate',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}