import 'package:flutter/material.dart';
import 'package:figma_app/widgets/seller_order_item_card.dart';

class SellerNewOrdersTab extends StatelessWidget {
  SellerNewOrdersTab({super.key}); // NO 'const' HERE

  // IMPORTANT: No 'const' keyword here for the list itself, nor for individual SellerOrder instances
  final List<SellerOrder> dummyNewOrders = [
    SellerOrder( // NO 'const' here
      id: '12345',
      buyerName: 'Rahul Sharma',
      quantity: '100 tons',
      price: '\$50,000',
      productName: 'Steel Rods',
      status: 'New',
    ),
    SellerOrder( // NO 'const' here
      id: '67890',
      buyerName: 'Priya Verma',
      quantity: '50 tons',
      price: '\$25,000',
      productName: 'Steel Sheets',
      status: 'New',
    ),
    SellerOrder( // NO 'const' here
      id: '11223',
      buyerName: 'Amit Patel',
      quantity: '75 tons',
      price: '\$37,500',
      productName: 'Steel Beams',
      status: 'New',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: dummyNewOrders.length,
      itemBuilder: (context, index) {
        final order = dummyNewOrders[index];
        return SellerOrderItemCard(
          order: order,
          // UPDATED: Action widget now includes both Confirm Order and Chat buttons
          actionWidget: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the end
            children: [
              // Chat Button
              OutlinedButton( // Using OutlinedButton for a secondary action look
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening chat for Order ${order.id}')),
                  );
                  // TODO: Implement actual chat functionality here
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
                child: const Text(
                  'Chat',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8), // Space between buttons

              // Confirm Order Button
              Expanded( // Let Confirm Order button take remaining space if desired, or keep fixed width
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order ${order.id} Confirmed!')),
                    );
                    // TODO: Implement order confirmation logic (e.g., move to in-progress)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'Confirm Order',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}