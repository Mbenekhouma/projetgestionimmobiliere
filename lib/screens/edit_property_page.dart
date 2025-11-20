import 'package:flutter/material.dart';
import '../models/property_model.dart';

class EditPropertyPage extends StatefulWidget {
  final PropertyModel property;

  const EditPropertyPage({Key? key, required this.property}) : super(key: key);

  @override
  State<EditPropertyPage> createState() => _EditPropertyPageState();
}

class _EditPropertyPageState extends State<EditPropertyPage> {
  late TextEditingController titleController;
  late TextEditingController addressController;
  late TextEditingController priceController;
  late TextEditingController surfaceController;
  late TextEditingController typeController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.property.title);
    addressController = TextEditingController(text: widget.property.address);
    priceController = TextEditingController(text: widget.property.price.toString());
    surfaceController = TextEditingController(text: widget.property.surface.toString());
    typeController = TextEditingController(text: widget.property.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modifier la propriété")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: "Titre")),
            TextField(controller: addressController, decoration: const InputDecoration(labelText: "Adresse")),
            TextField(controller: priceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Prix")),
            TextField(controller: surfaceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Surface")),
            TextField(controller: typeController, decoration: const InputDecoration(labelText: "Type")),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  PropertyModel(
                    id: widget.property.id,
                    title: titleController.text,
                    address: addressController.text,
                    price: double.tryParse(priceController.text) ?? widget.property.price,
                    type: typeController.text,
                    surface: int.tryParse(surfaceController.text) ?? widget.property.surface,
                    imageUrl: widget.property.imageUrl,
                  ),
                );
              },
              child: const Text("Sauvegarder"),
            )
          ],
        ),
      ),
    );
  }
}
