import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(  scopes: ['email'], );

  // connexion avec google
Future<UserCredential> signInWithGoogle() async {

  // Declencher les flux d'authentification
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();


  // Details autorisation de demande
  final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

  // Créer un nouvel identifiant
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth!.accessToken,
    idToken: googleAuth!.idToken,
  );

  // Une fois connecté renvoyé l'identifiant de l'utilisateur

  return await _auth.signInWithCredential(credential);
}

// L'etat utilisateur en temps réel

Stream<User?> get user => _auth.authStateChanges();

// Deconnexion
Future<void> signOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}

}