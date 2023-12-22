import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Organization.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  TextEditingController organizationNameController = TextEditingController();
  final IncubeProvider _incubeProvider = IncubeProvider();
  final amplifyfunction = AwsIncube();

  String? selectedOrganization =
      '1'; // To store the selected organization from the dropdown

  @override
  void initState() {
    super.initState();
    dataSetting();
  }

  void dataSetting() async {
    final response = await Amplify.Auth.getCurrentUser();
    final userUid = response.userId.toString();
    _incubeProvider.userId = userUid;
    safePrint('this is the uid: ' + userUid);
  }

  void selectingOrganization() {}

  void createOrganization(String name) {
    amplifyfunction.addOrganization(name, _incubeProvider.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(55),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // DropdownButton(
                //   value: selectedOrganization,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedOrganization = value;
                //     });
                //   },
                //   hint: const Text('Select an Organization'),
                //   items: _incubeProvider.org_list
                //       ?.map((org) => DropdownMenuItem(
                //             enabled: true,
                //             value: org!.id,
                //             child: Text(
                //               org.org_name,
                //               style: TextStyle(color: Colors.black),
                //             ),
                //           ))
                //       .toList(),
                // ),
                // SingleChildScrollView(
                //   child: Container(
                //     child: ListView.builder(
                //         itemCount: _incubeProvider.org_list.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Text(_incubeProvider.org_list[index]!.org_name,
                //               style: const TextStyle(color: Colors.black));
                //         }),
                //   ),
                // ),
                const SizedBox(height: 16),
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
                      borderRadius: BorderRadius.circular(borderRadiusAuth()),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                      borderRadius: BorderRadius.circular(borderRadiusAuth()),
                    ),
                  ),
                  style: BodySmall().copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MainBorderRadius()),
                    ),
                  ),
                  onPressed: () {
                    if (selectedOrganization != null) {
                      // Organization selected from the dropdown
                      _incubeProvider.organization_name = selectedOrganization!;
                      //we need to give organization id to the user
                    } else if (organizationNameController.text.isNotEmpty) {
                      // New organization name entered
                      _incubeProvider.organization_name =
                          organizationNameController.text;
                      createOrganization(organizationNameController.text);
                      // we need to set the organization in the database
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Create Organization',
                    style: BodySmall().copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
