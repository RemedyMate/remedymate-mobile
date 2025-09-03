// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dependency_injection.dart' as di;
// import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
// import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
// import 'features/chatbot/presentation/pages/chat.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize dependencies
//   try {
//     await di.init();
//     runApp(const MyApp());
//   } catch (e) {
//     // Fallback in case dependency injection fails
//     runApp(
//       const MaterialApp(
//         home: Scaffold(
//           body: Center(
//             child: Text('Failed to initialize app. Please restart.'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           ChatbotBloc(startChatUseCase: di.sl<StartChatUseCase>())
//             ..add(LoadChatSessions()),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'ChatBot',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: const SymptomCheckerPage(),
//       ),
//     );
//   }
// }

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

  print('Messages in session1:');
  if (messages != null) {
    for (var msg in messages) {
      print('${DateFormat.Hms().format(msg.timeStamp)}: ${msg.content}');
    }
  }

  // Remove a message by id (optional)
  await chatCache.removeMessage('session1', '1');

  // Clear all messages in a session (optional)
  // await chatCache.clearMessages('session1');
}
