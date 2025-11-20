import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NosProduitsWidget extends StatefulWidget {
  final String selectedType; // "vente" ou "location"

  const NosProduitsWidget({super.key, required this.selectedType});

  @override
  State<NosProduitsWidget> createState() => _NosProduitsWidgetState();
}

class _NosProduitsWidgetState extends State<NosProduitsWidget> {
  int currentIndex = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> produitsVente = [
    {
      'image': 'assets/images/maison1.jpg',
      'description': 'Belle maison moderne avec jardin',
      'prix': '45 000 000 FCFA'
    },
    {
      'image': 'assets/images/app1.jpg',
      'description': 'Appartement spacieux au centre-ville',
      'prix': '30 000 000 FCFA'
    },
    {
      'image': 'assets/images/studio1.jpg',
      'description': 'Petit studio idéal pour étudiant',
      'prix': '10 000 000 FCFA'
    },
  ];

  final List<Map<String, dynamic>> produitsLocation = [
    {
      'image': 'assets/images/maison2.jpg',
      'description': 'Maison à louer à Dakar',
      'prix': '350 000 FCFA / mois'
    },
    {
      'image': 'assets/images/app2.jpg',
      'description': 'Appartement 3 chambres à Mermoz',
      'prix': '250 000 FCFA / mois'
    },
    {
      'image': 'assets/images/studio2.jpg',
      'description': 'Studio meublé à louer à Pikine',
      'prix': '120 000 FCFA / mois'
    },
    {
      'image': 'assets/images/studio3.jpg',
      'description': 'Appartement moderne à Sicap',
      'prix': '130 000 FCFA / mois'
    },
    {
      'image': 'assets/images/maison1.jpg',
      'description': 'Studio meuble très chic à Yoff',
      'prix': '15 000 000 FCFA / mois'
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    final produits = widget.selectedType == 'vente' ? produitsVente : produitsLocation;
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        currentIndex = (currentIndex + 1) % produits.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final produits = widget.selectedType == 'vente' ? produitsVente : produitsLocation;
    final produit = produits[currentIndex];
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
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
          const SizedBox(height: 16),

          // === Image avec animation ===
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: ClipRRect(
              key: ValueKey(produit['image']),
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                produit['image'],
                height: screenHeight * 0.28,
                width: double.infinity,
                fit: BoxFit.cover,
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
              height: 1.4,
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
          const SizedBox(height: 12),

          // === Points indicateurs à la place des flèches ===
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(produits.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 12 : 8,
                height: currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.indigo : Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // 🔹 Bouton "Voir plus" avec GoRouter
          ElevatedButton.icon(
            onPressed: () {
              context.push('/produits/${widget.selectedType}');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            label: const Text(
              "Voir plus",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}