import 'package:flutter/material.dart';
import 'map.dart'; // Import the MapPage
import 'calculator.dart'; // Import the Budget Calculator widget
import 'ratings.dart'; // Import the Ratings widget

class TravelerDashboard extends StatefulWidget {
  const TravelerDashboard({Key? key}) : super(key: key);

  @override
  _TravelerDashboardState createState() => _TravelerDashboardState();
}

class _TravelerDashboardState extends State<TravelerDashboard> {
  String? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

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
        title: Text(
          'Traveler Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.06,
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
                          _createDialogOption('Ratings', context), // Added Ratings option
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
      body: Container(
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
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(screenWidth * 0.05),
            childAspectRatio: 1,
            children: [
              _createIconButton('Locations', 'lib/assets/images/locationvector.jpeg', context, screenHeight),
              _createIconButton('Maps', 'lib/assets/images/mapvector.jpeg', context, screenHeight),
              _createIconButton('Budgets', 'lib/assets/images/calculatorvector.jpeg', context, screenHeight),
              _createIconButton('Taxi', 'lib/assets/images/taxivector.jpeg', context, screenHeight),
              _createIconButton('Supplier', 'lib/assets/images/suppliervector.jpeg', context, screenHeight),
              _createIconButton('Guide', 'lib/assets/images/guidevector.jpeg', context, screenHeight),
              _createIconButton('Hotel', 'lib/assets/images/hotelvector.jpeg', context, screenHeight),
              _createIconButton('Ratings', 'lib/assets/images/ratingsvector.jpeg', context, screenHeight),
            ].map((icon) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            )).toList(),
          ),
        ),
      ),
    );
  }

  Widget _createIconButton(String name, String assetPath, BuildContext context, double screenHeight) {
    bool isSelected = _selectedIcon == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = isSelected ? null : name;
        });

        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            _selectedIcon = null;
          });

          // Navigate to respective pages based on icon clicked
          if (name == 'Maps') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapPage()),
            );
          } else if (name == 'Budgets') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BudgetCalculator()),
            );
          } else if (name == 'Ratings') { // Navigate to Ratings page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Ratings()),
            );
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.black.withOpacity(0.5) : const Color.fromARGB(220, 245, 239, 172),
              blurRadius: 2.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Transform.scale(
          scale: isSelected ? 1.5 : 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.2,
                width: screenHeight * 0.2,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDialogOption(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to respective pages if an option is selected
        if (name == 'Maps') {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()),
          );
        } else if (name == 'Budgets') {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BudgetCalculator()),
          );
        } else if (name == 'Ratings') { // Navigate to Ratings page from dialog
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ratings()),
          );
        } else {
          Navigator.of(context).pop();
        }
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
