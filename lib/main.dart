import 'package:flutter/material.dart';
import 'package:incube/home/home.dart';
import 'route.dart';
import 'package:incube/authentication/auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAwXPyqjhn-KU0gG43X5FRhRCp6TJINMlA',
          appId: "1:53573072205:web:cde06ae4eedd7b30963304",
          messagingSenderId: "53573072205",
          projectId: "incube-2948b"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incube',
      initialRoute: AppRoutes.auth,
      routes: {
        AppRoutes.auth: (context) => const AuthScreen(),
        AppRoutes.home: (context) => const Home(),
      },
    );
  }
}
