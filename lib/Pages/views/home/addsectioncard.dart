import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_cars/Pages/views/home/showCard.dart';
import 'package:image_picker/image_picker.dart';

class Addsectioncard extends StatelessWidget {
  const Addsectioncard({super.key, required this.user});
  final User? user;


  @override
  Widget build(BuildContext context) {
    return SliverList(delegate:
        SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salut') ,
                      Text(user!.displayName!, style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),) ,
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],

                        ),
                        child: IconButton(onPressed: () {},  icon: Icon(Icons.search)),

                      ) ,
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,

                        ),
                        child:
                        IconButton
                          (onPressed: () => showCarDialog(context, user!),
                            icon: Icon(Icons.add)
                        ),

                      ) ,
                    ],
                  )
                ],
              ),
            )
          ]
        )
    );
  }
  void  showCarDialog(BuildContext context, User user) {
    CardDialog(user: user).ShowCardDialog(context, ImageSource.gallery);
  }
}
