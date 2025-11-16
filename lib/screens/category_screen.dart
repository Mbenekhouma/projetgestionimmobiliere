import 'package:flutter/material.dart';
import 'package:projetgestionimmobilier/screens/bien_screen.dart';
import 'package:projetgestionimmobilier/widgets/header_widget.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final biens = [
      {'image': 'assets/images/app2.jpg', 'description': 'Belle maison moderne avec jardin', 'prix': '45 000 000 FCFA', 'categorie': 'maison', 'superficie': '250 m²', 'chambres': 4},
      {'image': 'assets/images/app1.jpg', 'description': 'Appartement spacieux au centre-ville', 'prix': '30 000 000 FCFA', 'categorie': 'appartement', 'superficie': '120 m²', 'chambres': 3},
      {'image': 'assets/images/studio1.jpg', 'description': 'Petit studio idéal pour étudiant', 'prix': '10 000 000 FCFA', 'categorie': 'studio', 'superficie': '35 m²', 'chambres': 1},
    ].where((b) => b['categorie'] == category).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.indigo, Colors.white]),
                boxShadow: [BoxShadow(color: Color(0xFF6C63FF).withOpacity(0.3), blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                    child: Icon(category == 'maison' ? Icons.home : category == 'appartement' ? Icons.apartment : Icons.meeting_room, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Text('${category[0].toUpperCase()}${category.substring(1)}s', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: biens.length,
                itemBuilder: (context, index) {
                  final bien = biens[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15, offset: Offset(0, 5))],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                              child: Image.asset('${bien['image']}', width: double.infinity, height: 180, fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(height: 180, color: Colors.grey[200], child: Icon(Icons.home, size: 60, color: Colors.grey[400]))),
                            ),
                            Positioned(
                              top: 12, right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
                                child: Text('${category[0].toUpperCase()}${category.substring(1)}', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${bien['description']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(Icons.square_foot, size: 18, color: Color(0xFF6C63FF)),
                                  const SizedBox(width: 6),
                                  Text('${bien['superficie']}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                  const SizedBox(width: 16),
                                  Icon(Icons.bed, size: 18, color: Color(0xFF6C63FF)),
                                  const SizedBox(width: 6),
                                  Text('${bien['chambres']}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${bien['prix']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50))),
                                  ElevatedButton(
                                    onPressed: () {
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BienScreen(bien: bien),
                                          ),
                                        );
                                      };
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      elevation: 0,
                                      );
                                      child: const Text('Détails', style: TextStyle(color: Colors.white));
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor:  Colors.indigo,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 0),
                                    child: const Text('Détails',style:const TextStyle( color:Colors.white)),
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
    );
  }
}