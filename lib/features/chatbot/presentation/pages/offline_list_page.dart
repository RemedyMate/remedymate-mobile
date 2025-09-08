import 'package:flutter/material.dart';

import '../widget/app_bar.dart';
import '../widget/offline_guide.dart';
import '../widget/offline_mock.dart';

class OfflineLibraryPage extends StatelessWidget {
  const OfflineLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = mockOfflineTopics;
    return Scaffold(
      appBar: const RemedyAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return OfflineAvailable(topic: topics[index]);
        },
      ),
    );
  }
}
