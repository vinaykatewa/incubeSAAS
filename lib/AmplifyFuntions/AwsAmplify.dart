import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/provider.dart';
import 'package:provider/provider.dart';

class AwsIncube {
  // final _incubeProvider = Provider.of<IncubeProvider>(context, listen: false);
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
      final org_team = Team(
          org_id: "org_id2",
          userUid: "user Uid 2",
          userName: "user Nam2",
          userAdmin: "user admin 2",
          teamName: "main team 2");

      final organizationModel = Organization(
          org_name: org_name,
          org_admin: org_admin,
          uid: adminUid,
          userName: adminName,
          email: adminEmail,
          org_team: [
            Team(
                org_id: "org_id4",
                userUid: "user Uid 4",
                userName: "user Nam4",
                userAdmin: "user admin 4",
                teamName: "main team 4"),
            Team(
                org_id: "org_id5",
                userUid: "user Uid 5",
                userName: "user Nam5",
                userAdmin: "user admin 5",
                teamName: "main team 5"),
            Team(
                org_id: "org_id6",
                userUid: "user Uid 6",
                userName: "user Nam6",
                userAdmin: "user admin 6",
                teamName: "main team 6")
          ],
          org_deals: [
            Deals(
                company_logo: "https:///",
                company_description: "new company",
                company_name: "new company",
                status: "pending",
                seeking: "555"),
            Deals(
                company_logo: "https:///",
                company_description: "new company",
                company_name: "new company",
                status: "pending",
                seeking: "555"),
            Deals(
                company_logo: "https:///",
                company_description: "new company",
                company_name: "new company",
                status: "pending",
                seeking: "555")
          ],
          imageUrl: adminImageUrl);

      final request = ModelMutations.create(organizationModel);
      final response =
          await Amplify.API.mutate(request: request).response.whenComplete(() {
        // fetchOrganizations();
      });

      Organization? createdTodo = response.data;
      if (createdTodo == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result org_name: ${createdTodo.org_name}');
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
    final todoWithNewName = originalTodo.copyWith(org_deals: ls);
    safePrint("updateDeals method of awsIncube class is running");

    final request = ModelMutations.update(todoWithNewName);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint("this is the length of the list after adding new deal " +
        response.data!.org_deals!.length.toString());
  }

  Future<Organization?> getOrganizationByAdminId(String adminId) async {
    safePrint('getOrganizationByAdminId method is running');
    try {
      final queryPredicate =
          Organization.ORG_ADMIN.eq('cf34947c-32cd-4bec-8311-2391d2203b9a');

      final request = ModelQueries.list<Organization>(
        Organization.classType,
        where: queryPredicate,
      );
      final response = await Amplify.API.query(request: request).response;
      return response.data?.items.first;
    } catch (e) {
      safePrint('getOrganizationsByAdminId is giving error' + e.toString());
    }
    return null;
  }

  Future<void> dealProcessing(
      String adminId, String status, String dealId) async {
    final _org = await getOrganizationByAdminId(adminId);
    int index = _org!.org_deals!.indexWhere((deal) => deal.id == dealId);
    if (index == -1) {
      safePrint('the list is returning index -1');
      return;
    }
    Deals _updatedDeals = _org.org_deals![index].copyWith(status: status);
    _org.org_deals![index] = _updatedDeals;
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
