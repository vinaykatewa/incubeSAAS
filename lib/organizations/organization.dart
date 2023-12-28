import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/models/userInfo.dart';
import 'package:incube/provider.dart';
import 'package:incube/route.dart';
import 'package:incube/uiThemes.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:provider/provider.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  TextEditingController organizationNameController = TextEditingController();

  final amplifyfunction = AwsIncube();
  List<Organization?> _org = [];

  Organization? selectedOrganizationId = null;
  bool wantToCreateNewOrg = false;
  var _userid = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    dataSetting();
    fetchOrganizations();
  }

  void dataSetting() async {
    final response = await Amplify.Auth.getCurrentUser();
    final userUid = response.userId.toString();
    setState(() {
      _userid = userUid;
    });
    safePrint('this is the uid: ' + userUid);
  }

  Future<void> fetchOrganizations() async {
    // setState(() {
    //   isLoading = !isLoading;
    // });
    safePrint('fetchOrganizations method is running');
    try {
      safePrint('fetchOrganizations is trying to get the data');
      safePrint('fetchOrganizations is trying to get the data');
      final request = ModelQueries.list(Organization.classType);
      safePrint('we have the request');
      final response =
          await Amplify.API.query(request: request).response.whenComplete(() {
        safePrint('Amplify api call is completed');
      });
      setState(() {
        _org.addAll(response.data!.items);
      });
      selectedOrganizationId = _org[0];
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    }
    // setState(() {
    //   isLoading = !isLoading;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    Future<void> setUserDatabase() async {
      safePrint('setUSerDatabse is running');
      try {
        safePrint('we are trying to set the user database');
        _incubeProvider.userId = _userid;
        safePrint(
            'we have set the user to provider: ' + _incubeProvider.userId);
        final userDataModel = userInfo(
            uid: _incubeProvider.userId,
            userName: _incubeProvider.userName,
            email: _incubeProvider.email,
            imageUrl: _incubeProvider.imageFile,
            organizationName: _incubeProvider.organizationName,
            organizationId: _incubeProvider.organizationId,
            adminId: _incubeProvider.adminId);
        final request = ModelMutations.create(userDataModel);
        final response = await Amplify.API.mutate(request: request).response;
        final createdUserData = response.data;

        if (createdUserData == null) {
          safePrint('setUSerDatabse is failed');
          safePrint('errors: ${response.errors}');
        }
        safePrint('Mutation result: ${createdUserData!.uid}');
        safePrint('Mutation result: ${createdUserData.organizationName}');
        safePrint('Mutation result: ${createdUserData.userName}');
        safePrint('Mutation result: ${createdUserData.email}');
      } on ApiException catch (e) {
        safePrint('Mutation failed: $e');
      }
    }

    void selectingOrganization(String orgId, String orgName, String orgAdmin) {
      safePrint('we are selecting the organization: ' + orgName);
      _incubeProvider.organizationId = orgId;
      _incubeProvider.organizationName = orgName;
      _incubeProvider.adminId = orgAdmin;
      safePrint('we are setting the adminId for the user: ' +
          _incubeProvider.adminId);
      setUserDatabase();
    }

    Future<void> createOrganization(String name) async {
      _incubeProvider.userId = _userid;
      safePrint(
          'we have set the user id in provider in createOrganization method: ' +
              _incubeProvider.userId);
      await amplifyfunction
          .addOrganization(
              name,
              _userid,
              _userid,
              _incubeProvider.userName,
              _incubeProvider.email,
              _incubeProvider.imageFile,
              "teamId",
              "teamA")
          .whenComplete(() async {
        final response = await amplifyfunction
            .getOrganizationByAdminId(_incubeProvider.userId);
        safePrint(
            'we are creating a new organization for the current user org name: ' +
                response!.org_name);
        _incubeProvider.organizationName = response.org_name;
        _incubeProvider.adminId = _userid;
        _incubeProvider.organizationId = response.id;
        safePrint('these are the organizations details: ' +
            _incubeProvider.organizationId);
        safePrint('we are setting the adminId for the user: ' +
            _incubeProvider.adminId);
      }).whenComplete(() async {
        setUserDatabase();
      });
    }

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (_org.isEmpty) {
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
                                .whenComplete(() {
                              safePrint(
                                  'now we are finallyy moving to the home screen');
                              Navigator.popAndPushNamed(
                                  context, AppRoutes.home);
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

    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(55),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      selectedOrganizationId = value;
                    });
                    if (selectedOrganizationId != null) {
                      safePrint(
                          'this is the id: ${selectedOrganizationId!.id}');
                    }
                    ;
                  },
                  hint: Text(
                    selectedOrganizationId!.org_name,
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
                  onPressed: () {
                    selectingOrganization(
                        selectedOrganizationId!.id,
                        selectedOrganizationId!.org_name,
                        selectedOrganizationId!.org_admin);
                    Navigator.popAndPushNamed(context, AppRoutes.home);
                  },
                  child: Text(
                    'Move forward with this Organization',
                    style: BodySmall().copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Switch(
                    value: wantToCreateNewOrg,
                    activeColor: secondaryColor(),
                    onChanged: (_) {
                      setState(() {
                        wantToCreateNewOrg = !wantToCreateNewOrg;
                      });
                    }),
                !wantToCreateNewOrg
                    ? SizedBox()
                    : Column(
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
                                    .whenComplete(() {
                                  safePrint(
                                      'now we are finallyy moving to the home screen');
                                  Navigator.popAndPushNamed(
                                      context, AppRoutes.home);
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
}
