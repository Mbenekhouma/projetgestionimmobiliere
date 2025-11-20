import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavbarWidget extends StatelessWidget {
  final String activeTab;
  final FocusNode? searchFocusNode;

  const BottomNavbarWidget({
    super.key,
    required this.activeTab,
    this.searchFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 8,
      currentIndex: _getIndex(activeTab),
      onTap: (index) {
        final tab = _getTab(index);

        switch (tab) {
          case 'accueil':
            if (ModalRoute.of(context)?.settings.name != '/home') {
              context.go('/home');
            }
            break;
          case 'produits':
            if (ModalRoute.of(context)?.settings.name != '/produits/vente') {
              context.go('/produits/vente');
            }
            break;
          case 'recherche':
            if (ModalRoute.of(context)?.settings.name != '/home') {
              context.go('/home');
            }
            if (searchFocusNode != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                searchFocusNode!.requestFocus();
              });
            }
            break;
          case 'profil':
            if (ModalRoute.of(context)?.settings.name != '/profil') {
              context.go('/profil');
            }

            break;
        }
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
        return 0; // Accueil
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