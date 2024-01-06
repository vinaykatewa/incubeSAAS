import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class AwsIncube {
  String generateUid() {
    Random random = Random();
    const String characters =
        '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    String uid = '';
    for (int i = 0; i < 50; i++) {
      uid += characters[random.nextInt(characters.length)];
    }

    return uid;
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    safePrint(result.isSignedIn.toString());
    safePrint('this is to check weather user is signed in or not');
    return result.isSignedIn;
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

  // Future<void> fetchOrganizations() async {
  //   safePrint('fetchOrganizations method is running');
  //   try {
  //     safePrint('fetchOrganizations is trying to get the data');
  //     safePrint('fetchOrganizations is trying to get the data');
  //     final request = ModelQueries.list(Organization.classType);
  //     final response =
  //         await Amplify.API.query(request: request).response.whenComplete(() {
  //       safePrint('Amplify api call is completed');
  //     });
  //     _incubeProvider.addAllOrganization(response.data!.items);
  //     safePrint(
  //         'length of the organization list: ${_incubeProvider.org_list.length}');
  //     safePrint(
  //         'length of the organization : ${_incubeProvider.org_list[0]!.org_name}');
  //     safePrint(
  //         'length of the organization list: ${_incubeProvider.org_list.length}');
  //   } on ApiException catch (e) {
  //     safePrint('Query failed: $e');
  //     safePrint('queryListItems method is failed');
  //   }
  // }

  // Future<void> saveTeam(Team expenseItem) async {
  //   try {
  //     final request = ModelMutations.create(expenseItem);
  //     final response = await Amplify.API.mutate(request: request).response;

  //     Team? createdExpenseItem = response.data;
  //     if (createdExpenseItem == null) {
  //       print('errors: ' + response.errors.toString());
  //       return;
  //     }
  //     print('Mutation result team name: ' + createdExpenseItem.teamName);
  //     print('Mutation result team id: ' + createdExpenseItem.id);
  //   } on Exception catch (e) {
  //     safePrint("this is the error from saveTeam method of AwsIncube class: " +
  //         e.toString());
  //   }
  // }
  Future<userInfo?> getUser(String email) async {
    safePrint('we are search user with email: $email');
    safePrint('in getUser method of AwsIncube class');
    try {
      final queryPredicate = userInfo.EMAIL.eq(email);

      final request = ModelQueries.list<userInfo>(
        userInfo.classType,
        where: queryPredicate,
      );
      final response = await Amplify.API.query(request: request).response;
      return response.data?.items.first;
    } catch (e) {
      safePrint(
          'we have encountered an error in getUser method of AwsIncube class');
      safePrint('here is the error: ${e.toString()}');
      return null;
    }
  }

  Future<void> addOrganization(
    String org_name,
    String org_admin,
    String adminUid,
    String adminName,
    String adminEmail,
    String adminImageUrl,
    String teamUid,
    String teamName,
  ) async {
    safePrint('_addEvent is running');
    try {
      safePrint('we are trying to add the organization');
      final organizationModel = Organization(
          org_name: org_name,
          org_admin: [org_admin],
          superAdminId: adminUid,
          org_team: [],
          org_deals: [],
          request: []);

      final request = ModelMutations.create(organizationModel);
      final response = await Amplify.API.mutate(request: request).response;

      Organization? createdTodo = response.data;
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

  Future<void> addDeals(String adminId, Deals _deal) async {
    final _org = await getOrganizationByAdminId(adminId);
    safePrint("this is the length of the list before adding new deal " +
        _org!.org_deals!.length.toString());
    _org!.org_deals!.add(_deal);
    final ls = _org.org_deals;
    await updateDeals(_org, ls!).whenComplete(() {
      safePrint('updateDeals method is completed according to addDeals method');
    });
  }

  Future<void> updateDeals(Organization originalTodo, List<Deals> ls) async {
    final updatedOrganization = originalTodo.copyWith(org_deals: ls);
    safePrint("updateDeals method of awsIncube class is running");

    final request = ModelMutations.update(updatedOrganization);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint("this is the length of the list after adding new deal " +
        response.data!.org_deals!.length.toString());
  }

  Future<Organization?> getOrganizationByAdminId(String superAdminId) async {
    safePrint('getOrganizationByAdminId method is running');
    try {
      final queryPredicate = Organization.SUPERADMINID.contains(superAdminId);
      final request = ModelQueries.list<Organization>(
        Organization.classType,
        where: queryPredicate,
      );
      final response = await Amplify.API.query(request: request).response;
      safePrint('${response.data!.items.length} is the length of the list');
      safePrint('${response.data?.items.first!.org_admin} is the admin');
      safePrint('${response.data?.items.first!.org_name} is the name');
      return response.data?.items.first;
    } catch (e) {
      safePrint('getOrganizationsByAdminId is giving error' + e.toString());
    }
    return null;
  }

  Future<void> dealProcessing(
      String superAdminId, String status, String dealId) async {
    safePrint(
        'In dealProcessing, we are using this superadminId to find the organization $superAdminId');
    final _org = await getOrganizationByAdminId(superAdminId);
    safePrint(
        'In dealProcessing, we are using this dealId to find the deal $dealId');
    int index = _org!.org_deals.indexWhere((deal) => deal.idDeal == dealId);

    if (index == -1) {
      safePrint('the list is returning index -1');
      return;
    }
    Deals _updatedDeals = _org.org_deals[index].copyWith(status: status);
    _org.org_deals[index] = _updatedDeals;
    await updateOrganization(_org).whenComplete(() {
      safePrint("we are done update the status of the deal ");
    });
  }

  Future<void> updateOrganization(Organization originalOrg) async {
    try {
      final request = ModelMutations.update(originalOrg);
      final response = await Amplify.API.mutate(request: request).response;
      print('Organization updated successfully');
    } catch (e) {
      print('Error updating organization: $e');
    }
  }
}
