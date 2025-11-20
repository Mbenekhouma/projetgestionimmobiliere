import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onSelect;

  const CategoryWidget({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'id': 'maison', 'name': 'Maison', 'icon': '🏠', 'count': 245},
      {'id': 'appartement', 'name': 'Appartement', 'icon': '🏢', 'count': 182},
      {'id': 'studio', 'name': 'Studio', 'icon': '🏘️', 'count': 98},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Catégories",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),

          // Grille flexible : chaque carte garde la même taille et remplit la largeur
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 colonnes
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1, // même largeur et hauteur
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = selectedCategory == cat['id'];

              return GestureDetector(
                onTap: () => onSelect(cat['id'] as String),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.indigo.shade50 : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? Colors.indigo.withOpacity(0.3)
                            : Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(cat['icon'], style: const TextStyle(fontSize: 36)),
                      const SizedBox(height: 6),
                      Text(
                        cat['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${cat['count']} biens",
                        style: const TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
