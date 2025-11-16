import 'package:flutter/material.dart';
import 'package:projetgestionimmobilier/screens/bien_screen.dart';
import 'package:projetgestionimmobilier/screens/category_screen.dart';
import 'package:projetgestionimmobilier/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// MyApp est le widget racine de notre application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// La méthode build() décrit comment afficher le widget.
  @override
  Widget build(BuildContext context) {
    // MaterialApp est un widget de base qui configure notre application
    // avec les fonctionnalités de Material Design.
    return MaterialApp(
      // 'home' définit le premier écran qui sera affiché.
      debugShowCheckedModeBanner: false,
      home: CategoryScreen(category: 'maison'),
    );
  }
}

