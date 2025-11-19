import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:projetgestionimmobilier/screens/bien_screen.dart';
import 'package:projetgestionimmobilier/screens/category_screen.dart';

import '../screens/home_screen.dart';
import '../screens/total_list_produit_screen.dart';
import '../screens/produit_search_screen.dart';

// Provider qui stocke la configuration des routes
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      // page d'accueil
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // page resultat recherche
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) {
          // On récupère le paramètre "q" depuis l'URL
          final query = state.uri.queryParameters['q'] ?? '';
          // On passe ce paramètre au constructeur de ProduitSearchScreen
          return ProduitSearchScreen(searchText: query);
        }
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

      // ==== page liste complete des produits
      GoRoute(
        path: '/produits/:type',
        name: 'produits',
        builder: (context, state) {
          final type = state.pathParameters['type']!;
          return TotalListProduitScreen(type: type);
        }
      ),
      GoRoute(
        path: '/category/:category',
        name: 'category',
        builder: (context, state) {
          final category = state.pathParameters['category'];
          if (category == null || category.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('Catégorie manquante')),
            );
          }
          return CategoryScreen(category: category);
        },

      )
    ],
  );
});
