import 'package:flutter/material.dart';
import 'signup.dart'; // Import the SignUpPage for navigation
import 'forgotpassword.dart'; // Import the ForgotPasswordPage for navigation
import 'travelerdashboard.dart'; // Import the Traveler Dashboard widget

// SignInPage is a stateless widget representing the Sign In screen of the app.
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions for responsive UI
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return Scaffold(
      // AppBar with a teal background and centered title
      appBar: AppBar(
        backgroundColor: Colors.teal, // Teal color for the AppBar background
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white, // White text for better visibility
            fontSize: screenHeight * 0.06, // Responsive font size for the title
            fontWeight: FontWeight.bold, // Bold font weight for emphasis
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),
      backgroundColor: Colors.white, // White background for the screen
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1), // Responsive horizontal padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              // Username input field
              TextField(
                keyboardType: TextInputType.text, // Standard text input for username
                decoration: InputDecoration(
                  labelText: 'Username', // Label for the username field
                  border: OutlineInputBorder(), // Outline border around the input field
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between the username and password fields

              // Password input field
              TextField(
                obscureText: true, // Hides the password text for security
                keyboardType: TextInputType.text, // Standard text input for password
                decoration: InputDecoration(
                  labelText: 'Password', // Label for the password field
                  border: OutlineInputBorder(), // Outline border for the input field
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Space before the Sign In button

              // Sign In button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Traveler Dashboard when Sign In is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TravelerDashboard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2, // Responsive horizontal padding
                    vertical: screenHeight * 0.02, // Responsive vertical padding
                  ),
                  backgroundColor: Colors.teal, // Teal color for the button
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03, // Responsive font size for the button text
                    fontWeight: FontWeight.bold, // Bold text for emphasis
                    color: Colors.white, // White text color for contrast against teal background
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between the button and links

              // Forgot Password link
              GestureDetector(
                onTap: () {
                  // Navigate to the Forgot Password Page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordPage()), // Route to ForgotPasswordPage
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue, // Blue color for the link
                    decoration: TextDecoration.underline, // Underline for a visual cue of a clickable link
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Space between the two links

              // Create Now link
              GestureDetector(
                onTap: () {
                  // Navigate to the Sign Up Page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()), // Route to SignUpPage
                  );
                },
                child: const Text(
                  'Create Now',
                  style: TextStyle(
                    color: Colors.blue, // Blue color for the link
                    decoration: TextDecoration.underline, // Underline to indicate it's a clickable link
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05), // Space before the image

              // Display image below the links
              Image.asset(
                'lib/assets/images/signinpagevector.jpeg', // Path to the image asset
                height: screenHeight * 0.25, // Responsive height for the image
              ),
            ],
          ),
        ),
      ),
    );
  }
}
