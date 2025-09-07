import 'package:flutter/material.dart';

import '../../domain/entities/offline_topic_entity.dart';
import '../widget/guide_card.dart';

class OfflineLibraryDetailPage extends StatelessWidget {
  final OfflineTopicEntity offline;
  const OfflineLibraryDetailPage({required this.offline,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(offline.englishName),),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: GuidanceCard(guide: offline.translations.en),
      ) 
      
    );
        
  }
   
}




