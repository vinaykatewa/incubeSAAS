import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/home/home.dart';
import 'package:provider/provider.dart';

import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/models/userInfo.dart';
import 'package:incube/provider.dart';
import 'package:incube/route.dart';
import 'package:incube/uiThemes.dart';

class OrganizationPage extends StatefulWidget {
  bool fromLogin;
  OrganizationPage({
    required this.fromLogin,
  });

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  TextEditingController organizationNameController = TextEditingController();

  final amplifyfunction = AwsIncube();
  List<Organization?> _org = [];
  Organization? selectedOrganization;
  bool wantToCreateNewOrg = false;
  bool isLoading = false;
  String orgId = "";
  String orgName = "";
  String orgAdmin = "";

  @override
  void initState() {
    super.initState();
    fetchOrganizations();
  }

  Future<void> fetchOrganizations() async {
    setState(() {
      isLoading = true;
    });
    safePrint('fetchOrganizations method is running');
    try {
      safePrint('fetchOrganizations is trying to get the data');
      safePrint('fetchOrganizations is trying to get the data');
      final request = ModelQueries.list(Organization.classType);
      safePrint('we have the request: ${request.toString()}');

      final response =
          await Amplify.API.query(request: request).response.whenComplete(() {
        safePrint('Amplify api call is completed');
      });

      safePrint('we have the request: ${response.data.toString()}');
      setState(() {
        safePrint('set state is running');
        _org.addAll(response.data!.items);
        selectedOrganization = _org[0];
      });
      safePrint('this is the length of the organization list: ${_org.length}');
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    Future<void> reloadRequest() async {
      userInfo? _user = await amplifyfunction.getUser(_incubeProvider.email);
      if (_user == null) {
        safePrint('we got the null user');
      } else {
        _incubeProvider.requestStatus = _user.requestStatus!;
      }
    }

    Future<void> updateUserDB_onSelectingOrg() async {
      userInfo? _user = await amplifyfunction.getUser(_incubeProvider.email);
      if (_user == null) {
        safePrint('we got the null user');
        return null;
      }
      final updatedUserDb = _user.copyWith(
          isadmin: _incubeProvider.isAdmin,
          organizationId: _incubeProvider.organizationId,
          superAdminId: _incubeProvider.superAdmin,
          requestStatus: _incubeProvider.requestStatus);
      try {
        final request = ModelMutations.update(updatedUserDb);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            'we are done updating the userDB here is the orgId: ${response.data!.organizationId}');
      } catch (e) {
        safePrint('we got the error: ${e.toString()}');
      } finally {
        setState(() {
          widget.fromLogin = true;
        });
      }
    }

    Future<void> updateUserDB_onCreatingOrg() async {
      userInfo? _user = await amplifyfunction.getUser(_incubeProvider.email);
      if (_user == null) {
        safePrint('we got the null user');
        return null;
      }
      final updatedUserDb = _user.copyWith(
        isadmin: _incubeProvider.isAdmin,
        organizationId: _incubeProvider.organizationId,
        superAdminId: _incubeProvider.superAdmin,
        requestStatus: _incubeProvider.requestStatus,
        teamId: _incubeProvider.teamId,
        isteamLeader: _incubeProvider.isteamLeader,
      );
      try {
        final request = ModelMutations.update(updatedUserDb);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            'we are done updating the userDB here is the orgId: ${response.data!.organizationId}');
      } catch (e) {
        safePrint('we got the error: ${e.toString()}');
      }
    }

    Future<void> selectingOrganization(String superAdmin) async {
      Organization? requestedOrg =
          await amplifyfunction.getOrganizationByAdminId(superAdmin);
      if (requestedOrg == null) {
        safePrint(
            'the getOrganizationByAdmin method is returning null while selecting organization method is running');
        return;
      }
      // isadmin, organizationId, superadminId, requestStatus
      _incubeProvider.isAdmin = false;
      _incubeProvider.organizationId = requestedOrg.id;
      _incubeProvider.superAdmin = requestedOrg.superAdminId;
      _incubeProvider.requestStatus = "pending";
      safePrint('we have saved the super admin id in the provider:' +
          _incubeProvider.superAdmin);

      userRequest _requestModel = userRequest(
          userName: _incubeProvider.userName,
          userEmail: _incubeProvider.email,
          userId: _incubeProvider.userId,
          status: "pending");
      var allRequests = requestedOrg.request;
      allRequests!.add(_requestModel);

      try {
        final updatedOrgRequests = requestedOrg.copyWith(request: allRequests);
        final request = ModelMutations.update(updatedOrgRequests);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint("request send: " + response.data.toString());
      } on Exception catch (e) {
        safePrint(
            'we got the error while sending the request to the admin of org: ' +
                e.toString());
      }
    }

    Future<void> createOrganization(String name) async {
      await amplifyfunction
          .addOrganization(
        name,
        _incubeProvider.userId,
        _incubeProvider.userId,
        _incubeProvider.userName,
        _incubeProvider.email,
        _incubeProvider.imageFile,
        "teamId",
        "teamA",
      )
          .whenComplete(() async {
        final response = await amplifyfunction
            .getOrganizationByAdminId(_incubeProvider.userId);
        safePrint(
            'we are creating a new organization for the current user org name: ' +
                response!.org_name);
        _incubeProvider.isAdmin = true;
        _incubeProvider.organizationId = response.id;
        _incubeProvider.superAdmin = response.superAdminId;
        _incubeProvider.requestStatus = "accepted";
        _incubeProvider.teamId = "null";
        _incubeProvider.isteamLeader = false;
      });
    }

    Widget newOrganization() {
      return Scaffold(
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(55),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: organizationNameController,
                        decoration: InputDecoration(
                          labelText: 'Or enter a new Organization name',
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.4285714286,
                            color: Color(0x7c1e1e1e),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                            borderRadius:
                                BorderRadius.circular(borderRadiusAuth()),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                            borderRadius:
                                BorderRadius.circular(borderRadiusAuth()),
                          ),
                        ),
                        style: BodySmall().copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(MainBorderRadius()),
                          ),
                        ),
                        onPressed: () async {
                          if (organizationNameController.text.isNotEmpty) {
                            await createOrganization(
                                    organizationNameController.text)
                                .whenComplete(() async {
                              safePrint(
                                  'now we are finallyy moving to the home screen');
                              await updateUserDB_onCreatingOrg()
                                  .whenComplete(() {
                                Navigator.popAndPushNamed(
                                    context, AppRoutes.home);
                              });
                            });
                          }
                        },
                        child: Text(
                          'Create Organization',
                          style: BodySmall().copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget showOrganizationList() {
      return Column(
        children: [
          DropdownButton(
            onChanged: (value) {
              setState(() {
                selectedOrganization = value;
              });
              if (selectedOrganization != null) {
                safePrint('this is the id: ${selectedOrganization!.id}');
              } else {
                safePrint('we are getting a null value');
              }
            },
            hint: Text(
              selectedOrganization?.org_name ?? "Select an organization",
            ),
            items: _org
                .map((org) => DropdownMenuItem(
                      enabled: true,
                      value: org!,
                      child: Text(
                        org.org_name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MainBorderRadius()),
              ),
            ),
            onPressed: () async {
              setState(() {
                orgId = selectedOrganization!.id;
                orgName = selectedOrganization!.org_name;
                orgAdmin = selectedOrganization!.org_admin[0];
              });
              await selectingOrganization(selectedOrganization!.org_admin[0])
                  .whenComplete(() {
                updateUserDB_onSelectingOrg();
              });
            },
            child: Text(
              'Move forward with this Organization',
              style: BodySmall().copyWith(color: Colors.black),
            ),
          ),
        ],
      );
    }

    Widget showAll() {
      if (isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (!isLoading && _org.isEmpty) {
        return Center(
          child: Card(
            margin: const EdgeInsets.all(55),
            child: Padding(
                padding: const EdgeInsets.all(20), child: newOrganization()),
          ),
        );
      } else {
        return Center(
          child: Card(
            margin: const EdgeInsets.all(55),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  showOrganizationList(),
                  const SizedBox(height: 16),
                  Switch(
                    value: wantToCreateNewOrg,
                    activeColor: secondaryColor(),
                    onChanged: (_) {
                      setState(() {
                        wantToCreateNewOrg = !wantToCreateNewOrg;
                      });
                    },
                  ),
                  !wantToCreateNewOrg ? SizedBox() : newOrganization()
                ],
              ),
            ),
          ),
        );
      }
    }

    if (widget.fromLogin) {
      if (_incubeProvider.requestStatus == 'accepted') {
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        });
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_incubeProvider.requestStatus == 'denied') {
        return showAll();
      }
      //when request is pending
      else {
        return Center(
          child: Column(
            children: [
              Text(
                "Waitinig for the admin to accept the request",
                style: BodySmall().copyWith(color: secondaryColor()),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusAuth()),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    reloadRequest();
                  },
                  child: Text(
                    'Refresh',
                    style: LabelMedium().copyWith(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        );
      }
    }

    //when the user is coming through signup screen
    else {
      return showAll();
    }
  }
}
