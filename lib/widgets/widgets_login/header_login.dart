import 'package:flutter/material.dart';

PreferredSizeWidget buildHeader(
  Color mainColor,
  TabController controller,
  BuildContext context,
) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 3,
    toolbarHeight: 75,

    automaticallyImplyLeading:
        false, // 🔥 Enlève la flèche automatique à gauche

    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // === MENU À GAUCHE
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey),
          onPressed: () {},
        ),

        // === LOGO CENTRÉ (comme HeaderWidget)
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cercle du logo
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "SenImmo",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),

        // === FLECHE RETOUR À DROITE
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),

    // === TABBAR
    bottom: TabBar(
      controller: controller,
      indicatorColor: mainColor,
      labelColor: mainColor,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: "Connexion"),
        Tab(text: "Inscription"),
      ],
    ),
  );
}
