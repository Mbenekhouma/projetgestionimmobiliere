import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/type_buttons_widget.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/nos_produits_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'accueil';
  String selectedType = 'vente';
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),

              // === SECTION AVEC IMAGE DE BACKGROUND ===
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
                        color: Colors.white, // texte visible sur fond
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
                    SearchBarWidget(),
                    const SizedBox(height: 16),
                    TypeButtonsWidget(
                      selectedType: selectedType,
                      onChange: (type) => setState(() => selectedType = type),
                    ),
                  ],
                ),
              ),

              // === Fin du background ===
              const SizedBox(height: 20),
              CategoryWidget(
                selectedCategory: selectedCategory,
                onSelect: (id) => setState(() => selectedCategory = id),
              ),
              NosProduitsWidget(selectedType: selectedType),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbarWidget(
        activeTab: activeTab,
        onTabChange: (tab) => setState(() => activeTab = tab),
      ),
    );
  }
}
