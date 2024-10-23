import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 


class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

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
                Colors.orange.shade400, // Starting color of the gradient
                Colors.teal.shade400,   // Ending color of the gradient
              ],
            ),
          ),
        ),
        title: Text(
          'Map',
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
              // You can implement a similar menu as in TravelerDashboard here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/badullamap.png'),
                  fit: BoxFit.contain, // Adjust this based on your preference
                ),
              ),
              width: double.infinity, // Make the width fill the available space
              height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
            ),
            SizedBox(height: 20), // Add space between the image and the button
            TextButton(
              onPressed: () async {
                const url = 'https://www.google.com/maps/place/Badulla/@6.9887911,81.0384176,14z/data=!3m1!4b1!4m6!3m5!1s0x3ae462167fa6dad9:0x84d3d072c32aa246!8m2!3d6.9934009!4d81.0549815!16zL20vMDd5MGpk?entry=ttu&g_ep=EgoyMDI0MTAxNi4wIKXMDSoASAFQAw%3D%3D';
                if (await canLaunch(url)) {
                  await launch(url); // Launch the URL
                } else {
                  throw 'Could not launch $url'; // Error handling
                }
              },
              child: Text(
                'Find on Google',
                style: TextStyle(
                  fontSize: 18, // Font size for the button text
                  color: Colors.blue, // Blue color to indicate a link
                  fontWeight: FontWeight.bold, // Bold text for emphasis
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
