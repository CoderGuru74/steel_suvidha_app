import 'package:flutter/material.dart';
import 'package:figma_app/widgets/seller_order_item_card.dart';

class SellerCompletedOrdersTab extends StatelessWidget {
  // REMOVED 'const' from the constructor because it contains a non-const field (dummyCompletedOrders)
  SellerCompletedOrdersTab({super.key}); // <--- NO 'const' HERE NOW

  // IMPORTANT: No 'const' keyword here for the list itself, nor for individual SellerOrder instances
  final List<SellerOrder> dummyCompletedOrders = [
    SellerOrder( // NO 'const' here
      id: '12345',
      buyerName: 'Rohan Sharma',
      quantity: '100 tons',
      price: '\$50,000',
      productName: 'Steel Rods',
      status: 'Delivered',
      deliveryDate: DateTime(2024, 7, 15),
    ),
    SellerOrder( // NO 'const' here
      id: '67890',
      buyerName: 'Neha Verma',
      quantity: '50 tons',
      price: '\$25,000',
      productName: 'Steel Sheets',
      status: 'Delivered',
      deliveryDate: DateTime(2024, 7, 20),
    ),
    SellerOrder( // NO 'const' here
      id: '11223',
      buyerName: 'Arjun Patel',
      quantity: '75 tons',
      price: '\$37,500',
      productName: 'Steel Beams',
      status: 'Delivered',
      deliveryDate: DateTime(2024, 7, 25),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: dummyCompletedOrders.length,
      itemBuilder: (context, index) {
        final order = dummyCompletedOrders[index];
        return SellerOrderItemCard(
          order: order,
        );
      },
    );
  }
}