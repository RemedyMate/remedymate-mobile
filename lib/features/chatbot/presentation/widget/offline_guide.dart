import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';

class OfflineAvailable extends StatelessWidget {
  const OfflineAvailable({
    super.key,
    required this.guide,
  });

  final Map<String, String> guide;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tileBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          guide['title']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
    
        },
      ),
    );
  }
}
