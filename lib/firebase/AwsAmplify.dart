import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

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
      try {
        final userDataModel = Todo(
          uid: uid!,
          acceleratorName: acceleratorName,
          userName: userName,
          email: email,
          imageUrl: UserImageUrl,
        );
        final request = ModelMutations.create(userDataModel);
        final response = await Amplify.API.mutate(request: request).response;
        final createdUserData = response.data;

        if (createdUserData == null) {
          safePrint('errors: ${response.errors}');
        }
        safePrint('Mutation result: ${createdUserData!.userName}');
      } on ApiException catch (e) {
        safePrint('Mutation failed: $e');
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
