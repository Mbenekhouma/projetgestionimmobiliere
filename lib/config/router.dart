// Fichier : lib/config/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/category_screen.dart';
import '../screens/bien_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/bien',
        name: 'bien',
        builder: (context, state) {
          final extra = state.extra;
          if (extra == null || extra is! Map<String, dynamic>) {
            return const Scaffold(
              body: Center(child: Text("Aucun bien fourni")),
            );
          }
          return BienScreen(bien: extra);
        },
      ),
      GoRoute(
        path: '/category/:category',
        name: 'category',
        builder: (context, state) {
          final category = state.pathParameters['category'];
          if (category == null || category.isEmpty) {
            return const Scaffold(
              body: Center(child: Text("Catégorie manquante")),
            );
          }
          return CategoryScreen(category: category);
        },
      ),
    ],
  );
});
