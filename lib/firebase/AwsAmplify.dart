import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/widgets.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:incube/route.dart';

import '../authentication/emailConfermationScreen.dart';

class AwsIncube {
  final userPool = CognitoUserPool(
    '${(dotenv.env['POOL_ID'])}',
    '${(dotenv.env['CLIENT_ID'])}',
  );
  Future<SignUpResult?> signUp(
      String acceleratorName,
      String userName,
      String email,
      String websiteLink,
      String password,
      String imageFile) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      await _handleSignUpResult(result);

      ///
      // final uid = result.userId;
      // final AwsImage = AWSFile.fromPath(imageFile);
      // //upload image to amplify
      // final storage = await Amplify.Storage.uploadFile(
      //   localFile: AwsImage,
      //   key: uid.toString(),
      // );
      // //getting the user image
      // final ImageUrlResult =
      //     await Amplify.Storage.getUrl(key: uid.toString()).result;
      // final UserImageUrl = ImageUrlResult.url.toString();
      // try {
      //   final userDataModel = Todo(
      //     uid: uid!,
      //     acceleratorName: acceleratorName,
      //     userName: userName,
      //     email: email,
      //     imageUrl: UserImageUrl,
      //   );
      //   final request = ModelMutations.create(userDataModel);
      //   final response = await Amplify.API.mutate(request: request).response;
      //   final createdUserData = response.data;

      //   if (createdUserData == null) {
      //     safePrint('errors: ${response.errors}');
      //   }
      //   safePrint('Mutation result: ${createdUserData!.userName}');
      // } on ApiException catch (e) {
      //   safePrint('Mutation failed: $e');
      // }
      if (result.isSignUpComplete) {
        _gotToEmailConfirmationScreen;
      }
      return result;
    } on AuthException catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  void _gotToEmailConfirmationScreen(context, String email) {
    Navigator.popAndPushNamed(context, '/email_confirmation', arguments: email);
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  Future<SignUpResult?> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      // Check if further confirmations are needed or if
      await _handleSignUpResult(result);
      if (result.isSignUpComplete) {}
      return result;
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
      return null;
    }
  }

  Future<SignInResult?> login(
    String email,
    String password,
  ) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      return result;
    } on AuthException catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }
}
