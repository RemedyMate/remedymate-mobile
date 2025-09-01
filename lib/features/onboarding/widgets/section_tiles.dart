import 'package:flutter/material.dart';

/// Section Title Widget
Widget sectionTitle(String title, double fontSize) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    ),
  );
}

/// Accepts a textStyle for dynamic font sizing
Widget buildTile(
  IconData icon,
  String title,
  String subtitle, {
  Color? textColor,
  Color? iconColor,
  VoidCallback? onTap,
  required TextStyle textStyle,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(icon, color: iconColor ?? Colors.grey.shade700),
    title: Text(
      title,
      style: textStyle.copyWith(
        fontWeight: FontWeight.w500,
        color: textColor ?? Colors.black,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: const TextStyle(fontSize: 13, color: Colors.grey),
    ),
    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    onTap: onTap ?? () => debugPrint("$title clicked"),
  );
}

/// Switch List Tile
Widget switchTile(
  IconData icon,
  String title,
  String subtitle,
  bool value,
  ValueChanged<bool> onChanged, {
  double? fontSize,
}) {
  return SwitchListTile(
    contentPadding: EdgeInsets.zero,
    secondary: Icon(icon, color: Colors.grey.shade700),
    title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize)),
    subtitle: Text(
      subtitle,
      style: const TextStyle(fontSize: 13, color: Colors.grey),
    ),
    value: value,
    onChanged: onChanged,
  );
}

/// Text Size Option Tile
Widget textSizeTile({
  required String selectedSize,
  required Function(String) onChanged,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(Icons.text_fields, color: Colors.grey.shade700),
    title: const Text(
      "Text Size",
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle: const Text(
      "Adjust readability",
      style: TextStyle(fontSize: 13, color: Colors.grey),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        sizeChip("Small", selectedSize, onChanged),
        const SizedBox(width: 6),
        sizeChip("Medium", selectedSize, onChanged),
        const SizedBox(width: 6),
        sizeChip("Large", selectedSize, onChanged),
      ],
    ),
  );
}

/// Size Chip for text size selection
Widget sizeChip(String label, String selectedSize, Function(String) onChanged) {
  final selected = selectedSize == label;
  return GestureDetector(
    onTap: () {
      onChanged(label);
      debugPrint("Text size changed: $label");
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade900 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

/// Optional: Global function for language toggle.
/// Assign from your SettingPage if needed
void Function()? toggleLanguageFunc;
