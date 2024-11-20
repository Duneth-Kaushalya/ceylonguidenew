import 'package:flutter/material.dart';
import 'travelerdashboard.dart'; // Import the Traveler Dashboard for navigation

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.orange.shade400,
                Colors.teal.shade400,
              ],
            ),
          ),
        ),
        title: const Text(
          'Ratings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Navigate to'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          _createDialogOption('Traveler Dashboard', context),
                          _createDialogOption('Locations', context),
                          _createDialogOption('Maps', context),
                          _createDialogOption('Budgets', context),
                          _createDialogOption('Taxi', context),
                          _createDialogOption('Supplier', context),
                          _createDialogOption('Guide', context),
                          _createDialogOption('Hotel', context),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(), // Empty body for future implementation
    );
  }

  Widget _createDialogOption(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
        // Navigate based on the selected option
        if (name == 'Traveler Dashboard') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TravelerDashboard()),
          );
        }
        // Add more navigation options as needed here...
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
