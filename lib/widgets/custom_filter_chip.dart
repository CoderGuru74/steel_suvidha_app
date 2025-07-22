// lib/widgets/custom_filter_chip.dart
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final Color? selectedBackgroundColor;
  final Color? selectedLabelColor;
  final Color? inactiveBackgroundColor;
  final Color? inactiveLabelColor;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.selectedBackgroundColor,
    this.selectedLabelColor,
    this.inactiveBackgroundColor,
    this.inactiveLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkTheme = theme.brightness == Brightness.dark;

    final Color effectiveSelectedBackgroundColor = selectedBackgroundColor ?? theme.primaryColor;
    final Color effectiveSelectedLabelColor = selectedLabelColor ?? Colors.white;
    final Color effectiveInactiveBackgroundColor = inactiveBackgroundColor ?? (isDarkTheme ? Colors.grey.shade700 : Colors.grey.shade200);
    final Color effectiveInactiveLabelColor = inactiveLabelColor ?? (isDarkTheme ? Colors.white70 : Colors.black87);

    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? effectiveSelectedLabelColor : effectiveInactiveLabelColor,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: effectiveInactiveBackgroundColor,
      selectedColor: effectiveSelectedBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // More rounded corners for the chip
        side: BorderSide(
          color: isSelected ? effectiveSelectedBackgroundColor : effectiveInactiveBackgroundColor,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding for chip content
      showCheckmark: false, // Don't show the default checkmark
      labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    );
  }
}