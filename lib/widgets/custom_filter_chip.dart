// lib/widgets/custom_filter_chip.dart
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final Color? selectedBackgroundColor; // Marked as nullable
  final Color selectedLabelColor;
  final Color? inactiveBackgroundColor; // Marked as nullable
  final Color inactiveLabelColor;
  final bool multiSelect;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.selectedBackgroundColor, // Now correctly nullable
    this.selectedLabelColor = Colors.white,
    this.inactiveBackgroundColor, // Now correctly nullable
    this.inactiveLabelColor = Colors.black87,
    this.multiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: selectedBackgroundColor ?? Theme.of(context).primaryColor, // Use theme primary blue
      backgroundColor: inactiveBackgroundColor ?? Colors.grey.shade200, // Light grey for inactive
      labelStyle: TextStyle(
        color: isSelected ? selectedLabelColor : inactiveLabelColor,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey.shade300), // Light border when inactive
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      checkmarkColor: Colors.white, // White checkmark on selected blue chip
    );
  }
}