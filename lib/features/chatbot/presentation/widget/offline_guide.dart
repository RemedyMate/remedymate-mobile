import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/l10n/arb/app_localizations.dart';
import '../../domain/entities/offline_topic_entity.dart';
import '../pages/offline_detail_page.dart';

class OfflineAvailable extends StatelessWidget {
  const OfflineAvailable({
    super.key,
    required this.topic
  });

  final OfflineTopicEntity topic;

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
          topic.englishName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(topic.enDescription),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.greenTriage, size: 12),
                const SizedBox(width: 6),
                Text(
                  AppLocalizations.of(context)!.availableOffline,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OfflineLibraryDetailPage(
                offline: topic,
              ),
            ),
          );
        },
      ),
    );
  }
}
