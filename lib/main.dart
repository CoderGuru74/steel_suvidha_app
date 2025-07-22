// lib/main.dart
import 'package:flutter/material.dart';
import 'package:figma_app/screens/login_screen.dart'; // Import the LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('DEBUG: MyApp (MaterialApp) build method called!'); // THIS LINE IS ADDED/CONFIRMED
    return MaterialApp(
      title: 'Steel Suvidha App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Core colors for white and blue theme
        primaryColor: const Color(0xFF1976D2), // Darker blue for primary elements
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Generates various shades of blue
          accentColor: const Color(0xFF42A5F5), // Lighter blue for accents
          backgroundColor: Colors.white, // Main background color
          // For text on primary color (e.g., button text)
          // For text on accent color
          // For text on surface color (like cards)
          // For text on background color
        ).copyWith(
          secondary: const Color(0xFF42A5F5), // Explicitly define secondary/accent
          surface: Colors.white, // Default color for Material surfaces (cards, sheets)
          onSurface: Colors.black, // Color of content on surface
          background: Colors.white, // For scaffold background
          onBackground: Colors.black, // Color of content on background
        ),

        scaffoldBackgroundColor: Colors.white, // Main background for most screens

        appBarTheme: const AppBarTheme(
          color: Colors.white, // White app bar background
          foregroundColor: Colors.black, // Black text/icons on app bar
          elevation: 1.0, // Subtle shadow for distinction
          iconTheme: IconThemeData(color: Colors.black), // Black icons
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),

        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black, // Default text color for body
          displayColor: Colors.black, // Default text color for display elements
        ),

        // Input field theme for consistency
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade100, // Light grey fill for input fields
          labelStyle: const TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2), // Blue border on focus
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
        ),

        // ElevatedButton theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1976D2), // Primary blue for buttons
            foregroundColor: Colors.white, // White text on buttons
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        // TextButton theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF1976D2), // Blue text for text buttons
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}