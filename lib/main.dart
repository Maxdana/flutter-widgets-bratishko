
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppState appState = AppState();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Будинок «Слово»',
      home: HomeScreen(appState: appState),
    );
  }
}
