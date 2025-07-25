import 'package:flutter/material.dart';

// Define the SellerOrder model. If you have it in a separate models/seller_order.dart,
// please ensure that file also has this constructor without 'const'.
class SellerOrder {
  final String id;
  final String buyerName;
  final String quantity;
  final String price;
  final String productName;
  final String status;
  final DateTime? deliveryDate;

  // IMPORTANT: Ensure 'const' IS NOT HERE for this constructor
  SellerOrder({ // <--- Verify 'const' is ABSENT here
    required this.id,
    required this.buyerName,
    required this.quantity,
    required this.price,
    required this.productName,
    required this.status,
    this.deliveryDate,
  });
}

class SellerOrderItemCard extends StatelessWidget {
  final SellerOrder order;
  final Widget? actionWidget;
  final Widget? additionalInfoWidget;

  // This widget's constructor can remain const if all its properties are const or final and immutable.
  const SellerOrderItemCard({
    super.key,
    required this.order,
    this.actionWidget,
    this.additionalInfoWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
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
                  'Order ID: #${order.id}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (order.status == 'Accepted' || order.status == 'Delivered')
                  Text(
                    order.status,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: order.status == 'Delivered' ? Colors.green.shade700 : Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Buyer: ${order.buyerName}, Quantity: ${order.quantity}, Price: ${order.price}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            Text(
              'Product: ${order.productName}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            if (order.deliveryDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Delivery: ${order.deliveryDate!.toLocal().toString().split(' ')[0]}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            if (additionalInfoWidget != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: additionalInfoWidget!,
              ),
            if (actionWidget != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: actionWidget!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}