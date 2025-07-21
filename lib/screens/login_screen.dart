// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/screens/role_selection_screen.dart'; // To navigate after login

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a login API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color is handled by ThemeData in main.dart
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo/Title
              Text(
                'Steel Suvidha',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor, // Use theme primary color
                ),
              ).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideY(begin: -0.1, end: 0),
              const SizedBox(height: 50),

              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface, // Use theme surface color (white)
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200, width: 1), // Light border
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Lighter shadow
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Login to your account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface, // Use theme onSurface color (black)
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 400.ms).slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 30),

                      // Email/Username Input (now uses ThemeData's InputDecorationTheme)
                      TextFormField(
                        controller: _emailController,
                        decoration: _inputDecoration('Email / Username', Icons.person_outline),
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface), // Use theme onSurface color
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email or username';
                          }
                          return null;
                        },
                      ).animate().fadeIn(duration: 800.ms, delay: 600.ms).slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 20),

                      // Password Input (now uses ThemeData's InputDecorationTheme)
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: _inputDecoration(
                          'Password',
                          Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), // Adjust icon color
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface), // Use theme onSurface color
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ).animate().fadeIn(duration: 800.ms, delay: 800.ms).slideY(begin: 0.1, end: 0),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Navigate to Forgot Password Screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Forgot Password? functionality coming soon!')),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Theme.of(context).primaryColor), // Use theme primary color
                          ),
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 1000.ms),
                      const SizedBox(height: 30),

                      // Login Button (uses ThemeData's ElevatedButtonTheme)
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          child: _isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Text color handled by theme
                                ),
                        ),
                      ).animate().fadeIn(duration: 800.ms, delay: 1200.ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1.0, 1.0)),
                      const SizedBox(height: 20),

                      // Sign Up Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to Sign Up Screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sign Up functionality coming soon!')),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(duration: 800.ms, delay: 1400.ms),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input decoration is now largely handled by ThemeData, but custom suffixIcon still needs it
  InputDecoration _inputDecoration(String labelText, IconData icon, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      // All other decoration properties are pulled from ThemeData's InputDecorationTheme
    );
  }
}