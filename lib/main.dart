import 'package:flutter/material.dart';
import 'package:projetgestionimmobilier/screens/user_profile.dart';

import 'screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router.dart';


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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),

    );
  }
}
