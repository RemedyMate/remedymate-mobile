import 'package:flutter/material.dart';
import 'package:remedy_mate/core/l10n/arb/app_localizations.dart';
import 'package:remedy_mate/core/navigation/app_router.dart'; // <-- IMPORT THE ROUTER

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RemedyMate',

     
      routerConfig: router,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}