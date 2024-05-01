import 'package:flutter/material.dart';
import 'package:flutter_application_1/confirmreservation.dart';

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your actual image paths or network URLs
    final List<String> mealImages = [
      'assets/images/Plat1.jpeg',
      'assets/images/Plat2.jpeg',
      'assets/images/Plat4.jpeg',
      'assets/images/Plat5.jpeg',
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF57B7D), // Set the background color
      body: SingleChildScrollView(
        // Allows the page to be scrollable
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Voici la liste des repas,\n\nOn te laisse faire ton choix!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.5 / 1,
              ),
              itemCount: mealImages.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Action when image is tapped
                    // You can add navigation logic here
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Image.asset(
                            mealImages[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ReservationConfirmationPage()), // Naviguer vers la page de connexion
                            );
                          },
                          child: Text('Réserver'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFF57B7D),
        unselectedItemColor: Color(0xFFF57B7D),
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
      ),
    );
  }
}
