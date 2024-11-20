import 'package:flutter/material.dart';

// Define a data model for locations
class Location {
  final String name;
  final String description;
  final String imagePath;
  final String ticketPrice;

  Location({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.ticketPrice,
  });
}

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of locations
    List<Location> locations = [
      Location(
        name: 'Rawana Falls',
        description:
            'Ravana Falls can be mentioned as a waterfall that must visit in Ella. Hill country of Sri Lanka is quite popular for beautiful waterfalls and Ravana Falls is right at the top. The falls have been named after the legendary character Ravana, which is connected to the famous Indian epic, the Ramayana.',
        imagePath: 'lib/assets/images/rawanafalls_image.jpeg',
        ticketPrice: 'LKR 500',
      ),
      Location(
        name: 'Nine Arch Bridge',
        description:
            'The Nine Arch Bridge, also called as the Bridge in the Sky, is a bridge in Sri LankaLocally it is known as ‘Ahas Namaye Palama’ meaning nine skies bridge in Sinhala. The name derives from the visual experience. . It is one of the best examples of colonial-era railway construction in the country.The construction of the bridge is generally attributed to a local Ceylonese builder, P. K. Appuhami, in consultation with British engineers. The chief designer and project manager of the Upcountry railway line of Ceylon project was D. J. Wimalasurendra, a distinguished Ceylonese engineer and inventor. The designer of the viaduct was Harold Cuthbert Marwood of Railway Construction Department of Ceylon Government Railway. The 1923 report titled "Construction of a Concrete Railway Viaduct in Ceylon" published by the Engineering Association of Ceylon has details of all the records including the plans and drawings.',
        imagePath: 'lib/assets/images/ninearch_image.jpg',
        ticketPrice: 'LKR 1500',
      ),
      Location(
        name: 'Flying Rawana Mega Zip-Line',
        description:
            'Flying Ravana is Sri Lanka’s first ever mega dual zip-line, located amidst the luscious green estates of Ella,Sri Lanka. near Little Adams Peak - Ella s main attraction The two-wire zip-line stretches more than half a kilometre, slides at max 80kmph and offers a birds-eye view of the beautiful hills of the island. Flying Ravana is truly, Ella in all its glory.',
        imagePath: 'lib/assets/images/megazipline_image.jpeg',
        ticketPrice: 'LKR 5000',
      ),
      // Add more locations as needed
      // Example of additional locations:
      Location(
        name: 'Uva Halpawatte Tea Factory',
        description:
            'Almost every tourist who visits Ella or Bandarawela area pays a visit to our tea factory for its popularity as the largest tea factory in Sri Lanka s Uva region. Our premises offer you an opportunity to experience a guided tour of a tea factory par excellence.Go around in the tea factory with an excellent guide and Learn everything there is to know about Ceylon tea. And enjoy a tea tasting session where you will experience the art of tea tasting and manufacturing. Tourists also have the opportunity to purchase factory-fresh teas, while gazing at the panoramic views from our factory.',
        imagePath: 'lib/assets/images/teafactory_image.jpeg',
        ticketPrice: 'LKR 2000',
      ),
      // Repeat for as many locations as you want
      // You can create additional instances of Location as needed
      Location(
        name: 'Mahamewna Monestry',
        description:
            'Welcome to Mahamevnawa Buddhist Monastery, Ella Immerse yourself in the serene world of mindfulness and meditation. Join our monks on a journey of tranquility, where ancient teachings meet modern minds. Discover the art of calming your soul amidst the peaceful embrace of our sacred space. Embrace the stillness within, as you learn the timeless practice of meditation from our wise monks. Connect with the essence of serenity and find solace in the beauty of our monastery.',
        imagePath: 'lib/assets/images/temple_image.jpg',
        ticketPrice: 'LKR 100',
      ),
      // Repeat for as many locations as you want
      // You can create additional instances of Location as needed
    ];

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
          'Places to Visit',
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
      body: SingleChildScrollView(
        child: Column(
          children: locations.map((location) {
            return _createLocationCard(location); // Pass each location to the card method
          }).toList(),
        ),
      ),
    );
  }

  // Method to create the location card for each location
  Widget _createLocationCard(Location location) {
    return Container(
      margin: const EdgeInsets.all(19.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            location.imagePath,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            location.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            location.description,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Ticket Price: ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                location.ticketPrice,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: _buildGradientButton('Add +', () {
                  // Implement Add action
                }),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: _buildGradientButton('Remove -', () {
                  // Implement Remove action
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to create dialog option for navigation
  Widget _createDialogOption(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // Close the dialog
        // Implement navigation logic here based on the option selected
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

  // Method to create a gradient button
  Widget _buildGradientButton(String label, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
