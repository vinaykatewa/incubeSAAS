import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/dealsProvider.dart';
import 'package:incube/home/dashboard/ChartSheet/chartProvider.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/home/portfolioAnalytics/usersheets/userSheetProvider.dart';
import 'package:incube/home/portfolioAnalytics/usersheets/usersheets.dart';
import 'package:incube/provider.dart';
import 'package:provider/provider.dart';
import 'package:incube/amplifyconfiguration.dart';
import 'package:incube/home/home.dart';
import 'route.dart';
import 'package:incube/authentication/auth.dart';
import 'package:incube/authentication/login.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import './models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IncubeProvider()),
        ChangeNotifierProvider(create: (_) => DealDetailsProvider()),
        ChangeNotifierProvider(create: (_) => UserSheetProvider()),
        ChangeNotifierProvider(create: (_) => ChartsProvider()),
        ChangeNotifierProvider(create: (_) => DealsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugins([
      AmplifyAPI(modelProvider: ModelProvider.instance),
      AmplifyAuthCognito(),
      // AmplifyStorageS3(),
    ]);
    await Amplify.configure(amplifyconfig);
    safePrint('configured');
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
        AppRoutes.auth: (context) => const SignUpScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const Home(),
        AppRoutes.usersheets: (context) => const Usersheets()
      },
    );
  }
}
