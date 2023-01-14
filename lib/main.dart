import 'package:flutter/material.dart';
import 'package:mindforcare/src/pages/caregiver/homepage.dart';
import 'package:mindforcare/src/widgets/mainpage/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const bottomnavbar(),
      },

      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),debugShowCheckedModeBanner: false,
    );
  }
}
