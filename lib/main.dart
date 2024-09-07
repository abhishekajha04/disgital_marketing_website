import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:speeder_website/Utills/utils.dart';
import 'package:speeder_website/admin_panel/admin_login_page.dart';
import 'package:speeder_website/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDoV27pz_ykFnEN4A4KYJ7qPH321-jD6oM",
    projectId: "speeder-85d2f",
    messagingSenderId: "357514192414",
    appId: "1:357514192414:web:e0417d2bfaf1ce29f5700f",
  ));
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
      initialRoute: "/",
      routes: {
        "/": (context) {
          return const HomePage();
        },
        "/admin": (context) {
          return const AdminLoginPage();
        }
      },
    );
  }
}
