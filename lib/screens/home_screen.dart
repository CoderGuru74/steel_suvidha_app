import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG assets

// Assuming you have these custom widgets defined as per your file structure
import '../widgets/custom_app_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/info_card.dart';
import '../widgets/step_tile.dart';
import '../widgets/bottom_navigation.dart'; // Corrected import for CustomBottomNavigation

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Default AppBar height
        child: const CustomAppBar(), // Using the CustomAppBar widget
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Hero Section ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: const AssetImage("assets/images/banner.jpg"), // CONFIRMED PATH & FILENAME
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Find the Metals You Need, Fast.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.033 * 36,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Get instant quotes from verified suppliers.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Handle "Start Your Quote" button tap
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB8CEE4),
                        foregroundColor: const Color(0xFF131416),
                        minimumSize: const Size(0, 48),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.015 * 16,
                          height: 1.5,
                        ),
                      ),
                      child: const Text('Start Your Quote'),
                    ),
                  ],
                ),
              ),
            ),
            // --- Featured Categories Section ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 12.0),
              child: const Text(
                'Featured Categories',
                style: TextStyle(
                  color: Color(0xFF131416),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 22,
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const [
                  CategoryCard(
                    imagePath: 'assets/images/steel.png', // <--- Updated to local PNG
                    title: 'Steel',
                  ),
                  SizedBox(width: 12),
                  CategoryCard(
                    imagePath: 'assets/images/aluminum.png', // <--- Updated to local PNG
                    title: 'Aluminum',
                  ),
                  SizedBox(width: 12),
                  CategoryCard(
                    imagePath: 'assets/images/copper.png', // <--- Updated to local PNG
                    title: 'Copper',
                  ),
                  // SizedBox(width: 12), // Brass section removed, so no need for this gap
                  // CategoryCard( // Brass card removed
                  //   imagePath: 'assets/images/brass.png',
                  //   title: 'Brass',
                  // ),
                  // Add more CategoryCard widgets as needed based on your Figma design
                ],
              ),
            ),
            // --- How It Works Section ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 12.0),
              child: const Text(
                'How It Works',
                style: TextStyle(
                  color: Color(0xFF131416),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 22,
                  height: 1.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: const [
                  StepTile(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M227.32,28.68a16,16,0,0,0-15.66-4.08l-.15,0L19.57,82.84a16,16,0,0,0-2.42,29.84l85.62,40.55,40.55,85.62A15.86,15.86,0,0,0,157.74,248q.69,0,1.38-.06a15.88,15.88,0,0,0,14-11.51l58.2-191.94c0-.05,0-.1,0-.15A16,16,0,0,0,227.32,28.68ZM157.83,231.85l-.05.14L118.42,148.9l47.24-47.25a8,8,0,0,0-11.31-11.31L107.1,137.58,24,98.22l.14,0L216,40Z"></path></svg>',
                    title: 'Submit Request',
                    isLast: false,
                  ),
                  StepTile(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M100,56H40A16,16,0,0,0,24,72v64a16,16,0,0,0,16,16h60v8a32,32,0,0,1-32,32,8,8,0,0,0,0,16,48.05,48.05,0,0,0,48-48V72A16,16,0,0,0,100,56Zm0,80H40V72h60ZM216,56H156a16,16,0,0,0-16,16v64a16,16,0,0,0,16,16h60v8a32,32,0,0,1-32,32,8,8,0,0,0,0,16,48.05,48.05,0,0,0,48-48V72A16,16,0,0,0,216,56Zm0,80H156V72h60Z"></path></svg>',
                    title: 'Get Quotes',
                    isLast: false,
                  ),
                  StepTile(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M229.66,77.66l-128,128a8,8,0,0,1-11.32,0l-56-56a8,8,0,0,1,11.32-11.32L96,188.69,218.34,66.34a8,8,0,0,1,11.32,11.32Z"></path></svg>',
                    title: 'Choose & Order',
                    isLast: false,
                  ),
                  StepTile(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M247.42,117l-14-35A15.93,15.93,0,0,0,218.58,72H184V64a8,8,0,0,0-8-8H24A16,16,0,0,0,8,72V184a16,16,0,0,0,16,16H41a32,32,0,0,0,62,0h50a32,32,0,0,0,62,0h17a16,16,0,0,0,16-16V120A7.94,7.94,0,0,0,247.42,117ZM184,88h34.58l9.6,24H184ZM24,72H168v64H24ZM72,208a16,16,0,1,1,16-16A16,16,0,0,1,72,208Zm81-24H103a32,32,0,0,0-62,0H24V152H168v12.31A32.11,32.11,0,0,0,153,184Zm31,24a16,16,0,1,1,16-16A16,16,0,0,1,184,208Zm48-24H215a32.06,32.06,0,0,0-31-24V128h48Z"></path></svg>',
                    title: 'Receive Delivery',
                    isLast: true,
                  ),
                ],
              ),
            ),
            // --- Why Choose Us Section ---
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 12.0),
              child: const Text(
                'Why Choose Us',
                style: TextStyle(
                  color: Color(0xFF131416),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.015 * 22,
                  height: 1.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                childAspectRatio: 2.5,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: const [
                  InfoCard(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M208,40H48A16,16,0,0,0,32,56v58.78c0,89.61,75.82,119.34,91,124.39a15.53,15.53,0,0,0,10,0c15.2-5.05,91-34.78,91-124.39V56A16,16,0,0,0,208,40Zm0,74.79c0,78.42-66.35,104.62-80,109.18-13.53-4.51-80-30.69-80-109.18V56H208ZM82.34,141.66a8,8,0,0,1,11.32-11.32L112,148.68l50.34-50.34a8,8,0,0,1,11.32,11.32l-56,56a8,8,0,0,1-11.32,0Z"></path></svg>',
                    title: 'Verified Suppliers',
                  ),
                  InfoCard(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Zm0,192a88,88,0,1,1,88-88A88.1,88.1,0,0,1,128,216Zm64-88a8,8,0,0,1-8,8H128a8,8,0,0,1-8-8V72a8,8,0,0,1,16,0v48h48A8,8,0,0,1,192,128Z"></path></svg>',
                    title: 'Fast Quote Turnaround',
                  ),
                  InfoCard(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M152,120H136V56h8a32,32,0,0,1,32,32,8,8,0,0,0,16,0,48.05,48.05,0,0,0-48-48h-8V24a8,8,0,0,0-16,0V40h-8a48,48,0,0,0,0,96h8v64H104a32,32,0,0,1-32-32,8,8,0,0,0-16,0,48.05,48.05,0,0,0,48,48h16v16a8,8,0,0,0,16,0V216h16a48,48,0,0,0,0-96Zm-40,0a32,32,0,0,1,0-64h8v64Zm40,80H136V136h16a32,32,0,0,1,0,64Z"></path></svg>',
                    title: 'Competitive Pricing',
                  ),
                  InfoCard(
                    iconSvgPath: '<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor" viewBox="0 0 256 256"><path d="M247.42,117l-14-35A15.93,15.93,0,0,0,218.58,72H184V64a8,8,0,0,0-8-8H24A16,16,0,0,0,8,72V184a16,16,0,0,0,16,16H41a32,32,0,0,0,62,0h50a32,32,0,0,0,62,0h17a16,16,0,0,0,16-16V120A7.94,7.94,0,0,0,247.42,117ZM184,88h34.58l9.6,24H184ZM24,72H168v64H24ZM72,208a16,16,0,1,1,16-16A16,16,0,0,1,72,208Zm81-24H103a32,32,0,0,0-62,0H24V152H168v12.31A32.11,32.11,0,0,0,153,184Zm31,24a16,16,0,1,1,16-16A16,16,0,0,1,184,208Zm48-24H215a32.06,32.06,0,0,0-31-24V128h48Z"></path></svg>',
                    title: 'Reliable Delivery',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle "Request a Quote Now" button tap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB8CEE4),
                foregroundColor: const Color(0xFF131416),
                minimumSize: const Size.fromHeight(48),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.015 * 16,
                  height: 1.5,
                ),
              ),
              child: const Text('Request a Quote Now'),
            ),
          ),
          const CustomBottomNavigation(), // Corrected widget name and made const
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}