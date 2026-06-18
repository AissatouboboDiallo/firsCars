import 'package:flutter/material.dart';

void ShowNotification(BuildContext context , String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey,
      content: Text(message),
    )
  ) ;
}