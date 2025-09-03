import 'package:flutter/material.dart';

import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/guide_entity.dart';

class GuidanceCard extends StatelessWidget {
  final GuideEntity guide;
  const GuidanceCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flag status banner
            _buildFlagBanner(context, guide.flag),

            const SizedBox(height: 12),

            // Self-Care Steps
            Text(l10n.selfCareSteps,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (final step in guide.selfCare) _bullet(step),

            const SizedBox(height: 12),

            // OTC Relief Options
            Text(l10n.otcReliefOptions,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (final item in guide.otc) _bullet(item),

            const SizedBox(height: 12),

            // Seek Medical Care
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.seekMedicalCareIf,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  const SizedBox(height: 6),
                  for (final warning in guide.medical)
                    Text('• $warning',
                        style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Text('• '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildFlagBanner(BuildContext context, String flag) {
    final l10n = AppLocalizations.of(context)!;
    Color bg;
    String text;

    switch (flag.toUpperCase()) {
      case 'RED':
        bg = Colors.red;
        text = l10n.flagRed; // localized
        break;
      case 'YELLOW':
        bg = const Color(0xFFF59E0B);
        text = l10n.flagYellow; // localized
        break;
      case 'GREEN':
        bg = Colors.green;
        text = l10n.flagGreen; // localized
        break;
      default:
        bg = Colors.grey;
        text = l10n.flagGeneral; // localized
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          const Icon(Icons.circle, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
