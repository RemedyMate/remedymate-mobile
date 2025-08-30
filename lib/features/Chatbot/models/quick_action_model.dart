import 'package:flutter/material.dart';

class QuickActionModel {
  // We now store keys that will be used to look up the translated text.
  final String title;
  final String subtitle;
  final IconData icon;

  QuickActionModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}