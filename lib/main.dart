import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/onboarding/pages/setting_page.dart';
import 'generated/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // default locale

  // Callback to update the app's locale
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remedy Mate',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: S.supportedLocales, // <- Use this
      localizationsDelegates: const [
        S.delegate, // Generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SettingPage(onLocaleChanged: setLocale),
    );
  }
}
