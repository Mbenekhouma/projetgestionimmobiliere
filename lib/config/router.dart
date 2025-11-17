import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// === Import des écrans ===
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
        },
      ),

      // ==== page liste complete des produits
      GoRoute(
        path: '/produits/:type',
        name: 'produits',
        builder: (context, state) {
          final type = state.pathParameters['type']!;
          return TotalListProduitScreen(type: type);
        },
      ),
    ],
  );
});
