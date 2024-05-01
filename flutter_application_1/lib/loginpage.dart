import 'package:flutter/material.dart';
import 'package:flutter_application_1/inscription.dart';
import 'package:flutter_application_1/restaurant.dart';

class LoginPage extends StatelessWidget {
  // Fonction pour vérifier si l'email est valide
  bool isEmailValid(String email) {
    // Ici, vous pouvez mettre en place votre propre logique pour vérifier si l'email est valide
    // Dans cet exemple, nous vérifions simplement si l'email contient un @
    return email.contains('@');
  }

  // Fonction pour vérifier si le mot de passe dépasse 8 caractères
  bool isPasswordValid(String password) {
    return password.length >= 8;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 138, 138),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: 500, // Largeur de l'image
              height: 400, // Hauteur de l'image
            ),
            Text(
              'Pour choisir vos plats préférés \n connectez-vous d\'abord',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Changer la couleur du texte
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Adresse e-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Pour masquer le texte du mot de passe
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Récupérer les valeurs des champs d'email et de mot de passe
                String email = _emailController.text;
                String password = _passwordController.text;

                // Vérifier si l'email est valide
                if (!isEmailValid(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Adresse e-mail invalide.'),
                    ),
                  );
                  return; // Arrêter l'exécution de la fonction
                }

                // Vérifier si le mot de passe est valide
                if (!isPasswordValid(password)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Le mot de passe doit contenir au moins 8 caractères.'),
                    ),
                  );
                  return; // Arrêter l'exécution de la fonction
                }

                // Si tout est valide, naviguer vers la page du restaurant
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantPage()),
                );
              },
              child: Text('Se connecter'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vous n'avez pas de compte ? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Inscrivez-vous',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
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
