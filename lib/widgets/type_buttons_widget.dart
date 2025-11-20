import 'package:flutter/material.dart';

class TypeButtonsWidget extends StatelessWidget {
  final String selectedType;
  final Function(String) onChange;

  const TypeButtonsWidget({
    super.key,
    required this.selectedType,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(context, 'vente', Icons.vpn_key, 'Vente'),
        const SizedBox(width: 12, height: 100),
        _buildButton(context, 'location', Icons.home, 'Location'),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String type,
    IconData icon,
    String label,
  ) {
    final isSelected = selectedType == type;
    return ElevatedButton.icon(
      onPressed: () => onChange(type),
      icon: Icon(icon, color: isSelected ? Colors.white : Colors.grey[700]),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.indigo : Colors.white,
        shape: const StadiumBorder(),
        side: const BorderSide(color: Colors.indigo),
      ),
    );
  }
}
