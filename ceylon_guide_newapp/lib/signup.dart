import 'package:flutter/material.dart';
import 'signin.dart'; // Import the SignInPage for navigation

// SignUpPage is a stateless widget representing the Sign Up screen of the app.
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive UI
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    // List of user roles for the dropdown menu
    final List<String> userTypes = [
      'Traveler',
      'Taxi Driver',
      'Hotel Manager',
      'Guide Person',
      'Equipment Supplier'
    ];

    // Variable to hold the selected user type (starts as null)
    String? selectedUserType;

    return Scaffold(
      // AppBar with an orange background and centered title
      appBar: AppBar(
        backgroundColor: Colors.orange, // Orange background for AppBar
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: screenHeight * 0.06, // Responsive font size for the title
            fontWeight: FontWeight.bold, // Bold font for emphasis
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),
      backgroundColor: Colors.white, // White background color
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1), // Responsive horizontal padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              // Full Name input field
              TextField(
                keyboardType: TextInputType.text, // Standard text input
                decoration: InputDecoration(
                  labelText: 'Full Name', // Label for the field
                  border: OutlineInputBorder(), // Outline border for the input
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between fields

              // Email input field
              TextField(
                keyboardType: TextInputType.emailAddress, // Email input type
                decoration: InputDecoration(
                  labelText: 'Email', // Label for the field
                  border: OutlineInputBorder(), // Outline border for the input
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between fields

              // Password input field
              TextField(
                obscureText: true, // Hides password input for security
                keyboardType: TextInputType.text, // Standard text input
                decoration: InputDecoration(
                  labelText: 'Password', // Label for the field
                  border: OutlineInputBorder(), // Outline border for the input
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between fields

              // Confirm Password input field
              TextField(
                obscureText: true, // Hides password input
                keyboardType: TextInputType.text, // Standard text input
                decoration: InputDecoration(
                  labelText: 'Confirm Password', // Label for the field
                  border: OutlineInputBorder(), // Outline border for the input
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space between fields

              // Dropdown menu to select user role
              DropdownButtonFormField<String>(
                value: selectedUserType, // Selected user type (null initially)
                decoration: InputDecoration(
                  labelText: 'Who are you?', // Label for the dropdown
                  border: OutlineInputBorder(), // Outline border for the dropdown
                ),
                items: userTypes.map((String userType) {
                  // Map each role to a DropdownMenuItem
                  return DropdownMenuItem<String>(
                    value: userType, // Dropdown value
                    child: Text(userType), // Displayed text for the dropdown item
                  );
                }).toList(), // Convert the list into dropdown items
                onChanged: (String? newValue) {
                  selectedUserType = newValue; // Update the selected value when the user chooses a role
                },
                hint: const Text('Select your role'), // Hint displayed before selection
              ),
              SizedBox(height: screenHeight * 0.04), // Space before the Sign Up button

              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  // Define the behavior for the Sign Up button (to be implemented)
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2, // Responsive horizontal padding
                    vertical: screenHeight * 0.02, // Responsive vertical padding
                  ),
                  backgroundColor: Colors.orange, // Orange color for the button
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03, // Responsive font size for the button text
                    fontWeight: FontWeight.bold, // Bold font weight for emphasis
                    color: Colors.white, // White text color for contrast
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space before the "Already have an account?" link

              // "Already have an account? Login" link
              GestureDetector(
                onTap: () {
                  // Navigate to the Sign In Page when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()), // Route to SignInPage
                  );
                },
                child: const Text(
                  'Already have an account? Login', // Text for the login link
                  style: TextStyle(
                    color: Colors.blue, // Blue color for the link
                    decoration: TextDecoration.underline, // Underlined text for clickable appearance
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Space before the image

              // Image below the "Already have an account?" link
              Image.asset(
                'lib/assets/images/signuppagevector.jpeg', // Path to the image asset
                height: screenHeight * 0.25, // Responsive image height
              ),
            ],
          ),
        ),
      ),
    );
  }
}
