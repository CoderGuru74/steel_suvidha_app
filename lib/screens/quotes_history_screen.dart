// lib/screens/quotes_history_screen.dart
import 'package:flutter/material.dart';

class QuotesHistoryScreen extends StatelessWidget {
  const QuotesHistoryScreen({super.key});

  // Dummy data for quotes history
  final List<Map<String, String>> _quotes = const [
    {
      'id': 'Q-001',
      'product': 'Carbon Steel Plates',
      'quantity': '10 tons',
      'status': 'Pending',
      'date': '2024-07-20',
    },
    {
      'id': 'Q-002',
      'product': 'Aluminum Angles',
      'quantity': '500 units',
      'status': 'Quoted',
      'date': '2024-07-18',
    },
    {
      'id': 'Q-003',
      'product': 'Copper Rods',
      'quantity': '2 tons',
      'status': 'Rejected',
      'date': '2024-07-15',
    },
    {
      'id': 'Q-004',
      'product': 'Stainless Steel Pipe',
      'quantity': '150 meters',
      'status': 'Accepted',
      'date': '2024-07-10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Quotes'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // As it's a bottom nav bar destination
      ),
      body: _quotes.isEmpty
          ? const Center(child: Text('No quote requests yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _quotes.length,
              itemBuilder: (context, index) {
                final quote = _quotes[index];
                Color statusColor;
                switch (quote['status']) {
                  case 'Pending':
                    statusColor = Colors.orange;
                    break;
                  case 'Quoted':
                    statusColor = Colors.blue;
                    break;
                  case 'Accepted':
                    statusColor = Colors.green;
                    break;
                  case 'Rejected':
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
                        Text(
                          'Quote ID: ${quote['id']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Product: ${quote['product']}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Quantity: ${quote['quantity']}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Date: ${quote['date']}',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              quote['status']!,
                              style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // You can add an "View Details" button here to navigate to a specific quote detail screen
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}