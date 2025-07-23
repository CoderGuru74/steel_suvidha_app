// lib/main.dart
import 'package:flutter/material.dart';
import 'package:figma_app/screens/login_screen.dart'; // Import LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steel Suvidha App',
      theme: ThemeData(
        // Define your color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0056D4), // Primary color from your Figma/design
          primary: const Color(0xFF0056D4), // Explicitly set primary
          onPrimary: Colors.white, // Text/icons on primary color
          secondary: const Color(0xFF007BFF), // A slightly different blue for secondary actions/accents
          onSecondary: Colors.white,
          surface: Colors.white, // Default card/dialog background
          onSurface: Colors.black87, // Text/icons on surface
          background: const Color(0xFFF0F2F5), // Light background for the overall app
          onBackground: Colors.black87, // Text/icons on background
          error: Colors.red.shade700,
          onError: Colors.white,
        ),
        useMaterial3: true,
        // AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0056D4), // Consistent with primary color
          foregroundColor: Colors.white, // White icons and text
          elevation: 4, // Add a subtle shadow
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Button Themes
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          buttonColor: const Color(0xFF0056D4),
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0056D4), // Primary color for elevated buttons
            foregroundColor: Colors.white, // Text color on elevated buttons
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners for buttons
            ),
            elevation: 3, // Subtle shadow
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF0056D4), // Primary color for text buttons
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF0056D4), // Primary color for outlined buttons text
            side: const BorderSide(color: Color(0xFF0056D4)), // Primary color for outlined buttons border
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        // Input Decoration Theme (for TextFields)
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // White background for input fields
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none, // No border by default
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Light grey border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Color(0xFF0056D4), width: 2.0), // Primary color border when focused
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red.shade700, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.red.shade700, width: 2.0),
          ),
          hintStyle: TextStyle(color: Colors.grey.shade500),
          labelStyle: TextStyle(color: Colors.grey.shade700),
        ),
        // Card Theme
        cardTheme: CardThemeData( // --- CHANGED TO CardThemeData EXPLICITLY ---
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          color: Colors.white,
        ),
        // Scaffold Background Color
        scaffoldBackgroundColor: const Color(0xFFF0F2F5), // Light grey background
      ),
      // The initial screen of the app
      home: const LoginScreen(), // Directly start with LoginScreen
    );
  }
}