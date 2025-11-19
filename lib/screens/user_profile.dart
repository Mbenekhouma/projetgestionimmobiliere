import 'package:flutter/material.dart';
import '../models/property_model.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/user_profile_header.dart';
import '../widgets/search_and_add_bar.dart';
import '../widgets/property_list_view.dart';
import 'home_screen.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}


class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _searchController = TextEditingController();


  String activeTab = 'accueil';
  String selectedType = 'vente';
  String selectedCategory = '';

  List<PropertyModel> _properties = [
    PropertyModel(
      id: '1',
      title: 'Appartement moderne',
      address: 'Dakar, Plateau',
      price: 150000,
      type: 'Appartement',
      surface: 70,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    PropertyModel(
      id: '2',
      title: 'Maison familiale',
      address: 'Dakar, Mermoz',
      price: 250000,
      type: 'Maison',
      surface: 120,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    PropertyModel(
      id: '3',
      title: 'Studio cosy',
      address: 'Dakar, Almadies',
      price: 90000,
      type: 'Studio',
      surface: 35,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  List<PropertyModel> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    _filteredProperties = _properties;
  }

  void _filterProperties(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProperties = _properties;
      } else {
        _filteredProperties = _properties
            .where((p) =>
        p.title.toLowerCase().contains(query.toLowerCase()) ||
            p.address.toLowerCase().contains(query.toLowerCase()) ||
            p.type.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addProperty() {
    setState(() {
      final newProperty = PropertyModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: "Nouvelle propriété",
        address: "Adresse inconnue",
        price: 100000,
        type: "Appartement",
        surface: 50,
        imageUrl: null,
      );
      _properties.add(newProperty);
      _filteredProperties = _properties;
    });
  }

  void _editProperty(PropertyModel property) {
    // Exemple simple
    setState(() {
      final index = _properties.indexWhere((p) => p.id == property.id);
      if (index != -1) {
        _properties[index] = PropertyModel(
          id: property.id,
          title: "${property.title} (modifié)",
          address: property.address,
          price: property.price,
          type: property.type,
          surface: property.surface,
          imageUrl: property.imageUrl,
        );
      }
      _filteredProperties = _properties;
    });
  }

  void _deleteProperty(PropertyModel property) {
    setState(() {
      _properties.removeWhere((p) => p.id == property.id);
      _filteredProperties = _properties;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Profil')),
      body: Column(
        children: [
          UserProfileHeader(
            userName: 'Jean Dupont',
            userEmail: 'jean@hotmail.com',
            propertiesCount: _properties.length,
          ),
          SearchAndAddBar(
            searchController: _searchController,
            onSearchChanged: _filterProperties,
            onAddPressed: _addProperty,
          ),
          Expanded(
            child: PropertyListView(
              properties: _filteredProperties,
              onEdit: _editProperty,
              onDelete: _deleteProperty,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbarWidget(
        activeTab: activeTab,
        onTabChange: (tab) {
          if (tab == 'accueil') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            setState(() {
              activeTab = tab;
            });
          }
        },
      ),

    );
  }
}

