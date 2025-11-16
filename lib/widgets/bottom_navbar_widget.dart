import 'package:flutter/material.dart';

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
      currentIndex: _getIndex(activeTab),
      onTap: (index) => onTabChange(_getTab(index)),
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
        BottomNavigationBarItem(icon: Icon(Icons.house), label: "Location"),
        BottomNavigationBarItem(icon: Icon(Icons.vpn_key), label: "Vente"),
      ],
    );
  }

  int _getIndex(String tab) {
    switch (tab) {
      case 'recherche':
        return 1;
      case 'location':
        return 2;
      case 'vente':
        return 3;
      default:
        return 0;
    }
  }

  String _getTab(int index) {
    switch (index) {
      case 1:
        return 'recherche';
      case 2:
        return 'location';
      case 3:
        return 'vente';
      default:
        return 'accueil';
    }
  }
}
