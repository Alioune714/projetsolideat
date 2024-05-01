import 'package:flutter/material.dart';
import 'package:flutter_application_1/choice.dart';

class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF57B7D), // Set the background color
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/Logo.png', // Chemin vers votre image/logo
            width: 600, // Largeur de l'image
            height: 400, // Hauteur de l'image
          ), // Placeholder for the app logo
          // Replace with your app logo
          SizedBox(height: 30), // Space between logo and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Align buttons horizontally with space
            children: <Widget>[
              // Button for 'SUR PLACE'
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoicePage()),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.store, size: 50, color: Colors.white),
                    Text('SUR PLACE', style: TextStyle(color: Colors.white)),
                  ],
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
              ),
              // Button for 'À EMPORTER'
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoicePage()),
                  );
                },
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_shipping, size: 50, color: Colors.white),
                    Text('À EMPORTER', style: TextStyle(color: Colors.white)),
                  ],
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFF57B7D), // Set the selected item color
        unselectedItemColor: Color(0xFFF57B7D), // Set the unselected item color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Avantages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Commandes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Plus',
          ),
        ],
      ), // Bottom navigation bar is not included in the FirstPage as per your design
    );
  }
}
