import 'package:flutter/material.dart';

import 'package:flutter_application_1/restaurant.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 138, 138),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _passwordErrorText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/Logo.png', // Chemin vers votre image/logo
          width: 600, // Largeur de l'image
          height: 300, // Hauteur de l'image
        ),
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
            errorText:
                _passwordErrorText.isNotEmpty ? _passwordErrorText : null,
          ),
          obscureText: true,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _registerUser(context);
          },
          child: Text('S\'inscrire'),
        ),
      ],
    );
  }

  void _registerUser(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (password.length < 8) {
      setState(() {
        _passwordErrorText =
            'Le mot de passe doit contenir au moins 8 caractères.';
      });
    } else {
      // Le mot de passe est valide, vous pouvez ajouter ici la logique pour traiter l'inscription
      // Par exemple, envoyer les informations au serveur
      // Pour cet exemple, je vais simplement afficher un message d'inscription réussie
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Inscription réussie'),
            content: Text('Votre compte a été créé avec succés.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantPage()),
                  ); // Vous pouvez ajouter ici une navigation vers la page de connexion ou une autre action après l'inscription
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
