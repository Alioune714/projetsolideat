import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/loginpage.dart';
import 'package:flutter_application_1/accueil.dart';
import 'package:flutter_application_1/inscription.dart';
import 'package:flutter_application_1/reservation.dart';
import 'package:flutter_application_1/choice.dart';
import 'package:flutter_application_1/restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/accueil': (context) => Accueil(),
        '/inscription': (context) => RegistrationPage(),
        '/reservation': (context) => ReservationPage(),
        '/choice': (context) => ChoicePage(),
        '/restaurant': (context) => RestaurantPage(),
      },
    );
  }
}
