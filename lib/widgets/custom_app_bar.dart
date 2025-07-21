// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showShoppingCart;
  final VoidCallback? onBackButtonPressed;
  final VoidCallback? onShoppingCartPressed;
  final List<String> breadcrumbs;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showShoppingCart = false,
    this.onBackButtonPressed,
    this.onShoppingCartPressed,
    this.breadcrumbs = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Colors are handled by AppBarTheme in main.dart
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back), // Icon color from theme
              onPressed: onBackButtonPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle, // Title style from theme
          ),
          if (breadcrumbs.isNotEmpty)
            Text(
              breadcrumbs.join(' > '),
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).appBarTheme.foregroundColor?.withOpacity(0.7), // Adjusted breadcrumb color
              ),
            ),
        ],
      ),
      actions: [
        if (showShoppingCart)
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined), // Icon color from theme
            onPressed: onShoppingCartPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20); // Slightly taller for breadcrumbs
}