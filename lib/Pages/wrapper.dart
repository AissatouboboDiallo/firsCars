import 'package:fire_cars/Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home/accueil.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupérer le user connecté
    final _user = Provider.of<User?>(context);
    if (_user == null) {
      return LoginPage(title: "Bienvenu sur la page de connexion");
    }
    else  {
      return Home();
    }

  }
}
