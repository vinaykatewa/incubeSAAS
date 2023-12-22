import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/provider.dart';

class AwsIncube {
  final IncubeProvider _incubeProvider = IncubeProvider();
  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    safePrint(result.isSignedIn.toString());
    safePrint('this is to check weather user is signed in or not');
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    safePrint(user.userId.toString());
    safePrint('conferm the uid');
    return user;
  }

  Future<void> signUpUser({
    required String password,
    required String email,
  }) async {
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
      ).whenComplete(() {
        safePrint('signup method is completed successfully');
      });
      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
    }
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

  Future<void> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('User is signed in: ${result.isSignedIn}');
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
  }

  Future<void> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      ).whenComplete(() {
        safePrint('confirmUser method is successful comleted');
      });
      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      safePrint('login method is trying to run');
      final signInResult =
          await Amplify.Auth.signIn(username: email, password: password);
      safePrint('login is done');
    } catch (e) {
      safePrint('there is a error in login button method');
      safePrint(e.toString());
    }
  }

  Future<void> fetchOrganizations() async {
    safePrint('fetchOrganizations method is running');
    try {
      safePrint('fetchOrganizations is trying to get the data');
      safePrint('fetchOrganizations is trying to get the data');
      final request = ModelQueries.list(Organization.classType);
      final response =
          await Amplify.API.query(request: request).response.whenComplete(() {
        safePrint('Amplify api call is completed');
      });
      _incubeProvider.addAllOrganization(response.data!.items);
      safePrint(
          'length of the organization list: ${_incubeProvider.org_list.length}');
      safePrint(
          'length of the organization : ${_incubeProvider.org_list[0]!.org_name}');
      safePrint(
          'length of the organization list: ${_incubeProvider.org_list.length}');
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    }
  }

  Future<void> addOrganization(String org_name, String org_admin) async {
    safePrint('_addEvent is running');
    try {
      safePrint('we are adding the organization');
      final organizationModel =
          Organization(org_name: org_name, org_admin: org_admin);
      final request = ModelMutations.create(organizationModel);
      final response =
          await Amplify.API.mutate(request: request).response.whenComplete(() {
        fetchOrganizations();
      });

      final createdTodo = response.data;
      if (createdTodo == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result org_name: ${createdTodo.org_name}');
      safePrint('Mutation result org_admin: ${createdTodo.org_admin}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }
}
