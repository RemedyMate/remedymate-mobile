import 'package:flutter/material.dart';
import 'package:remedy_mate/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:remedy_mate/features/chatbot/presentation/bloc/bloc/chatbot_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ChatbotBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'ChatBot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      )
    );
    
  }
}
