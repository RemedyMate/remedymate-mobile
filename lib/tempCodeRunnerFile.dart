// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/cache/cache_store.dart';
import 'dependency_injection.dart'; // where GetIt is initialized
import 'features/chatbot/data/models/message_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Hive, adapters, and GetIt
  await init();

  // Get the HiveCacheStore from GetIt
  final chatCache = sl<CacheStore<String, List<MessageModel>>>();

  // Add messages to session1
  await chatCache.addMessage('session1', [
    MessageModel(
      id: '1',
      content: 'Hello How can I help you today?',
      timeStamp: DateTime.now(),
      isUser: false,
    ),
  ]);

   await chatCache.addMessage('session1', [
    MessageModel(
      id: '2',
      content: 'How are you?',
      timeStamp: DateTime.now(),
      isUser: true,
    ),
  ]);

  // Retrieve messages for session1
  final messages = await chatCache.get('session1');

  debugPrint('Messages in session1:');
  if (messages != null) {
    for (var msg in messages) {
      debugPrint('${DateFormat.Hms().format(msg.timeStamp)}: ${msg.content}');
    }
  }

  // Remove a message by id (optional)
  await chatCache.removeMessage('session1', '1');

  // Clear all messages in a session (optional)
  // await chatCache.clearMessages('session1');
}
