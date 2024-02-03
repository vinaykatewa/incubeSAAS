import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class Closing extends StatefulWidget {
  const Closing({super.key});

  @override
  State<Closing> createState() => _ClosingState();
}

class _ClosingState extends State<Closing> {
  List<Deals?> _dealList = [];
  final _awsIncube = AwsIncube();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchDeals(context);
    });
  }

  Future<void> fetchDeals(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    safePrint('fetchDeals method is running');
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    try {
      safePrint('fetchDeals is trying to get the data');
      final userDB = await _awsIncube.getUser(incubeProvider.email);
      if (userDB == null) {
        safePrint('In fetchDeals, userDB is null');
        return;
      }
      final organization =
          await _awsIncube.getOrganizationByAdminId(incubeProvider.superAdmin);
      if (organization == null) {
        safePrint('In fetchDeals, organization is null');
        return;
      }
      if (!incubeProvider.isAdmin && !incubeProvider.isteamLeader) {
        List<String> listOfDealIds = userDB.dealIds;
        List<Deals> tempDealList = [];
        for (String s in listOfDealIds) {
          _dealList.add(organization.org_deals
              .where((element) => element.idDeal == s)
              .first);
        }
        safePrint('length of tempDealList is: ${tempDealList.length}');
        setState(() {
          _dealList = tempDealList;
        });
        safePrint('length of _dealList is: ${_dealList.length}');
      } else if (!incubeProvider.isAdmin && incubeProvider.isteamLeader) {
        List<String> listOfDealIds = organization.org_team
            .where((element) => element.idTeam == incubeProvider.teamId)
            .first
            .dealIDs;
        List<Deals> tempDealList = [];
        for (String s in listOfDealIds) {
          _dealList.add(organization.org_deals
              .where((element) =>
                  element.idDeal == s && element.status == "closing")
              .first);
          safePrint('length of tempDealList is: ${tempDealList.length}');
          setState(() {
            _dealList = tempDealList;
          });
          safePrint('length of _dealList is: ${_dealList.length}');
        }
      } else {
        setState(() {
          _dealList = organization.org_deals
              .where((element) => element.status == 'closing')
              .toList();
        });
        safePrint('length of _dealList is: ${_dealList.length}');
      }
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (!isLoading && _dealList.isEmpty) {
      return const Center(
        child: Text("No deal is present at this time"),
      );
    }

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _dealList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
                margin: EdgeInsets.all(13),
                child: SizedBox(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.25,
                  child: Column(children: [
                    Text(_dealList[index]!.company_name),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text(_dealList[index]!.company_description),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Text("seeking: \$" + _dealList[index]!.seeking),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadiusAuth()),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {},
                            child: Text('View Application')),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: secondaryColor(),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadiusAuth()),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {},
                            child: Text('View Deal')),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    const Divider(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(borderRadiusAuth()),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () async {},
                        child: Text('See deatils'))
                  ]),
                )),
          );
        },
      ),
    );
  }
}
