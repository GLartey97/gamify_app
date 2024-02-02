import 'package:flutter/material.dart';
import 'package:gamify_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gamify App",
      theme: ThemeData(brightness: Brightness.dark),
      home: const Homepage(),
    );
  }
}
