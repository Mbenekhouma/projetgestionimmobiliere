import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/type_buttons_widget.dart';
import '../widgets/bottom_navbar_widget.dart';

class TotalListProduitScreen extends StatefulWidget {
  final String type; // "vente" ou "location"

  const TotalListProduitScreen({super.key, required this.type});

  @override
  State<TotalListProduitScreen> createState() => _TotalListProduitScreenState();
}

class _TotalListProduitScreenState extends State<TotalListProduitScreen> {
  late String selectedType;
  final FocusNode _searchFocusNode = FocusNode();

  final List<Map<String, dynamic>> allProduits = [
    {
      'image': 'assets/images/maison1.jpg',
      'description': 'Belle maison moderne avec jardin',
      'prix': '45 000 000 FCFA',
      'type': 'vente',
      'categorie': 'Maison',
      'lieu': 'Dakar',
    },
    {
      'image': 'assets/images/studio10.jpg',
      'description': 'Studio bien placé proche université',
      'prix': '8 000 000 FCFA',
      'type': 'vente',
      'categorie': 'Studio',
      'lieu': 'Saint-Louis',
    },
    {
      'image': 'assets/images/app1.jpg',
      'description': 'Appartement spacieux au centre-ville',
      'prix': '30 000 000 FCFA',
      'type': 'vente',
      'categorie': 'Appartement',
      'lieu': 'Thiès',
    },
    {
      'image': 'assets/images/maison2.jpg',
      'description': 'Maison à louer à Dakar',
      'prix': '350 000 FCFA / mois',
      'type': 'location',
      'categorie': 'Maison',
      'lieu': 'Dakar',
    },
    {
      'image': 'assets/images/app2.jpg',
      'description': 'Appartement 3 chambres à Mermoz',
      'prix': '250 000 FCFA / mois',
      'type': 'location',
      'categorie': 'Appartement',
      'lieu': 'Mermoz',
    },
    {
      'image': 'assets/images/studio3.jpg',
      'description': 'Studio moderne à Sicap',
      'prix': '130 000 FCFA / mois',
      'type': 'location',
      'categorie': 'Studio',
      'lieu': 'Sicap',
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedType = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    // Filtrer les produits selon le type sélectionné
    final produits =
    allProduits.where((produit) => produit['type'] == selectedType).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            SearchBarWidget(focusNode: _searchFocusNode),
            TypeButtonsWidget(
              selectedType: selectedType,
              onChange: (type) {
                setState(() => selectedType = type);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: produits.length,
                itemBuilder: (context, index) {
                  final produit = produits[index];
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
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.asset(
                            produit['image'],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) =>
                            const Icon(Icons.image_not_supported,
                                size: 100, color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produit['description'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
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
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    produit['categorie'],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  Text(
                                    produit['lieu'],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
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
      ),

      // Appel du widget bottom_navbar_widget
      bottomNavigationBar: BottomNavbarWidget(
        activeTab: 'produits',
        searchFocusNode: _searchFocusNode,
      ),
    );
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }
}
