import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:incube/amplifyconfiguration.dart';
import 'package:incube/home/home.dart';
import 'route.dart';
import 'package:incube/authentication/auth.dart';
import 'package:incube/authentication/login.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  final datastorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);

  await Amplify.addPlugin(datastorePlugin);
  try {
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
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
