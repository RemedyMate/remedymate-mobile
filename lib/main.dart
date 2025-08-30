import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;
import 'features/chatbot/domain/usecases/get_guide_card.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'features/chatbot/presentation/pages/chat.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatbotBloc(startChatUseCase: di.sl<StartChatUseCase>()),
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
