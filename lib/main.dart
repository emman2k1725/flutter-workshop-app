import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Threads',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
        ),
        home: const BottomNavbar());
  }
}
