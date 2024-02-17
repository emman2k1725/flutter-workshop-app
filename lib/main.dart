import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const MyApp());
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
        home: const LoginPage());
  }
}
