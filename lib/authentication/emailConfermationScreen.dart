import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/organizations/organization.dart';
import 'package:incube/provider.dart';
import 'package:incube/route.dart';
import 'package:provider/provider.dart';
import '../AmplifyFuntions/AwsAmplify.dart';

class EmailConfirmationScreen extends StatefulWidget {
  final String email;
  final String password;
  final String imageFile;

  EmailConfirmationScreen({
    key,
    required this.email,
    // required this.organization_name,
    // required this.userName,
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
  bool _isExecuting = false;

  @override
  Widget build(BuildContext context) {
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
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

    // Future<String> uploadHtmlFile(String imageData) async {
    //   safePrint('file uploading is starting');
    //   final bytes = imageData.codeUnits;
    //   final awsFile = AWSFilePlatform.fromData(bytes);
    //   final fileName = DateTime.now().toIso8601String();
    //   try {
    //     safePrint('trying to uoplaod file');
    //     final uploadResult = await Amplify.Storage.uploadFile(
    //       localFile: awsFile,
    //       key: fileName,
    //     ).result;
    //     safePrint('file uplaoded successfully');
    //     safePrint('Uploaded file: ${uploadResult.uploadedItem.key}');
    //     return uploadResult.uploadedItem.key;
    //   } on StorageException catch (e) {
    //     safePrint('Error uploading file: ${e.message}');
    //     rethrow;
    //   }
    // }

    Future<void> storingImage() async {
      // final imageKey = await uploadHtmlFile(widget.imageFile);
      // final result = await Amplify.Storage.getUrl(key: imageKey).result;
      // setState(() {
      //   _incubeProvider.imageFile = result.url.toString();
      // });
      // safePrint('here is your download url');
      // safePrint(_incubeProvider.imageFile);
    }

    void _gotoOrganizationScreen() {
      safePrint('goingtoOrganizationScreen is running');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OrganizationPage(
                  fromLogin: false,
                )),
      );
      safePrint('goingtoOrganizationScreen is completed');
    }

    Future<void> setProvider() async {
      final response = await Amplify.Auth.getCurrentUser();
      final userUid = response.userId.toString();
      _incubeProvider.userId = userUid;
      safePrint('we set the _userId to provider: ${_incubeProvider.userId}');
      safePrint(
          'we set the _userName to provider: ${_incubeProvider.userName}');
      safePrint('we set the _email to provider: ${_incubeProvider.email}');
      safePrint(
          'we set the _imageFile to provider: ${_incubeProvider.imageFile}');
    }

    Future<void> setUserDataBase() async {
      try {
        userInfo _userModel = userInfo(
            userUid: _incubeProvider.userId,
            userName: _incubeProvider.userName,
            email: _incubeProvider.email,
            imageUrl: _incubeProvider.imageFile,
            dealIds: []);
        final request = ModelMutations.create(_userModel);
        final response = await Amplify.API.mutate(request: request).response;

        userInfo? createdTodo = response.data;
        if (createdTodo == null) {
          safePrint('errors: ${response.errors}');
          return;
        }
        safePrint('Mutation result userName: ${createdTodo.userName}');
      } on ApiException catch (e) {
        safePrint('Mutation failed: $e');
      }
    }

    Future<void> _executeMethods() async {
      await _submitCode().whenComplete(() async {
        await amplifyFunction
            .login(widget.email, widget.password)
            .whenComplete(() async {
          await setProvider().whenComplete(() async {
            await storingImage().whenComplete(() async {
              //here form a user database
              await setUserDataBase().whenComplete(() {
                _gotoOrganizationScreen();
              });
            });
          });
        });
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Confirm your email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
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
                    onPressed: () async {
                      setState(() {
                        _isExecuting = true;
                      });

                      await _executeMethods();

                      setState(() {
                        _isExecuting = false;
                      });
                    },
                    child: Text("CONFIRM"),
                  ),
                ],
              ),
              if (_isExecuting)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
