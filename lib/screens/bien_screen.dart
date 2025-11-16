import 'package:flutter/material.dart';

class BienScreen extends StatelessWidget {
  final Map<String, dynamic> bien;

  const BienScreen({super.key, required this.bien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      appBar: AppBar(
        title: Text(
          bien['description'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image principale
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                bien['image'],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 80, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Informations principales
            Text(
              bien['description'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.category, color: Colors.indigo),
                const SizedBox(width: 6),
                Text(
                  bien['categorie'].toString().toUpperCase(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.square_foot, color: Colors.indigo),
                    const SizedBox(width: 6),
                    Text(bien['superficie']),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.bed, color: Colors.indigo),
                    const SizedBox(width: 6),
                    Text('${bien['chambres']} chambres'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            Text(
              bien['prix'],
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),

            // Bouton de contact
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // tu peux mettre ici la logique pour appeler ou envoyer un message
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.phone),
                label: const Text(
                  "Contacter l'agence",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
