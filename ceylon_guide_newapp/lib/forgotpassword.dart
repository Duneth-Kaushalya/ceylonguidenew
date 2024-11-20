import 'package:flutter/material.dart';
import 'signin.dart'; // Import the SignInPage for navigation

// ForgotPasswordPage is a stateless widget representing the Forgot Password screen of the app.
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive UI
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    // Define adjustable space between the link and the image
    double linkToImageSpacing = screenHeight * 0.06; // Space between the link and image
    double imageToBottomGap = screenHeight * 0.05; // Gap below the image
    double additionalImageSpace = screenHeight * 0.05; // Additional space above the image to move it lower

    return Scaffold(
      // AppBar with a gradient background
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.orange.shade400, // Starting color of the gradient
                Colors.teal.shade400,   // Ending color of the gradient
              ],
            ),
          ),
        ),
        title: Text(
          'Forgot Password', // Title of the AppBar
          style: TextStyle(
            color: Colors.white, // White text color for visibility
            fontSize: screenHeight * 0.06, // Responsive title font size
            fontWeight: FontWeight.bold, // Bold font for emphasis
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),
      backgroundColor: Colors.white, // Smooth white background color
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1), // Responsive horizontal padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              // Email input field
              TextField(
                keyboardType: TextInputType.emailAddress, // Email input type
                decoration: InputDecoration(
                  labelText: 'Email', // Label for the input field
                  border: OutlineInputBorder(), // Outline border for the input
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Space before the Submit button

              // Submit button with gradient background
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.orange.shade400, // Starting color of the gradient for button
                      Colors.teal.shade400,   // Ending color of the gradient for button
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the button
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Define the behavior for submitting the email (to be implemented)
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2, // Responsive horizontal padding
                      vertical: screenHeight * 0.02, // Responsive vertical padding
                    ),
                    backgroundColor: Colors.transparent, // Make the button background transparent
                    elevation: 0, // Remove shadow for a flat look
                  ),
                  child: Text(
                    'Submit', // Text displayed on the button
                    style: TextStyle(
                      fontSize: screenHeight * 0.03, // Responsive font size for button text
                      fontWeight: FontWeight.bold, // Bold font for emphasis
                      color: Colors.white, // White text color for contrast
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between button and the link

              // Link to navigate back to Sign In page
              GestureDetector(
                onTap: () {
                  // Navigate to the Sign In Page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()), // Route to SignInPage
                  );
                },
                child: const Text(
                  'Got username, password? Sign In', // Text for the login link
                  style: TextStyle(
                    color: Colors.blue, // Blue color for the link
                    decoration: TextDecoration.underline, // Underlined text for clickable appearance
                  ),
                ),
              ),
              SizedBox(height: linkToImageSpacing), // Space before the image

              // Add additional space above the image to move it lower
              SizedBox(height: additionalImageSpace), // Additional space to move the image lower

              // Image below the link
              Image.asset(
                'lib/assets/images/forgotpasswordvector.jpeg', // Path to the image asset
                height: screenHeight * 0.25, // Responsive height for the image
              ),
              SizedBox(height: imageToBottomGap), // Gap below the image
            ],
          ),
        ),
      ),
    );
  }
}