import 'package:flutter/material.dart';
import 'map.dart'; // Import the MapPage

class TravelerDashboard extends StatefulWidget {
  const TravelerDashboard({Key? key}) : super(key: key);

  @override
  _TravelerDashboardState createState() => _TravelerDashboardState();
}

class _TravelerDashboardState extends State<TravelerDashboard> {
  // Define the selected icon variable
  String? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive UI
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

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
          'Traveler Dashboard', // Title of the AppBar
          style: TextStyle(
            color: Colors.white, // White text color for visibility
            fontSize: screenHeight * 0.06, // Responsive title font size
            fontWeight: FontWeight.bold, // Bold font for emphasis
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
        actions: [
          // Menu icon on the AppBar
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Show the traveler's navigation list
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Traveler Navigation'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          _createDialogOption('Locations', context),
                          _createDialogOption('Maps', context), // Menu option for Map
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
      body: Container(
        // Add gradient background to the body
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
        child: Center(
          child: GridView.count(
            crossAxisCount: 2, // Two icons per row
            padding: EdgeInsets.all(screenWidth * 0.05),
            childAspectRatio: 1, // Maintain aspect ratio for icons
            children: [
              _createIconButton('Locations', 'lib/assets/images/locationvector.jpeg', context, screenHeight),
              _createIconButton('Maps', 'lib/assets/images/mapvector.jpeg', context, screenHeight),
              _createIconButton('Budgets', 'lib/assets/images/calculatorvector.jpeg', context, screenHeight),
              _createIconButton('Taxi', 'lib/assets/images/taxivector.jpeg', context, screenHeight),
              _createIconButton('Supplier', 'lib/assets/images/suppliervector.jpeg', context, screenHeight),
              _createIconButton('Guide', 'lib/assets/images/guidevector.jpeg', context, screenHeight),
              _createIconButton('Hotel', 'lib/assets/images/hotelvector.jpeg', context, screenHeight),
            ].map((icon) => Padding(
              padding: const EdgeInsets.all(8.0), // Add padding for separation
              child: icon,
            )).toList(), // Apply padding to each icon
          ),
        ),
      ),
    );
  }

  // Method to create each icon button with click effect
  Widget _createIconButton(String name, String assetPath, BuildContext context, double screenHeight) {
    bool isSelected = _selectedIcon == name; // Check if this icon is selected

    return GestureDetector(
      onTap: () {
        setState(() {
          // Set the clicked icon name
          _selectedIcon = isSelected ? null : name; // Toggle selection
        });

        // Show the icon in maximized state momentarily
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            // Reset the selected icon after a short delay
            _selectedIcon = null; // Reset to normal state
          });

          // Navigate to Map page if the Map icon is clicked
          if (name == 'Maps') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapPage()), // Navigate to Map page
            );
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Animation duration for scaling
        decoration: BoxDecoration(
          color: Colors.transparent, // Make the background transparent to show gradient
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.black.withOpacity(0.5) : const Color.fromARGB(220, 245, 239, 172), // Shadow color based on selection
              blurRadius: 2.0, // Blur radius for the shadow
              offset: Offset(0, 5), // Shadow offset
            ),
          ],
        ),
        child: Transform.scale(
          scale: isSelected ? 1.5 : 1.0, // Apply the scale transformation (maximize only on click)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.2, // Increase the height for larger icons
                width: screenHeight * 0.2, // Set width to match height for aspect ratio
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.contain, // Ensure the icon fits well within the container
                ),
              ),
              SizedBox(height: 8), // Space between icon and label
              Text(
                name,
                style: TextStyle(
                  fontSize: 18, // Increased font size for the label
                  color: Colors.black, // White color for label text
                  fontWeight: FontWeight.bold, // bold the texts of icons
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create dialog option for navigation
  Widget _createDialogOption(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Map page if Maps is selected
        if (name == 'Maps') {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()), // Navigate to Map page
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
            fontSize: 18, // Font size for dialog options
            color: Colors.orange, // Color for the option text
          ),
        ),
      ),
    );
  }
}
