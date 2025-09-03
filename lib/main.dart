import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/l10n/arb/app_localizations.dart';
import 'dependency_injection.dart' as di;
import 'features/chatbot/domain/usecases/start_chat_usecase.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';
import 'features/chatbot/presentation/pages/chat.dart';
import 'features/chatbot/presentation/pages/chat_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependencies
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // default locale

  void onLocaleChanged(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatbotBloc(startChatUseCase: di.sl<StartChatUseCase>())
            ..add(LoadChatSessions()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatBot',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        locale: _locale, // track locale changes
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        // Use onGenerateRoute to pass onLocaleChanged to pages
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) =>
                    SymptomCheckerPage(onLocaleChanged: onLocaleChanged),
              );
            case '/chatsession':
              return MaterialPageRoute(builder: (_) => const ChatHistoryPage());
            default:
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('Page not found')),
                ),
              );
          }
        },
      ),
    );
  }
}
