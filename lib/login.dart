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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10) ,
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage("assets/images/softCars.jpg"), fit: BoxFit.cover) ,


                  ),
                ) ,
                Text("FireCars", style: TextStyle(fontSize: 20, fontFamily: "poppins"),),
                Text("Decouvrez et partagez les meilleurs voitures de 2021", style: Theme.of(context).textTheme.headlineMedium,),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  print("Boutton connexion cliqué") ;
                } ,
                  child: Text("Continuer avec Google") ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary ,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                  ),


                )

              ],
            ),
          ),
      ),
      )
    );
  }
}
