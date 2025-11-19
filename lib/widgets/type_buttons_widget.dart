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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildButton(context, 'vente', Icons.sell, 'Vente')),
          const SizedBox(width: 16),
          Expanded(child: _buildButton(context, 'location', Icons.home_work, 'Location')),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String type, IconData icon, String label) {
    final isSelected = selectedType == type;

    return SizedBox(
      height: 45,
      child: ElevatedButton.icon(
        onPressed: () => onChange(type),
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.indigo,
          size: 22,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.indigo,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.indigo : Colors.white,
          elevation: isSelected ? 4 : 0,
          shadowColor: Colors.black26,
          side: BorderSide(color: Colors.indigo.shade300, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
