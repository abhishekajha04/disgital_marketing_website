import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speeder Creative',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: hexToColor("#FFFFFF")),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
