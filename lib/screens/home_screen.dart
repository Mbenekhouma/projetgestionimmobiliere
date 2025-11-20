import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/type_buttons_widget.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/nos_produits_widget.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedType = 'vente';
  String selectedCategory = '';
  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print("🔥 HomeScreen build() appelé");
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: ListView(

          children: [
            const HeaderWidget(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fond3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                children: [
                  const Text(
                    "Trouvez votre bien idéal",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "chez SenImmo",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SearchBarWidget(focusNode: _searchFocusNode),
                  const SizedBox(height: 16),
                  TypeButtonsWidget(
                    selectedType: selectedType,
                    onChange: (type) => setState(() => selectedType = type),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CategoryWidget(
              selectedCategory: selectedCategory,
              onSelect: (id) {
                setState(() => selectedCategory = id);

                // Navigation vers la page CategoryScreen
                context.goNamed(
                  'category',                       // name de la route
                  pathParameters: {'category': id}, // on passe la catégorie
                );
              },
            ),

            NosProduitsWidget(selectedType: selectedType),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbarWidget(
        activeTab: 'accueil',
        //searchFocusNode: _searchFocusNode, // le focus sera géré directement dans BottomNavbarWidget
      ),
    );
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }
}