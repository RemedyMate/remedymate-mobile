import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_colors.dart';
import 'core/l10n/arb/app_localizations.dart';
import 'core/navigation/app_router.dart';
import 'dependency_injection.dart';
import 'features/chatbot/presentation/bloc/chatbot_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChatbotBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'RemedyMate',
        routerConfig: router(_changeLocale),
        locale: _locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: AppColors.background,
          canvasColor: AppColors.background,
        ),
      ),
    );
  }
}
