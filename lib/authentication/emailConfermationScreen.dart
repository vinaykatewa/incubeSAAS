import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/route.dart';
import '../firebase/AwsAmplify.dart';

class EmailConfirmationScreen extends StatelessWidget {
  final String email;
  final String acceleratorName;
  final String userName;
  final String imageFile;

  EmailConfirmationScreen({
    key,
    required this.email,
    required this.acceleratorName,
    required this.userName,
    required this.imageFile,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _confirmationCodeController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Confirm your email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "An email confirmation code is sent to $email. Please type the code to confirm your email.",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _confirmationCodeController,
                decoration: InputDecoration(labelText: "Confirmation Code"),
                validator: (value) => value?.length != 6
                    ? "The confirmation code is invalid"
                    : null,
              ),
              ElevatedButton(
                onPressed: () => _submitCode(context),
                child: Text("CONFIRM"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitCode(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      final confirmationCode = _confirmationCodeController.text;
      safePrint('submit code button is started');
      try {
        final SignUpResult response = await Amplify.Auth.confirmSignUp(
          username: email,
          confirmationCode: confirmationCode,
        );
        _gotoMainScreen(context);
      } on AuthException catch (e) {
        safePrint('code submission error');
      }
    }
  }

  void _gotoMainScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.home);
  }
}
