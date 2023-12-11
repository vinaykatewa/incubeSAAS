import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import '../models/UserInfo.dart';
// import 'dart:io';
// import 'dart:typed_data';

class AwsIncube {
  Future<SignUpResult?> signUp(
      String acceleratorName,
      String userName,
      String email,
      String websiteLink,
      String password,
      String imageFile) async {
    try {
      final result = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: SignUpOptions(
            userAttributes: {AuthUserAttributeKey.email: email},
          ));
      final uid = result.userId;
      final AwsImage = AWSFile.fromPath(imageFile);
      //upload image to amplify
      final storage = await Amplify.Storage.uploadFile(
        localFile: AwsImage,
        key: uid.toString(),
      );
      //getting the user image
      final ImageUrlResult =
          await Amplify.Storage.getUrl(key: uid.toString()).result;
      final UserImageUrl = ImageUrlResult.url.toString();
      //now storing the user data
      final userData = UserInfo(
          uid: uid.toString(),
          acceleratorName: acceleratorName,
          username: userName,
          email: email,
          imageUrl: UserImageUrl);
      try {
        await Amplify.DataStore.save(userData);
      } on DataStoreException catch (e) {
        safePrint('Something went wrong saving model: ${e.message}');
      }
      return result;
    } on AuthException catch (e) {
      print('Error signing up: $e');
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
