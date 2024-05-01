import 'package:flutter/material.dart';

import 'package:flutter_application_1/reservation.dart';

// Modèle de restaurant
class Restaurant {
  final String name;
  final String address;
  final String description;
  final String image;
  final String openingHours;

  Restaurant({
    required this.name,
    required this.address,
    required this.description,
    required this.image,
    required this.openingHours,
  });
}

class RestaurantPage extends StatelessWidget {
  // Liste des restaurants disponibles
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Le Refettorio, le conte de la crypte',
      address: '123 Rue de Paris',
      description: 'Le meilleur restaurant de la ville.',
      image: 'assets/images/restausolidaire1.jpg',
      openingHours: '10:00 - 22:00',
    ),
    Restaurant(
      name: 'Le Relais, l’ancienne usine devenue resto d’insertion',
      address: ' 61 rue Victor Hugo, Pantin (93)',
      description: 'Dégustez une cuisine exquise dans un cadre élégant.',
      image: 'assets/images/restausolidaire2.jpg',
      openingHours: '10:00 - 22:00',
    ),

    Restaurant(
      name: 'La Table du Recho, melting-popote',
      address: '456 Avenue des Champs-Élysées',
      description: 'Dégustez une cuisine exquise dans un cadre élégant.',
      image: 'assets/images/restausolidaire3.png',
      openingHours: '10:00 - 22:00',
    ),
    Restaurant(
        name: 'Restaurant 4',
        address: '11 rue de Maleville M° Miromesnil',
        description: 'Dégustez une cuisine exquise dans un cadre élégant.',
        image: 'assets/images/restausolidaire4.jpg',
        openingHours: '10:00 - 22:00'),

    Restaurant(
        name: 'Restaurant 5',
        address: '66 avenue Claude-Vellefaux, Paris',
        description: 'Dégustez une cuisine exquise dans un cadre élégant.',
        image: 'assets/images/restausolidaire4.jpg',
        openingHours: '10:00 - 22:00'),

    Restaurant(
        name: 'Restaurant social Santeuil',
        address: '8, rue de Santeuil, Paris',
        description:
            'Tout public sur orientation des services sociaux de votre arrondissement et associations partenaires.Repas chauds et paniers repas',
        image: 'assets/images/restausolidaire4.jpg',
        openingHours: '10:00 - 22:00'),

    // Ajoutez d'autres restaurants si nécessaire
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 138, 138),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/Logo.png', // Chemin vers votre image/logo
              width: 600, // Largeur de l'image
              height: 300, // Hauteur de l'image
            ),
            Text(
              'Choisissez un restaurant :',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            // Liste déroulante des restaurants
            DropdownButton<Restaurant>(
              items: restaurants.map((Restaurant restaurant) {
                return DropdownMenuItem<Restaurant>(
                  value: restaurant,
                  child: Text(restaurant.name),
                );
              }).toList(),
              onChanged: (Restaurant? selectedRestaurant) {
                if (selectedRestaurant != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetailsPage(
                        restaurant: selectedRestaurant,
                      ),
                    ),
                  ); // Afficher les détails du restaurant sélectionné
                }
              },
            ),
          ],
        ),
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
      ),
    );
  }
}

class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailsPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 138, 138),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/Logo.png', // Chemin vers votre image/logo
              width: 600, // Largeur de l'image
              height: 300, // Hauteur de l'image
            ),
            // Afficher l'image du restaurant
            Image.asset(
              restaurant.image,
              width: double.infinity, // Prendre toute la largeur disponible
              height: 300, // Hauteur fixe
              fit: BoxFit
                  .cover, // Ajuster la taille de l'image pour couvrir tout l'espace
            ),
            SizedBox(height: 20.0),
            Text(
              'Nom: ${restaurant.name}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Adresse: ${restaurant.address}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description: ${restaurant.description}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Heures d\'ouverture: ${restaurant.openingHours}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReservationPage()), // Naviguer vers la page de réserver
                );
              },
              child: Text('Réserver'),
            ),
          ],
        ),
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
      ),
    );
  }
}
