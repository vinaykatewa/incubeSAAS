import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:incube/home/dealPipeline/dealDetails.dart';
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
      // initialRoute: AppRoutes.home,
      // // initialRoute: AppRoutes.auth,
      // routes: {
      //   AppRoutes.auth: (context) => const SignUpScreen(),
      //   AppRoutes.login: (context) => const LoginScreen(),
      //   AppRoutes.home: (context) => const Home(),
      // },
      home: DealDetails(
          deal: Deals(
              idDeal: "Ilbo1uIlsz47M6sPJRKvvwY0B3WNjRxNtF8nv4Mj5dr1rysWRA",
              teamId: "G9qeWQM9gGSAglqD59USBvqnxknHPzZCRSa0iS97bOTu4Ry8Cq",
              company_logo: "initial image path",
              company_name: "deal 1",
              company_description: "fintech",
              seeking: "50M",
              status: "open",
              calls: [
            DealsCall(
                tabName: "title 1",
                tabContentHeader: ["title: ", "description: "],
                tabContentBody: ["title 1", "description 1"]),
            DealsCall(
                tabName: "title 2",
                tabContentHeader: ["title: ", "description: "],
                tabContentBody: ["title 2", "description 2"]),
            DealsCall(
                tabName: "title 3",
                tabContentHeader: ["title: ", "description: "],
                tabContentBody: ["title 3", "description 3"]),
            DealsCall(
                tabName: "title 4",
                tabContentHeader: ["title: ", "description: "],
                tabContentBody: ["title 4", "description 4"])
          ])),
    );
  }
}
