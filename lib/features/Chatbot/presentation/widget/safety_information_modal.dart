import 'package:flutter/material.dart';

class SafetyInformationModal extends StatelessWidget {
  const SafetyInformationModal({super.key});

  static const List<String> _safetyTexts = [
    'RemedyMate is an AI-powered health information tool designed to provide general guidance only.',
    'This app does NOT replace professional medical advice, diagnosis, or treatment.',
    'Always consult with qualified healthcare providers for medical concerns.',
    'In emergencies, call local emergency services immediately.',
  ];

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SafetyInformationModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCloseButton(context),
            const SizedBox(height: 10),
            const Text(
              'Important Safety Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            ..._safetyTexts.map(
              (text) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(text, style: const TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            _buildUnderstandButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildUnderstandButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 13, 42, 73),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'I Understand',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
