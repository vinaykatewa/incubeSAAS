// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/organizations/organization.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:incube/route.dart';
import 'package:provider/provider.dart';
import '../AmplifyFuntions/AwsAmplify.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFb5454fb),
                Color(0xFF000649),
              ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: GoogleFonts.roboto(
                        fontSize: 57,
                        fontWeight: FontWeight.w400,
                        height: 1.1228070175,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Text(
                      'Incube',
                      style: GoogleFonts.roboto(
                        fontSize: 57,
                        fontWeight: FontWeight.w600,
                        height: 1.1228070175,
                        color: Color(0xffffffff),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(flex: 7, child: Login_Frame())
          ],
        ),
      ),
    );
  }
}

class Login_Frame extends StatefulWidget {
  const Login_Frame({super.key});

  @override
  State<Login_Frame> createState() => _Login_FrameState();
}

class _Login_FrameState extends State<Login_Frame> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding:
          EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.1),
      decoration: BoxDecoration(
          color: tertiaryColor1(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusAuth()),
            bottomLeft: Radius.circular(borderRadiusAuth()),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.roboto(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    height: 1.1555555556,
                    color: Color(0xff1e1e1e),
                  ),
                ),
                Text(
                  'Create account to access incube',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4285714286,
                    color: Color.fromRGBO(30, 30, 30, 0.800000011920929),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          LoginForm(),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: GestureDetector(
              onTap: () {
                // Handle the click event, e.g., navigate to the login screen
                Navigator.popAndPushNamed(context, AppRoutes.auth);
              },
              child: RichText(
                text: TextSpan(
                  style: LabelSmall().copyWith(
                      color:
                          const Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                  children: [
                    TextSpan(
                      text: 'Dont have an account ',
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: LabelMedium().copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64.03,
                  height: 1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                ),
                SizedBox(width: screenWidth * 0.007),
                Text(
                  'Or',
                  style: LabelSmall().copyWith(
                      color:
                          const Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                ),
                SizedBox(width: screenWidth * 0.007),
                Container(
                  width: 64.03,
                  height: 1,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Center(
            child: Container(
              height: screenHeight * 0.06,
              padding: EdgeInsets.all(screenWidth * 0.005),
              width: screenWidth * 0.15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
                borderRadius: BorderRadius.circular(borderRadiusAuth()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.007),
                    child: Image.asset(
                      'assets/google-logo-auth-screen.png',
                    ),
                  ),
                  Text('Sign up with Google',
                      style: LabelSmall().copyWith(
                          color: const Color.fromRGBO(
                              30, 30, 30, 0.800000011920929))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final authFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isLoading = false;
  final awsFunction = AwsIncube();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    Future<void> getUserData(String email) async {
      safePrint('getUserData method is running in login class');
      try {
        final queryPredicate = userInfo.EMAIL.eq(email);

        final request = ModelQueries.list<userInfo>(
          userInfo.classType,
          where: queryPredicate,
        );
        final response = await Amplify.API.query(request: request).response;
        final _user = response.data?.items.first;
        if (_user != null) {
          _incubeProvider.userId = _user.userUid;
          _incubeProvider.userName = _user.userName;
          _incubeProvider.email = _user.email;
          _incubeProvider.imageFile = _user.imageUrl;
          _incubeProvider.isAdmin = _user.isadmin!;

          _incubeProvider.organizationId = _user.organizationId!;
          _incubeProvider.superAdmin = _user.superAdminId!;
          _incubeProvider.requestStatus = _user.requestStatus!;
          _incubeProvider.teamId = _user.teamId!;
          _incubeProvider.isteamLeader = _user.isteamLeader!;

          safePrint('we have set the provider details of the user');
          safePrint('this is the userId:' + _incubeProvider.userId);
          safePrint('this is the userName:' + _incubeProvider.userName);
          safePrint('this is the email:' + _incubeProvider.email);
          safePrint('this is the imageFile:' + _incubeProvider.imageFile);
          safePrint(
              'this is the isAdmin:' + _incubeProvider.isAdmin.toString());
          safePrint(
              'this is the organizationId:' + _incubeProvider.organizationId);
          safePrint('this is the superAdmin:' + _incubeProvider.superAdmin);
          safePrint(
              'this is the requestStatus:' + _incubeProvider.requestStatus);
          safePrint('this is the teamId:' + _incubeProvider.teamId);
          safePrint('this is the isTeamLeader:' +
              _incubeProvider.isteamLeader.toString());
        } else {
          safePrint(
              'we got the null value from user while running getUserData in login class');
        }
      } catch (e) {
        safePrint('getOrganizationsByAdminId is giving error' + e.toString());
      }
      return null;
    }

    void submitForm() async {
      if (authFormKey.currentState!.validate()) {
        await awsFunction.login(email, password).whenComplete(() async {
          await getUserData(email).whenComplete(() {
            if (_incubeProvider.isAdmin) {
              Navigator.popAndPushNamed(context, AppRoutes.home);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => OrganizationPage(
                          fromLogin: true,
                        )),
              );
            }
          });
        });
      }
    }

    return Form(
      key: authFormKey,
      child: Column(
        children: [
          // Row 2
          Container(
            height: screenHeight * 0.06,
            width: screenWidth * 0.31,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter email";
                } else if (!value.contains('@gmail.com')) {
                  return "Enter valid email";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email id',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.4285714286,
                  color: Color(0x7c1e1e1e),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                  borderRadius: BorderRadius.circular(borderRadiusAuth()),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                  borderRadius: BorderRadius.circular(borderRadiusAuth()),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          //Row 4
          Container(
            width: screenWidth * 0.31,
            height: screenHeight * 0.06,
            child: TextFormField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.4285714286,
                  color: Color(0x7c1e1e1e),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                  borderRadius: BorderRadius.circular(borderRadiusAuth()),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                  borderRadius: BorderRadius.circular(borderRadiusAuth()),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          //Row 5
          SizedBox(height: screenHeight * 0.02),
          // Row 5 - Elevated Button
          Container(
            width: screenWidth * 0.31,
            height: screenHeight * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusAuth()),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFb5454fb),
                    Color(0xFF000649),
                  ]),
            ),
            child: ElevatedButton(
              onPressed: submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusAuth()),
                ),
                elevation: 2,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.006, bottom: screenWidth * 0.006),
                child: Text(
                  'LOGIN',
                  style: LabelMedium().copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
