import 'dart:io';

import 'package:fire_cars/services/enregistrement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/carModel.dart';
import '../../../shared-ui/showSnackbar.dart';

class CardDialog {
  User ? user;
  CardDialog({this.user});

  // FOnction pour visualiser la boite de dialog
  void ShowCardDialog(BuildContext context, ImageSource source) async {
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    final _keyForm= GlobalKey<FormState>();
    String _carName = "";
    String _formError = "Veuillez entrer le nom de la voiture";
    showDialog(context : context , builder : (BuildContext context) {
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey ,
              image: DecorationImage(
                image: FileImage(_file),
                fit: BoxFit.cover,
              )
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: _keyForm,
                  child: TextFormField(
                    maxLength: 20,
                    onChanged: (value) => _carName = value,
                    validator: (value) => value!.isEmpty ? _formError : null,
                    decoration: InputDecoration(
                      labelText: "Nom de la voiture",
                      border: OutlineInputBorder() ,
                      suffixIcon: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      )
            
                    ),
            
                  ),

                ) ,
                Align(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text("Annuler")),
                      ElevatedButton(onPressed: () => onSubmit(context, _keyForm, _file, _carName, user), child: Text("Publier"))
                    ],
                  ),
                )
              ],
            ),
          )
        ]
      ) ;
    }
    ) ;

  }

  void onSubmit(context,keyForm, file,carName,user) async {
    if (keyForm.currentState!.validate()) {
      Navigator.of(context).pop();
      ShowNotification(context, "Chargement...");
      DatabaseService db= DatabaseService();
      String carUrlImg = await db.uploadFile(file);
      db.addCard(Car(
        carName: carName,
        carUrlImg: carUrlImg,
        carUserName: user!.displayName,
        carUserId: user!.uid,
      ));
      ShowNotification(context, "Votre voiture a été ajouté avec succès");
      Navigator.pop(context);
    }
  }
}
