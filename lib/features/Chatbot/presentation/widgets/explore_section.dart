import 'package:flutter/material.dart';
import 'package:remedy_mate/core/constants/app_text_styles.dart';
import 'package:remedy_mate/core/l10n/arb/app_localizations.dart'; // Import l10n

class ExploreSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String>? onItemTap; // <-- ADD THIS

  const ExploreSection({
    super.key,
    required this.title,
    required this.items,
    this.onItemTap, // <-- ADD THIS
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Helper to translate keys. You might want to move this to a shared location.
    String translateKey(String key) {
      // This is a simple implementation. A real app might use a map or a more robust method.
      switch (key) {
        case "popularTopicCold": return l10n.popularTopicCold;
        case "popularTopicHeadache": return l10n.popularTopicHeadache;
        case "popularTopicHeartburn": return l10n.popularTopicHeartburn;
        case "popularTopicMotionSickness": return l10n.popularTopicMotionSickness;
        default: return key;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: items.map((itemKey) {
              return GestureDetector( 
                onTap: () => onItemTap?.call(itemKey), 
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(translateKey(itemKey)), 
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}