import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showShoppingCart;
  final List<Widget>? actions;
  final List<String>? breadcrumbs; // Added back for home_screen.dart
  final VoidCallback? onShoppingCartPressed; // Added for shopping cart button press

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showShoppingCart = false,
    this.actions,
    this.breadcrumbs, // Initialized
    this.onShoppingCartPressed, // Initialized
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          if (breadcrumbs != null && breadcrumbs!.isNotEmpty)
            Text(
              breadcrumbs!.join(' > '), // Join breadcrumbs with a separator
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
        ],
      ),
      centerTitle: false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      elevation: Theme.of(context).appBarTheme.elevation,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      actions: [
        if (showShoppingCart)
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: onShoppingCartPressed, // Using the new callback
          ),
        ...?actions, // Spread the new actions list here
      ],
    );
  }
}