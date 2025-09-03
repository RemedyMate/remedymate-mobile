import 'package:flutter/material.dart';
import 'core/l10n/arb/app_localizations.dart';
import 'core/navigation/app_router.dart'; 

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