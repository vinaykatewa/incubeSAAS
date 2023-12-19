import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/models/Todo.dart';
import 'package:incube/route.dart';
import '../firebase/AwsAmplify.dart';
import 'dart:html' as html;

import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:aws_common/web.dart';

class EmailConfirmationScreen extends StatefulWidget {
  final String email;
  final String acceleratorName;
  final String userName;
  final String password;
  final String imageFile;

  EmailConfirmationScreen({
    key,
    required this.email,
    required this.acceleratorName,
    required this.userName,
    required this.password,
    required this.imageFile,
  }) : super(key: key);

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}

class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  final amplifyFunction = AwsIncube();
  var uid = 'initial uid13';
  late final result;

  var imageUrl = '';

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
                "An email confirmation code is sent to ${widget.email}. Please type the code to confirm your email.",
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
                onPressed: () => _executeMethods(),
                child: Text("CONFIRM"),
              ),
              ElevatedButton(
                onPressed: () => amplifyFunction.isUserSignedIn(),
                child: Text("conferm signin"),
              ),
              ElevatedButton(
                onPressed: () => amplifyFunction.getCurrentUser(),
                child: Text("get user creds"),
              ),
              ElevatedButton(
                onPressed: () => amplifyFunction.fetchAuthSession(),
                child: Text("get user creds"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _executeMethods() async {
    await _submitCode().whenComplete(() async {
      await amplifyFunction
          .login(widget.email, widget.password)
          .whenComplete(() {
        _gotoMainScreen();
      });
    });
    // await Futurfe.delayed(Duration(seconds: 2));
    // await amplifyFunction.isUserSignedIn();
    // await amplifyFunction.getCurrentUser();
    // await fetchCognitoAuthSession();
    // await storingImage();
    // await graphQLData();
    // safePrint('home to home');
  }

  Future<void> _submitCode() async {
    final confirmationCode = _confirmationCodeController.text;
    safePrint('submit code button is started');
    try {
      await amplifyFunction.confirmUser(
          username: widget.email, confirmationCode: confirmationCode);
    } on AuthException catch (e) {
      safePrint('error in confirmation of code');
      safePrint(e.toString());
    }
  }

  Future<void> graphQLData() async {
    try {
      final userDataModel = Todo(
        uid: uid,
        acceleratorName: widget.acceleratorName,
        userName: widget.userName,
        email: widget.email,
        imageUrl: imageUrl,
      );
      final request = ModelMutations.create(userDataModel);
      final response = await Amplify.API.mutate(request: request).response;
      final createdUserData = response.data;

      if (createdUserData == null) {
        safePrint('errors: ${response.errors}');
      }
      safePrint('Mutation result: ${createdUserData!.uid}');
      safePrint('Mutation result: ${createdUserData.acceleratorName}');
      safePrint('Mutation result: ${createdUserData.userName}');
      safePrint('Mutation result: ${createdUserData.email}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> storingImage() async {
    final imageKey = await uploadHtmlFile(widget.imageFile);
    final result = await Amplify.Storage.getUrl(key: imageKey).result;
    setState(() {
      imageUrl = result.url.toString();
    });
    safePrint('here is your download url');
    safePrint(imageUrl);
  }

  void _gotoMainScreen() {
    safePrint('gottoMainScreen is running');
    Navigator.popAndPushNamed(context, AppRoutes.home);
    safePrint('gottoMainScreen is completed');
  }

  Future<String> uploadHtmlFile(String imageData) async {
    safePrint('file uploading is starting');
    final bytes = imageData.codeUnits;
    final awsFile = AWSFilePlatform.fromData(bytes);
    final fileName = DateTime.now().toIso8601String();
    try {
      safePrint('trying to uoplaod file');
      final uploadResult = await Amplify.Storage.uploadFile(
        localFile: awsFile,
        key: fileName,
      ).result;
      safePrint('file uplaoded successfully');
      safePrint('Uploaded file: ${uploadResult.uploadedItem.key}');
      return uploadResult.uploadedItem.key;
    } on StorageException catch (e) {
      safePrint('Error uploading file: ${e.message}');
      rethrow;
    }
  }
}
