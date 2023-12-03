import 'package:flutter/material.dart';
import 'package:incube/home/home.dart';
import 'route.dart';
import 'package:incube/authentication/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:incube/authentication/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBcb-5I5nzJ8CO_gtYuyl1y7HF-ODPzAAI",
    appId: "1:931432761517:web:a4352e9cf4a0a9bc611e24",
    messagingSenderId: "931432761517",
    projectId: "incubeweb-ed03b",
    storageBucket: "incubeweb-ed03b.appspot.com",
  ));
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
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const Home(),
      },
    );
  }
}
