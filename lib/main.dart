import 'package:flutter/material.dart';
import 'package:remedy_mate/dependency_injection.dart' as di; // Use a prefix

import 'app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const App());
}