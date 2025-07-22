// lib/main.dart
import 'package:flutter/material.dart';
import 'package:figma_app/screens/role_selection_screen.dart'; // Import your new RoleSelectionScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steel Suvidha',
      theme: ThemeData(
        primaryColor: const Color(0xFF673AB7), // Your primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFFC107), // Your accent color
          onBackground: Colors.black, // Default text color on background
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF673AB7), // Consistent button color
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
        useMaterial3: true,
      ),
      home: const RoleSelectionScreen(), // Set RoleSelectionScreen as the starting point
      debugShowCheckedModeBanner: false,
    );
  }
}