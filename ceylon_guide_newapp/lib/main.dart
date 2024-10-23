import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the Welcome Page widget
import 'signin.dart'; // Import the Sign In Page widget (for navigation)
import 'signup.dart'; // Import the Sign Up Page widget (for navigation)

// Main function that runs the app
void main() {
  runApp(const MyApp()); // The root of the application
}

// MyApp is the root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceylon Guide', // The app's title
      theme: ThemeData(
        primarySwatch: Colors.teal, // Global color theme for the app
      ),
      home: const WelcomePage(), // Set the Welcome Page as the default home screen
      // Any additional initial settings or configurations for the app can be added here in the future
    );
  }
}
