import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart' as di;
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependencies
    di.init();

    runApp(
      BlocProvider(
        create: (context) =>
            ChatbotBloc(startChatUseCase: di.sl<StartChatUseCase>())
              ..add(LoadChatSessions()),
        child: const App(), // Use your App widget for routing & theme
      ),
    );
  } catch (e) {
    // Fallback if DI fails
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
