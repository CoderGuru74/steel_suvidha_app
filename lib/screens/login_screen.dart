// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:steel_suvidha/screens/buyer_main_screen.dart';
import 'package:steel_suvidha/screens/seller_home_screen.dart';
import 'package:steel_suvidha/screens/registration_screen.dart';
import 'package:steel_suvidha/screens/admin_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;
  bool _isPasswordVisible = false; // New state for password visibility

  // Animation controllers
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Starts slightly below
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _animationController.dispose(); // Dispose animation controller
    super.dispose();
  }

  void _login() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }

    if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a role')),
      );
      return;
    }

    bool isAuthenticated = false;
    if (_selectedRole == 'Buyer' && username == 'buyer' && password == 'buyer123') {
      isAuthenticated = true;
    } else if (_selectedRole == 'Seller' && username == 'seller' && password == 'seller123') {
      isAuthenticated = true;
    } else if (_selectedRole == 'Admin' && username == 'admin' && password == 'admin123') {
      isAuthenticated = true;
    }

    if (isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged in as $_selectedRole')),
      );

      if (_selectedRole == 'Buyer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BuyerMainScreen()),
        );
      } else if (_selectedRole == 'Seller') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SellerHomeScreen()),
        );
      } else if (_selectedRole == 'Admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials or role')),
      );
    }
  }

  void _navigateToRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed AppBar for a full-screen, immersive look
      body: Container(
        // Gradient background for the whole screen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.9),
              Theme.of(context).primaryColor.withOpacity(0.7),
              Colors.blueAccent.shade100,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo or App Icon
                    Hero(
                      tag: 'loginIcon', // Add a Hero tag for transition animation
                      child: Icon(
                        Icons.account_circle,
                        size: 120, // Slightly larger icon
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32, // Larger title
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Username Field
                    _buildTextField(
                      controller: _usernameController,
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      icon: Icons.person,
                      context: context,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    _buildTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: Icons.lock,
                      obscureText: !_isPasswordVisible,
                      context: context,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Role Selection (Dropdown)
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white, // Background of the dropdown menu
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: _buildInputDecoration( // Corrected call
                          labelText: 'Select Role',
                          icon: Icons.business_center,
                          context: context,
                          // NO hintText parameter here for DropdownButtonFormField
                        ),
                        hint: const Text(
                          'Choose your role',
                          style: TextStyle(color: Colors.white70),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        },
                        items: <String>['Buyer', 'Seller', 'Admin'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.white), // Text color of the selected item
                        dropdownColor: Colors.white, // Color of the dropdown menu itself
                        iconEnabledColor: Colors.white, // Color of the dropdown arrow
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 55, // Slightly taller button
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white70], // White gradient for button
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15), // More rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: _login,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor, // Text color matches app primary color
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Register Link
                    TextButton(
                      onPressed: _navigateToRegistration,
                      child: Text.rich(
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: Colors.white.withOpacity(0.8)),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline, // Add underline
                                decorationColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build input fields with consistent styling
  // NOTE: hintText is now nullable (String? hintText)
  InputDecoration _buildInputDecoration({
    required String labelText,
    String? hintText, // <--- Made nullable here!
    required IconData icon,
    required BuildContext context,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText, // Now nullable, so it's okay if not provided
      labelStyle: const TextStyle(color: Colors.white70), // Light label text
      hintStyle: const TextStyle(color: Colors.white54), // Lighter hint text
      prefixIcon: Icon(icon, color: Colors.white), // White icons
      suffixIcon: suffixIcon,
      fillColor: Colors.white.withOpacity(0.2), // Slightly transparent white fill
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15), // More rounded
        borderSide: BorderSide.none, // No border needed with fill color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.4), width: 1), // Subtle white border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2), // Stronger white border on focus
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    );
  }

  // Helper method for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText, // still required here as TextField always needs it
    required IconData icon,
    required BuildContext context,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white), // Input text color
      decoration: _buildInputDecoration(
        labelText: labelText,
        hintText: hintText, // This will always be provided by _buildTextField
        icon: icon,
        context: context,
        suffixIcon: suffixIcon,
      ),
    );
  }
}