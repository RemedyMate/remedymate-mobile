import 'package:flutter/material.dart';
import '../../domain/entities/guide_entity.dart';

class GuidanceCard extends StatelessWidget {
  final GuideEntity guide;
  const GuidanceCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
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
            _buildFlagBanner(guide.flag),

            const SizedBox(height: 12),

            // Self-Care Steps
            const Text('✔ Self-Care Steps',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            for (final step in guide.selfCare) _bullet(step),

            const SizedBox(height: 12),

            // OTC Relief Options
            const Text('💊 OTC Relief Options',
                style: TextStyle(fontWeight: FontWeight.bold)),
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
                  const Text('🚨 Seek Medical Care If',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  const SizedBox(height: 6),
                  for (final warning in guide.medical)
                    Text('• $warning', style: const TextStyle(color: Colors.red)),
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

  Widget _buildFlagBanner(String flag) {
    Color bg;
    String text;

    switch (flag.toUpperCase()) {
      case 'RED':
        bg = Colors.red;
        text = 'Critical — Seek immediate medical attention';
        break;
      case 'YELLOW':
        bg = const Color(0xFFF59E0B);
        text = 'Monitor closely\nWatch for worsening symptoms';
        break;
      case 'GREEN':
        bg = Colors.green;
        text = 'Mild symptoms — Safe to self-manage';
        break;
      default:
        bg = Colors.grey;
        text = 'General guidance';
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
