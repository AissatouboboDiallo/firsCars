import 'package:fire_cars/Pages/views/home/addsectioncard.dart';
import 'package:fire_cars/Pages/views/home/homeAppbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Homeappbar(user:_user),
            Addsectioncard(user: _user),
          ],


      ),
      ),
    );
  }
}
