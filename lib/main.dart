import 'package:flutter/material.dart';
import 'components/bottom_navbar.dart';

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
          fontFamily: 'Roboto',
          useMaterial3: true,
        ),
        home: const BottomNavbar());
  }
}
