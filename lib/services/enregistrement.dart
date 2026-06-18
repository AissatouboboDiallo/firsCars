import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/carModel.dart';

class DatabaseService {
  // Declaration et initialisation

     // Pour Firestore
  CollectionReference _cars = FirebaseFirestore.instance.collection('cars');

    // Pour Firebase Storage
  FirebaseStorage _storage = FirebaseStorage.instance;

  // upload image vers firebase storage
 Future<String> uploadFile(file) async {
   Reference reference = _storage.ref().child('cars/${DateTime.now().millisecondsSinceEpoch}.png');
   UploadTask uploadTask = reference.putFile(file);
   TaskSnapshot taskSnapshot = await uploadTask;
   return await taskSnapshot.ref.getDownloadURL();

 }

 // ajout de la voiture dans la base de donne firestore

void addCard(Car car)  {
   _cars.add({
     'CarName' : car.carName,
     'CarUrlImg' : car.carUrlImg,
     'CarUserName' : car.carUserName,
     'CarUserId' : car.carUserId,
     'CarTimesTamp' : FieldValue.serverTimestamp(),
     'CarLike' : car.carLike,
     'CarLikeCount' : 0,

   }) ;
}
}