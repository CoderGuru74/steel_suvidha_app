// lib/screens/order_history_screen.dart
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  // Dummy data for order history
  final List<Map<String, String>> _orders = const [
    {
      'id': 'ORD-001',
      'product': 'Carbon Steel Plates (10mm)',
      'quantity': '5 tons',
      'status': 'Delivered',
      'date': '2024-07-15',
      'total': '₹2,50,000',
    },
    {
      'id': 'ORD-002',
      'product': 'TMT Rebars (12mm)',
      'quantity': '200 pieces',
      'status': 'Shipped',
      'date': '2024-07-20',
      'total': '₹1,20,000',
    },
    {
      'id': 'ORD-003',
      'product': 'Stainless Steel Angles (50x50mm)',
      'quantity': '50 meters',
      'status': 'Processing',
      'date': '2024-07-22',
      'total': '₹75,000',
    },
    {
      'id': 'ORD-004',
      'product': 'Aluminum Sheets (2mm)',
      'quantity': '2 tons',
      'status': 'Cancelled',
      'date': '2024-07-10',
      'total': '₹1,80,000',
    },
    {
      'id': 'ORD-005',
      'product': 'GI Pipes (4 inch)',
      'quantity': '100 pieces',
      'status': 'Delivered',
      'date': '2024-07-05',
      'total': '₹90,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // As it's a bottom nav bar destination
      ),
      body: _orders.isEmpty
          ? const Center(child: Text('No orders placed yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                Color statusColor;
                switch (order['status']) {
                  case 'Delivered':
                    statusColor = Colors.green;
                    break;
                  case 'Shipped':
                    statusColor = Colors.blue;
                    break;
                  case 'Processing':
                    statusColor = Colors.orange;
                    break;
                  case 'Cancelled':
                    statusColor = Colors.red;
                    break;
                  default:
                    statusColor = Colors.grey;
                }

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
                            Text(
                              'Order ID: ${order['id']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                order['status']!,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Product: ${order['product']}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Quantity: ${order['quantity']}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Date: ${order['date']}',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Total: ${order['total']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        // You can add an "View Details" button here to navigate to a specific order detail screen
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Viewing details for ${order['id']}')),
                              );
                              // TODO: Navigate to OrderDetailsScreen(orderId: order['id'])
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(color: Theme.of(context).primaryColor),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('View Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}