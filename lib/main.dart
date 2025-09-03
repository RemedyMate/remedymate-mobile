import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'core/cache/cache_store.dart';
import 'dependency_injection.dart'; // GetIt initialization
import 'features/chatbot/data/models/message_model.dart';
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'features/chatbot/presentation/pages/chat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependencies, Hive, adapters, and GetIt
    await init();

    // Example: Using Hive cache to pre-fill messages
    final chatCache = sl<CacheStore<String, List<MessageModel>>>();

    await chatCache.addMessage('session1', [
      MessageModel(
        id: '1',
        content: 'Hello, how can I help you today?',
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

    final messages = await chatCache.get('session1');
    if (messages != null) {
      print('Messages in session1:');
      for (var msg in messages) {
        print('${DateFormat.Hms().format(msg.timeStamp)}: ${msg.content}');
      }
    }

    runApp(const MyApp());
  } catch (e) {
    // Fallback if initialization fails
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Failed to initialize app. Please restart.'),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatbotBloc(startChatUseCase: sl<StartChatUseCase>())
            ..add(LoadChatSessions()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatBot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SymptomCheckerPage(),
      ),
    );
  }
}
