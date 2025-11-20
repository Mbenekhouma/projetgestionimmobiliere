import 'package:flutter/material.dart';
import '../models/property_model.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({Key? key}) : super(key: key);

  @override
  State<AddPropertyPage> createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController surfaceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter une propriété")),
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
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleController.text,
                    address: addressController.text,
                    price: double.tryParse(priceController.text) ?? 0,
                    type: typeController.text,
                    surface: int.tryParse(surfaceController.text) ?? 0,
                    imageUrl: null,
                  ),
                );
              },
              child: const Text("Ajouter"),
            ),
          ],
        ),
      ),
    );
  }
}
