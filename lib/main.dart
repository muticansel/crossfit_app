import 'package:flutter/material.dart';
import 'package:crossfit_app/views/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white), // Hint metin rengi beyaz
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
