import 'package:fire_cars/services/authentification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profileappbar extends StatelessWidget {
  const Profileappbar({super.key,required this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Profile"),
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user!.photoURL!),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white , Colors.transparent] ,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
              )
            ),
          ),
        ),
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan
              (children:
                [
                  TextSpan(
                    text: '${user!.displayName}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  TextSpan(
                    text: '\n${user!.email}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black54, fontSize: 10,fontWeight: FontWeight.bold),

                  )
                ]
             )
        ),
        titlePadding: EdgeInsets.only(bottom: 10, left: 46.0),

      ),
      actions: [
        IconButton(onPressed: () => signOut(context), icon: Icon(Icons.logout))
      ],
    );
  }
  void signOut(BuildContext context ) {
    Navigator.pushNamed(context, '/');
    AuthService().signOut();
  }
}
