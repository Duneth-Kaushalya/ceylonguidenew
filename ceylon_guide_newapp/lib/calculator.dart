import 'package:flutter/material.dart';
import 'map.dart'; // Import the MapPage

class BudgetCalculator extends StatelessWidget {
  const BudgetCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
        title: const Text(
          'Budget Calculator', // Title of the AppBar
          style: TextStyle(
            color: Colors.white, // White text color for visibility
            fontSize: 24, // Match the font size in TravelerDashboard
            fontWeight: FontWeight.bold, // Bold font for emphasis
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
        actions: [
          // Menu icon on the AppBar
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Show the navigation menu
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Traveler Navigation'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
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
                          Navigator.of(context).pop(); // Close the dialog
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Display for the calculated budget at the top, close to the AppBar
                Container(
                  margin: EdgeInsets.only(bottom: screenSize.height * 0.2), // Increase space below
                  padding: EdgeInsets.all(screenSize.width * 0.05), // Padding around the text
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for visibility
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        blurRadius: 10, // Softness of the shadow
                        spreadRadius: 2, // How far the shadow spreads
                        offset: Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Calculated Budget: LKR 0.00', // Placeholder for calculated budget
                    style: TextStyle(
                      fontSize: 24, // Match font size in TravelerDashboard
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Large input field for the budget calculation
                SizedBox(
                  width: screenSize.width * 0.7, // Make the text box wide
                  height: screenSize.width * 0.2, // Make the text box height
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 90), // Increase vertical padding
                    ),
                    style: TextStyle(fontSize: 18), // Increase font size
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03), // Increase space between text box and button

                // Calculate Budget button positioned at the bottom
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.orange.shade400, // Starting color of the gradient
                        Colors.teal.shade400,   // Ending color of the gradient
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8), // Rounded corners for the button
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement your budget calculation logic here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.02,
                        horizontal: screenSize.width * 0.2, // Set width
                      ),
                      backgroundColor: Colors.transparent, // Make the button background transparent
                      elevation: 0, // Remove shadow for a flat look
                    ),
                    child: const Text(
                      'Calculate Budget',
                      style: TextStyle(
                        fontSize: 18, // Match font size in TravelerDashboard
                        fontWeight: FontWeight.w700,
                        color: Colors.white, // White text color for contrast
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to create dialog option for navigation
  Widget _createDialogOption(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to respective pages based on selection
        if (name == 'Maps') {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()), // Navigate to Map page
          );
        } else if (name == 'Budgets') {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BudgetCalculator()), // Stay on Budget Calculator
          );
        } else {
          Navigator.of(context).pop(); // Close the dialog for other options
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18, // Match font size for dialog options
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
