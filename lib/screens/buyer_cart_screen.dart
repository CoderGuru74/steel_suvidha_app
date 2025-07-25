import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// A simple model for items in the cart
class CartItem {
  final String productName;
  double quantity; // e.g., in tons
  double? targetedPricePerUnit; // e.g., per ton
  DateTime? deliveryDate;

  CartItem({
    required this.productName,
    this.quantity = 1.0,
    this.targetedPricePerUnit,
    this.deliveryDate,
  });
}

class BuyerCartScreen extends StatefulWidget {
  const BuyerCartScreen({super.key});

  @override
  State<BuyerCartScreen> createState() => _BuyerCartScreenState();
}

class _BuyerCartScreenState extends State<BuyerCartScreen> {
  // Dummy cart items for demonstration.
  // In a real app, these would come from an "Add to Cart" action
  // and possibly a global state management solution.
  final List<CartItem> _cartItems = [
    CartItem(
      productName: 'Carbon Steel Plates 20mm (SAIL, 500 D)',
      quantity: 5.0,
      targetedPricePerUnit: 45000.0,
      deliveryDate: DateTime.now().add(const Duration(days: 7)),
    ),
    CartItem(
      productName: 'Aluminum Angles 50mm (Jindal)',
      quantity: 2.0,
      targetedPricePerUnit: 180000.0,
      deliveryDate: DateTime.now().add(const Duration(days: 14)),
    ),
    CartItem(
      productName: 'TMT Rebars 16mm (TATA, 550 D)',
      quantity: 10.0,
    ),
  ];

  // Dummy delivery location (replace with actual user data logic later)
  String _deliveryLocation = '123, ABC Street, XYZ City, State, 123456';

  // For date picker
  Future<void> _selectDate(BuildContext context, CartItem item) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: item.deliveryDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)), // 2 years from now
    );
    if (picked != null && picked != item.deliveryDate) {
      setState(() {
        item.deliveryDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Location:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: double.infinity,
              child: Text(
                _deliveryLocation,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit location feature to be added!')),
                  );
                  // TODO: Implement logic to allow user to edit/select delivery location
                },
                icon: const Icon(Icons.edit, size: 18),
                label: const Text('Edit Location'),
              ),
            ),
            const Divider(height: 30),

            Text(
              'Items in Cart (${_cartItems.length})',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _cartItems.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Your cart is empty. Add some products!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.productName,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        _cartItems.removeAt(index);
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${item.productName} removed from cart.')),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Quantity (Tons/Units)',
                                  border: OutlineInputBorder(),
                                  suffixText: 'Tons',
                                ),
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(text: item.quantity.toStringAsFixed(1)),
                                onChanged: (value) {
                                  setState(() {
                                    item.quantity = double.tryParse(value) ?? item.quantity;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: const InputDecoration(
                                  labelText: 'Targeted Price (per Ton/Unit)',
                                  border: OutlineInputBorder(),
                                  prefixText: '₹ ',
                                ),
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(text: item.targetedPricePerUnit?.toStringAsFixed(2) ?? ''),
                                onChanged: (value) {
                                  setState(() {
                                    item.targetedPricePerUnit = double.tryParse(value);
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => _selectDate(context, item),
                                child: AbsorbPointer( // Prevents TextField from being editable directly
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'Required Delivery Date',
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.calendar_today),
                                    ),
                                    controller: TextEditingController(
                                      text: item.deliveryDate != null
                                          ? DateFormat('dd MMM yyyy').format(item.deliveryDate!)
                                          : '',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _cartItems.isEmpty
                    ? null // Disable button if cart is empty
                    : () {
                        // Logic to collect all data and send for quote
                        // You would typically send _cartItems list to a service
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Requesting quote for all items!')),
                        );
                        // Example of how to access data:
                        // for (var item in _cartItems) {
                        //   print('Product: ${item.productName}, Qty: ${item.quantity}, Target Price: ${item.targetedPricePerUnit}, Delivery: ${item.deliveryDate}');
                        // }
                        // Navigator.pop(context); // Optionally go back after requesting quote
                      },
                icon: const Icon(Icons.send),
                label: const Text('Request Quote for All', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}