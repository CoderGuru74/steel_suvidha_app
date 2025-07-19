import 'package:flutter/material.dart';
import 'package:figma_app/screens/home_screen.dart'; // Correct import for your HomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steel Suvidha App', // Your app's title
      debugShowCheckedModeBanner: false, // Set to false to remove the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize your theme further
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(), // Set HomeScreen as the initial screen
    );
  }
}