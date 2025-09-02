import 'package:flutter/material.dart';

class QuickChip extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const QuickChip(this.label, {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Append text into TextField when clicked
        if (controller.text.isEmpty) {
          controller.text = label;
        } else {
          controller.text = '${controller.text} $label';
        }

        // Move cursor to end
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      },
      child: Chip(
        label: Text(label),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: -2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.grey.shade200,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
