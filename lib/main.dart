import 'package:fire_cars/Pages/login.dart';
import 'package:fire_cars/Pages/wrapper.dart';
import 'package:fire_cars/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fire_cars/services/authentification.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
  MultiProvider(providers: [
    StreamProvider.value(
      initialData: null,
      value: AuthService().user,
    )
  ],
  child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:ColorScheme.fromSeed(seedColor: Colors.yellow),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

      ),
      initialRoute: '/',
      routes:  {
        '/': (context) =>Wrapper(),
        '/profile': (context) => Profile()
      },

    );
  }
}

