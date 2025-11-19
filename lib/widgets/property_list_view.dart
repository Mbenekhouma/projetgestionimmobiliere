import 'package:flutter/material.dart';
import '../models/property_model.dart';
import 'propertycard.dart';

class PropertyListView extends StatelessWidget {
  final List<PropertyModel> properties;
  final Function(PropertyModel) onEdit;
  final Function(PropertyModel) onDelete;

  const PropertyListView({
    Key? key,
    required this.properties,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) {
      return Center(
        child: Text(
          'Aucun bien trouvé',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return PropertyCard(
          property: properties[index],
          onEdit: () => onEdit(properties[index]),
          onDelete: () => onDelete(properties[index]),
        );
      },
    );
  }
}
