import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'features/chatbot/presentation/pages/chat_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  try {
    di.init();
    runApp(const MyApp());
  } catch (e) {
    // Fallback in case dependency injection fails
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
      create: (context) => ChatbotBloc(startChatUseCase: di.sl<StartChatUseCase>())..add(LoadChatSessions()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatBot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ChatHistoryPage(),
      ),
    );
  }
}
