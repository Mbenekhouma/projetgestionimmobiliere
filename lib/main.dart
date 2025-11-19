import 'package:flutter/material.dart';
import 'package:projetgestionimmobiliere/screens/user_profile.dart';
import 'screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //on retire le scaffold et on le remplace par le homescreen
      //home: HomeScreen(),
      home: UserProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
