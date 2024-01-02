import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class OpenDeals extends StatefulWidget {
  const OpenDeals({super.key});

  @override
  State<OpenDeals> createState() => _OpenDealsState();
}

class _OpenDealsState extends State<OpenDeals> {
  List<Deals?> _dealList = [];
  final _awsIncube = AwsIncube();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      safePrint(
          'In fetchDeals, we are using this superAdmin id: ${incubeProvider.superAdmin}');
      final organization =
          await _awsIncube.getOrganizationByAdminId(incubeProvider.superAdmin);
      if (organization == null) {
        safePrint('In fetchDeals, organization is null');
        return;
      }
      // if user is admin
      if (incubeProvider.isAdmin) {
        setState(() {
          _dealList = organization.org_deals
              .where((element) => element.status == 'open')
              .toList();
        });
        safePrint('Admin Case: length of _dealList is: ${_dealList.length}');
      }
      //if the user is team leader
      else if (incubeProvider.isteamLeader) {
        List<String> listOfDealIds = organization.org_team
            .where((element) => element.idTeam == incubeProvider.teamId)
            .first
            .dealIDs;
        safePrint('Team Leader Case: listOfDealIds: $listOfDealIds');
        List<Deals> tempDealList = [];
        for (String s in listOfDealIds) {
          int index = organization.org_deals.indexWhere(
              (element) => element.idDeal == s && element.status == 'open');
          if (index == -1) {
            safePrint('In fetchDeals, index is -1 for deal ID: $s');
            safePrint(
                'Organization Deals IDs: ${organization.org_deals.map((deal) => deal.idDeal)}');
            safePrint(
                'Organization Deals Status: ${organization.org_deals.map((deal) => deal.status)}');
            continue; // Skip this deal and proceed to the next one
          }
          tempDealList.add(organization.org_deals[index]);
          safePrint('Team Leader Case: Added deal with ID $s to tempDealList');
        }
        setState(() {
          _dealList = tempDealList;
        });
        safePrint(
            'Team Leader Case: length of _dealList is: ${_dealList.length}');
      }
      // if the user is normal user
      else {
        List<String> listOfDealIds = userDB.dealIds;
        List<Deals> tempDealList = [];
        for (String s in listOfDealIds) {
          tempDealList.add(organization.org_deals
              .where((element) => element.idDeal == s)
              .first);
        }
        setState(() {
          _dealList = tempDealList;
        });
        safePrint(
            'Normal User Case: length of _dealList is: ${_dealList.length}');
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
