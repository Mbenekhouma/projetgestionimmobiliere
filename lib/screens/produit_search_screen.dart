import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/header_widget.dart';

class ProduitSearchScreen extends StatelessWidget {
  final String searchText;

  const ProduitSearchScreen({super.key, required this.searchText});

  // === Données statiques simulées ===
  final List<Map<String, dynamic>> produits = const [
    {
      'image': 'assets/images/maison1.jpg',
      'description': 'Belle maison moderne avec jardin',
      'prix': '45 000 000 FCFA',
      'type': 'vente',
      'categorie': 'maison',
      'lieu': 'Dakar',
    },
    {
      'image': 'assets/images/app2.jpg',
      'description': 'Appartement 3 chambres à Mermoz',
      'prix': '250 000 FCFA / mois',
      'type': 'location',
      'categorie': 'appartement',
      'lieu': 'Mermoz',
    },
    {
      'image': 'assets/images/studio6.jpg',
      'description': 'Studio tres style à Mermoz',
      'prix': '250 000 FCFA / mois',
      'type': 'location',
      'categorie': 'studio',
      'lieu': 'Mermoz',
    },
    {
      'image': 'assets/images/studio1.jpg',
      'description': 'Studio meublé à Ngor',
      'prix': '100 000 FCFA / mois',
      'type': 'location',
      'categorie': 'studio',
      'lieu': 'Ngor',
    },
    {
      'image': 'assets/images/studio10.jpg',
      'description': 'Studio chic à Mermoz',
      'prix': '250 000 FCFA / mois',
      'type': 'location',
      'categorie': 'studio',
      'lieu': 'Mermoz',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // === Filtrage local (simulation de recherche) ===
    final produitsFiltres = produits
        .where((p) =>
        p['categorie'].toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),

      // --- AppBar simple ---
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // Retour à la page précédente
          },
        ),
        title: const Text('Résultats de recherche'),
      ),

      // --- Corps avec Header + liste ---
      body: Column(
        children: [
          const HeaderWidget(),

          Expanded(
            child: produitsFiltres.isEmpty
                ? const Center(
              child: Text(
                "Aucun résultat trouvé",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: produitsFiltres.length,
              itemBuilder: (context, index) {
                final produit = produitsFiltres[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        child: Image.asset(
                          produit['image'],
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              produit['description'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              produit['prix'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${produit['categorie']} • ${produit['lieu']} (${produit['type']})",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // --- Bottom Navigation ---
      bottomNavigationBar: BottomNavbarWidget(
        activeTab: 'recherche',
      ),
    );
  }
}