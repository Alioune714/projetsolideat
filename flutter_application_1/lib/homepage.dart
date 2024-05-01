import 'package:flutter/material.dart';
import 'package:flutter_application_1/accueil.dart'; // Importez votre page de connexion

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 241, 138, 138), // Changer la couleur de l'arrière-plan
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, // Aligner le contenu en haut de la colonne
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Étirer le contenu sur toute la largeur de l'écran
          children: [
            // Ajoute un espace en haut de la colonne
            Image.asset(
              'assets/images/Logo.png', // Chemin vers votre image/logo
              width: 600, // Largeur de l'image
              height: 400, // Hauteur de l'image
            ),
            SizedBox(height: 5), // Ajoute un espace entre le logo et le texte
            Text(
              'L\'appli connectant\n les restaurants solidaires \navec les personnes en précarité',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Changer la couleur du texte
              ),
            ),
            SizedBox(
                height: 10), // Ajoute un espace entre le texte et le bouton
            Text(
              'Fais toi plaisir en réservant vite ton repas. C\'est gratuit!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Changer la couleur du texte
              ),
            ),
            SizedBox(
                height: 40), // Ajoute un espace entre le texte et le bouton
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Accueil()), // Naviguer vers la page de connexion
                );
              },
              child: Text('Suivant'),
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
