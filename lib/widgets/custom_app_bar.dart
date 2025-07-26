import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showShoppingCart;
  final Widget? leadingWidget;
  final List<Widget>? actions;
  final List<String>? breadcrumbs;
  final VoidCallback? onShoppingCartPressed; // NEW: Added onShoppingCartPressed callback

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showShoppingCart = true,
    this.leadingWidget,
    this.actions,
    this.breadcrumbs,
    this.onShoppingCartPressed, // NEW: Include in constructor
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // For default AppBar height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          if (breadcrumbs != null && breadcrumbs!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                breadcrumbs!.join(' > '),
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: showBackButton,
      leading: leadingWidget ?? (showBackButton ? null : null),
      actions: [
        ...?actions,
        if (showShoppingCart)
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: onShoppingCartPressed ?? () { // Use provided callback, or default to a SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Shopping Cart Pressed (No specific action defined)')),
              );
            },
          ),
      ],
    );
  }
}