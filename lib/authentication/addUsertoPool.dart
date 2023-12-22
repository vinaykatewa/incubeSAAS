import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http/http.dart' as http;

class AdminQueriesAPI {
  static const String _baseUrl =
      'https://p2pvnfmqlf.execute-api.us-east-1.amazonaws.com/staging';
  static const String _addUserToGroupPath = '/addUserToGroup';

  Future<void> addUserToGroup(String username, String groupname) async {
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final result = await cognitoPlugin.fetchAuthSession();
    final identityId = result.identityIdResult.value;
    final accessToken = result.userPoolTokensResult.value.accessToken.toJson();

    final url = Uri.parse(_baseUrl + _addUserToGroupPath);
    final header = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${accessToken}"
    };
    final body = {'username': username, 'groupname': groupname};
    final response = await http.Request('POST', url);
    // final response = await http.post(url, body: body, headers: header);
    response.body = jsonEncode(body);
    response.headers.addAll(header);
    http.StreamedResponse request = await response.send();
    safePrint('this is the token');
    safePrint(
        (await AmplifyAuthCognito().fetchAuthSession()).credentialsResult);
    if (request.statusCode != 200) {
      throw Exception('Failed to add user to group.');
    } else {
      safePrint(response.body.toString());
    }
  }

  Future<void> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final result = await cognitoPlugin.fetchAuthSession();
      final identityId = result.identityIdResult.value;
      final accessToken =
          result.userPoolTokensResult.value.accessToken.toJson();
      safePrint("Current user's access token: $accessToken");
      safePrint("Current user's identity ID: $identityId");
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
  }
}
