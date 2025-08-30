import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;
import 'features/Chatbot/presentation/bloc/chatbot_bloc.dart';
import 'features/Chatbot/presentation/pages/chat.dart';

void main() {
  di.init(); // initialize DI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotBloc(chatUseCase: di.sl()),
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
