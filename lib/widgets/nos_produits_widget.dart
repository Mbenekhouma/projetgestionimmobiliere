import 'package:flutter/material.dart';

class NosProduitsWidget extends StatefulWidget {
  final String selectedType; // "vente" ou "location"

  const NosProduitsWidget({super.key, required this.selectedType});

  @override
  State<NosProduitsWidget> createState() => _NosProduitsWidgetState();
}

class _NosProduitsWidgetState extends State<NosProduitsWidget> {
  int currentIndex = 0;

  // === Données simulées ===
  final List<Map<String, dynamic>> produitsVente = [
    {
      'image': 'assets/images/maison1.jpg',
      'description': 'Belle maison moderne avec jardin',
      'prix': '45 000 000 FCFA',
    },
    {
      'image': 'assets/images/app1.jpg',
      'description': 'Appartement spacieux au centre-ville',
      'prix': '30 000 000 FCFA',
    },
    {
      'image': 'assets/images/studio1.jpg',
      'description': 'Petit studio idéal pour étudiant',
      'prix': '10 000 000 FCFA',
    },
  ];

  final List<Map<String, dynamic>> produitsLocation = [
    {
      'image': 'assets/images/maison2.jpg',
      'description': 'Maison à louer à Dakar',
      'prix': '250 000 FCFA / mois',
    },
    {
      'image': 'assets/images/app2.jpg',
      'description': 'Appartement 3 chambres à Mermoz',
      'prix': '350 000 FCFA / mois',
    },
    {
      'image': 'assets/images/studio2.jpg',
      'description': 'Studio meublé à louer à Pikine',
      'prix': '120 000 FCFA / mois',
    },
    {
      'image': 'assets/images/studio3.jpg',
      'description': 'Appartement moderne à Sicap',
      'prix': '400 000 FCFA / mois',
    },
    {
      'image': 'assets/images/villa.jpg',
      'description': 'Villa avec piscine à Yoff',
      'prix': '800 000 FCFA / mois',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final produits = widget.selectedType == 'vente'
        ? produitsVente
        : produitsLocation;
    final produit = produits[currentIndex];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Nos Produits",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 20),

          // === Image ===
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: ClipRRect(
              key: ValueKey(produit['image']),
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                produit['image'],
                height: 400, // 🔹 Augmenté pour une image plus grande
                width: double.infinity,
                fit: BoxFit.cover, // Garde l’image bien remplie
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          Text(
            produit['description'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            produit['prix'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 20),

          // === Flèches de navigation ===
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: currentIndex > 0
                    ? () => setState(() => currentIndex--)
                    : null,
                icon: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
              ),
              IconButton(
                onPressed: currentIndex < produits.length - 1
                    ? () => setState(() => currentIndex++)
                    : null,
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.indigo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
