import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAT_J9ZXhlyDDkJpLIg0reb0ZeugHPZqaw",
              appId: "1:648058389156:android:1ef362be9e119ba8e15c31",
              messagingSenderId: "648058389156",
              projectId: "andale-flutter-workshop"))
      : await Firebase.initializeApp();
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
        home: const LoginPage());
  }
}
