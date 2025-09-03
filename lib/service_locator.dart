import 'package:intl/intl.dart';

import 'core/cache/cache_store.dart';
import 'dependency_injection.dart';
import 'features/chatbot/data/models/message_model.dart';

Future<void> main() async {
  await init();

  final chatCache = sl<CacheStore<String, List<MessageModel>>>();

  // Add a message to a session
  await chatCache.addMessage(
    'session1',
    MessageModel(
      id: '1',
      content: 'Hello Sabona!',
      timeStamp: DateTime.now(),
      isUser: false,
    ) as List<MessageModel>, // your HiveCacheStore requires V
  );

  // Add another message
  await chatCache.addMessage(
    'session1',
    MessageModel(
      id: '2',
      content: 'How are you?',
      timeStamp: DateTime.now(),
      isUser: true,
    ) as List<MessageModel>,
  );

  // Retrieve messages for a session
  final messages = await chatCache.get('session1');

  print('Messages in session1:');
  if (messages != null) {
    for (var msg in messages) {
      print('${DateFormat.Hms().format(msg.timeStamp)}: ${msg.content}');
    }
  }

  // Remove a message by id
  await chatCache.removeMessage('session1', '1');

  // Clear all messages in a session
  // await chatCache.clearMessages('session1');
}
