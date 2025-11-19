import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchBarWidget extends StatefulWidget {
  final FocusNode? focusNode; // Ajout du focusNode optionnel

  const SearchBarWidget({super.key, this.focusNode});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.indigo, size: 26),
          const SizedBox(width: 8),

          // === Champ de texte ===
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: widget.focusNode, // On utilise le FocusNode ici
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: "Rechercher une catégorie (ex: studio, maison...)",
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              onSubmitted: (value) => _goToSearch(context, value),
            ),
          ),

          // === Bouton recherche ===
          Container(
            height: size.height * 0.05,
            width: size.height * 0.05,
            decoration: const BoxDecoration(
              color: Colors.indigo,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 22),
              onPressed: () => _goToSearch(context, _controller.text),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ],
      ),
    );
  }

  // --- Navigation vers la page de résultats avec GoRouter ---
  void _goToSearch(BuildContext context, String query) {
    final value = query.trim();
    if (value.isEmpty) return;

    // Navigation via GoRouter avec query parameter "q"
    context.push('/search?q=$value');
  }
}
