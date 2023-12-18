import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:incube/route.dart';

import '../authentication/emailConfermationScreen.dart';

class AwsIncube {
  // get user id
  Future<String> fetchUserIdFromAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final subAttribute =
          attributes.firstWhere((element) => element.userAttributeKey == 'sub');
      final userId = subAttribute.value;
      return userId;
    } catch (e) {
      throw e;
    }
  }

  Future<String> webSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI();
      if (result.isSignedIn) {
        return await fetchUserIdFromAttributes();
      } else {
        throw Exception('could not sign in');
      }
    } catch (e) {
      throw e;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  // Auto sign in
  Future<String> attemptAutoSignIn() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        return await fetchUserIdFromAttributes();
      } else {
        throw Exception('Not signed in');
      }
    } catch (e) {
      throw e;
    }
  }
}
