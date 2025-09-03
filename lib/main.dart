import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  try {
    di.init();
    runApp(const App());
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
