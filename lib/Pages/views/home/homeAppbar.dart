import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homeappbar extends StatelessWidget {
  const  Homeappbar({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(' Fire cars '),
      elevation: 0.8,
      floating:true,
      forceElevated: true,
      actions: [
        Padding(padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile'),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
        ) ,
        ) ,

      ]
    ) ;
  }
}
