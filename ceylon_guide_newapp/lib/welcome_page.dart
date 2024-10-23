import 'package:flutter/material.dart';
import 'signin.dart';  // Import the Sign In page
import 'signup.dart';  // Import the Sign Up page

// WelcomePage is a stateless widget that serves as the landing page of the app.
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions for responsive UI
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      // Stack widget allows layering widgets on top of each other
      body: Stack(
        children: [
          // Background image covering the entire screen
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/background_image.jpeg'), // Background image
                fit: BoxFit.cover, // Ensures image covers the entire screen
              ),
            ),
          ),
          // SafeArea ensures content does not overlap with system UI (like status bar)
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                children: [
                  // Welcome text with large font size
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.17), // Top margin to push down the text
                    child: Text(
                      'WELCOME',
                      style: TextStyle(
                        fontSize: screenHeight * 0.1, // Font size responsive to screen height
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color for visibility over the background
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.003), // Spacing between text elements

                  // App name
                  Text(
                    'CEYLON GUIDE',
                    style: TextStyle(
                      fontSize: screenHeight * 0.055, // Responsive font size
                      color: Colors.white, // White color
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.001), // Small space between text

                  // Subtitle with a descriptive message
                  Text(
                    'Discover Ceylon’s beauty...',
                    style: TextStyle(
                      color: Colors.white, // White color for visibility
                      fontSize: screenHeight * 0.025, // Responsive font size for the subtitle
                    ),
                  ),
                  Spacer(), // Pushes content to the bottom

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Sign In page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInPage()), // Route to SignInPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.15, // Responsive horizontal padding
                        vertical: screenHeight * 0.02,  // Responsive vertical padding
                      ),
                      backgroundColor: Colors.teal, // Teal color for the Sign In button
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: screenHeight * 0.030, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color for contrast
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Space between Sign In and Sign Up buttons

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Sign Up page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()), // Route to SignUpPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.15, // Responsive horizontal padding
                        vertical: screenHeight * 0.02,  // Responsive vertical padding
                      ),
                      backgroundColor: Colors.orange, // Orange color for the Sign Up button
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: screenHeight * 0.030, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text color for contrast
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1), // Bottom spacing to give room before the end of the screen
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
