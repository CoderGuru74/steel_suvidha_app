// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:figma_app/screens/home_screen.dart'; // Ensure HomeScreen is imported

class LoginScreen extends StatefulWidget {
  final String? selectedRole; // <--- THIS LINE IS CRUCIAL

  const LoginScreen({super.key, this.selectedRole}); // <--- THIS CONSTRUCTOR IS CRUCIAL

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Basic login logic (replace with your actual authentication)
    if (_usernameController.text == 'user' && _passwordController.text == 'password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(), // Navigating to HomeScreen without role
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with Steel Texture and Shimmer Animation
          Positioned.fill(
            child: Animate(
              effects: const [
                ShimmerEffect(
                  duration: Duration(seconds: 5), // Duration of one shimmer cycle
                  delay: Duration(seconds: 2),    // Delay before first shimmer
                  color: Colors.white38,          // Color of the shimmer
                  blendMode: BlendMode.srcOver,   // How the shimmer blends
                ),
              ],
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),

          // Dark overlay for better readability of text
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
            ),
          ),

          // Login Form Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display selected role if available (this part is okay, it's just a display)
                  if (widget.selectedRole != null) ...[ // Uses the selectedRole from the constructor
                    Text(
                      'Logging in as: ${widget.selectedRole!.toUpperCase()}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Company Logo (Optional)
                  Image.asset(
                    'assets/images/logo.png', // Replace with your actual logo path
                    height: 120,
                    width: 120,
                  ).animate().fade(duration: 1000.ms).slideY(begin: -0.2),

                  const SizedBox(height: 30),

                  Text(
                    'Welcome to Steel Suvidha',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ).animate().fade(duration: 1000.ms, delay: 200.ms).slideY(begin: -0.1),

                  const SizedBox(height: 40),

                  // Username Field
                  _buildTextField(
                    controller: _usernameController,
                    hintText: 'Username',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: _obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ).animate().fade(duration: 1000.ms, delay: 400.ms).slideY(begin: 0.1),

                  const SizedBox(height: 20),

                  // Forgot Password / Sign Up (Optional)
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Forgot Password?')),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
    );
  }
}