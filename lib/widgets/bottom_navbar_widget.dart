import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_imobiliere/screens/home_screen.dart';
import '../screens/home_screen.dart';

class BottomNavbarWidget extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const BottomNavbarWidget({
    super.key,
    required this.activeTab,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 8,
      currentIndex: _getIndex(activeTab),
      onTap: (index) {
        onTabChange(_getTab(index));
      },
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Accueil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: "Produits",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: "Recherche",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "Profil",
        ),
      ],
    );
  }

  int _getIndex(String tab) {
    switch (tab) {
      case 'produits':
        return 1;
      case 'recherche':
        return 2;
      case 'profil':
        return 3;
      default:
        return 0;
    }
  }

  String _getTab(int index) {
    switch (index) {
      case 1:
        return 'produits';
      case 2:
        return 'recherche';
      case 3:
        return 'profil';
      default:
        return 'accueil';
    }
  }
}
