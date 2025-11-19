// Importation du package principal de Flutter pour les widgets Material.
import 'package:flutter/material.dart';

// Importation de GoRouter pour avoir accès aux fonctionnalités de navigation
// comme context.go() si on voulait ajouter un lien vers une page d'inscription par exemple.
import 'package:go_router/go_router.dart';

// Importation de Riverpod pour pouvoir interagir avec nos providers.
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importation du provider d'authentification que nous avons créé.
// C'est lui qui contient l'état "connecté / déconnecté".
import '../providers/auth_provider.dart';

/// L'écran de connexion.
/// On le transforme en `ConsumerWidget` au lieu de `StatelessWidget`.
/// Cela nous donne accès à un paramètre spécial, `ref`, dans la méthode `build`.
/// C'est notre "télécommande" pour interagir avec les providers.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  // La méthode build prend maintenant un deuxième paramètre : WidgetRef ref.
  Widget build(BuildContext context, WidgetRef ref) {
    // Scaffold est la structure de base de notre page.
    return Scaffold(
      appBar: AppBar(
        // On rend le titre un peu plus centré et stylé.
        title: const Text("Bienvenue sur DakarConnect"),
        centerTitle: true,
      ),
      // Le corps de la page. On ajoute du Padding pour aérer les éléments.
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        // On utilise un SingleChildScrollView pour éviter les erreurs de dépassement
        // lorsque le clavier s'affiche sur des écrans plus petits.
        child: SingleChildScrollView(
          // Column nous permet d'empiler nos widgets verticalement.
          child: Column(
            // Aligne les enfants au centre de l'espace vertical.
            mainAxisAlignment: MainAxisAlignment.center,
            // Étire les enfants pour qu'ils prennent toute la largeur.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Un petit espace en haut pour centrer visuellement le formulaire.
              const SizedBox(height: 80),

              // Champ de saisie pour l'adresse e-mail.
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 20),
              // Champ de saisie pour le mot de passe.
              const TextField(
                obscureText: true, // Cache le texte saisi.
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 40),
// Le bouton de connexion qui va simuler l'authentification.
              ElevatedButton(
                // La fonction qui s'exécute lors du clic.
                onPressed: () {
                  // C'EST LA LIGNE LA PLUS IMPORTANTE DE CE TEST :
                  // 1. `ref.read(...)` : On demande à Riverpod de nous donner accès à un provider.
                  //    On utilise `read` car on ne fait que changer la valeur une fois, on n'a pas
                  //    besoin d'écouter les changements en continu ici.
                  // 2. `authStateProvider.notifier` : On demande l'accès au "contrôleur" du provider,
                  //    celui qui a le droit de modifier l'état.
                  // 3. `.state = true` : On change la valeur de l'état de `false` à `true`.
                  ref.read(authStateProvider.notifier).state = true;
                  // Dès que cette ligne est exécutée, GoRouter, qui écoute ce provider,
                  // va voir que l'état a changé. Il va ré-évaluer sa logique de redirection
                  // et nous envoyer automatiquement vers la page d'accueil ('/home'). Magique !
                },
                // On personnalise un peu le style du bouton.
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Le texte affiché sur le bouton.
                child: const Text('Se Connecter (Simulation)'),
              ),        ],       ),       ),     ),  );   }  }
