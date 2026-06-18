import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title });

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10) ,
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage("assets/images/cars.jpg"), fit: BoxFit.cover) ,
                  ),
                ) ,
                Text("FireCars",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 20,),
                Text("Découvrez et partagez les meilleures voitures de luxes 2026",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  print("Boutton connexion cliqué") ;
                } ,
                  child: Text("Continuer avec Google", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),) ,
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.amberAccent ,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ,
                  ),
                  )


                )

              ],
            ),
          ),
      ),
      )
    );
  }
}
