import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../../../core/l10n/arb/app_localizations_am.dart';
import '../widget/app_bar.dart';
import '../widget/offline_guide.dart';

class OfflineLibraryPage extends StatelessWidget {
  const OfflineLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final guides = [
      {
        'title': 'Indigestion',
        'description':
            'Learn how to manage indigestion symptoms and when to seek medical care.',
      },
      {
        'title': 'Headache',
        'description':
            'Understand different types of headaches and effective management strategies.',
      },
      {
        'title': 'Fever',
        'description':
            'Learn how to manage fever symptoms and recognize when medical attention is needed.',
      },
      {
        'title': 'Cough',
        'description':
            'Understand different types of coughs and effective treatment methods.',
      },
    ];

    return Scaffold(
      appBar: const RemedyAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: guides.length,
        itemBuilder: (context, index) {
          final guide = guides[index];
          return OfflineAvailable(guide: guide);
        },
      ),
    );
  }
}



