import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/authentication/emailConfermationScreen.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:incube/route.dart';
import 'package:provider/provider.dart';
import './userImage.dart';
import 'dart:typed_data';
import '../AmplifyFuntions/AwsAmplify.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            Expanded(flex: 7, child: Signup_Frame())
          ],
        ),
      ),
    );
  }
}

class Signup_Frame extends StatefulWidget {
  const Signup_Frame({super.key});

  @override
  State<Signup_Frame> createState() => _Signup_FrameState();
}

class _Signup_FrameState extends State<Signup_Frame> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SignUpForm(),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, AppRoutes.login);
              },
              child: RichText(
                text: TextSpan(
                  style: LabelSmall().copyWith(
                      color:
                          const Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                    ),
                    TextSpan(
                      text: 'Sign in',
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var checkBoxValue = false;
  final authFormKey = GlobalKey<FormState>();
  String user_Name = '';
  String email = '';
  String password = '';
  String organization_name = '';
  bool isLoading = false;
  String? selectedImage;
  final amplifyFunction = AwsIncube();
  void onImagePicked(String? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    void submitForm() async {
      if (checkBoxValue) {
        try {
          await amplifyFunction
              .signUpUser(password: password, email: email)
              .whenComplete(() {
            _incubeProvider.email = email;
            safePrint('this is the userName: ' + user_Name);
            _incubeProvider.userName = user_Name;
            safePrint('this is provider userName: ' + _incubeProvider.userName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => EmailConfirmationScreen(
                          email: email,
                          password: password,
                          imageFile: selectedImage!,
                        )));
          });
        } on AuthException catch (e) {
          safePrint('pushing to email confermation');
          safePrint(e.toString());
        }
      }
    }

    return Form(
      key: authFormKey,
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.06,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Enter user name";
                    //   }
                    //   return null;
                    // },
                    onChanged: (value) {
                      setState(() {
                        user_Name = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'User name',
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
                Expanded(
                  child: Container(
                    height: screenHeight * 0.06,
                    margin: EdgeInsets.only(left: screenWidth * 0.007),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Enter email";
                      //   } else if (!value.contains('@gmail.com')) {
                      //     return "Enter valid email";
                      //   }
                      //   return null;
                      // },
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
                          borderRadius:
                              BorderRadius.circular(borderRadiusAuth()),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                          borderRadius:
                              BorderRadius.circular(borderRadiusAuth()),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Row 2
          // Row 3
          Container(
            height: screenHeight * 0.06,
            child: Row(
              children: [
                Expanded(
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
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          // Row 4
          SizedBox(height: screenHeight * 0.02),
          //Row 5
          Container(
            child: Row(
              children: [
                Checkbox(
                  checkColor: tertiaryColor1(),
                  activeColor: primaryColor1(),
                  side: MaterialStateBorderSide.resolveWith(
                      (Set<MaterialState> states) {
                    return const BorderSide(
                        color: Color.fromRGBO(30, 30, 30, 0.800000011920929));
                  }),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: checkBoxValue,
                  onChanged: (bool? value) {
                    // Handle the checkbox state change
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    style: LabelSmall().copyWith(
                        color: Color.fromRGBO(30, 30, 30, 0.800000011920929)),
                    children: [
                      TextSpan(
                        text: 'I’ve read and agree with ',
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: LabelSmall().copyWith(
                            color: Colors.black,
                            // color: Color(0xb2000000),
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' and our ',
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: LabelSmall().copyWith(
                              color: Colors.black,
                              // color: Color(0xb2000000),
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                        text: ' ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Row 6
          SizedBox(height: screenHeight * 0.02),
          UserImage(onPickedImage: onImagePicked),
          SizedBox(height: screenHeight * 0.02),
          // Row 7 - Elevated Button
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
                  'SIGN UP',
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
