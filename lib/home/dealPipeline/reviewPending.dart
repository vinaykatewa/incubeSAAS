import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class ReviewPandingDeals extends StatefulWidget {
  const ReviewPandingDeals({super.key});

  @override
  State<ReviewPandingDeals> createState() => _ReviewPandingDealsState();
}

class _ReviewPandingDealsState extends State<ReviewPandingDeals> {
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
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    try {
      safePrint('fetchDeals is trying to get the data');

      safePrint(
          'this is the admin id of the organization: ${_incubeProvider.superAdmin}');
      final organization =
          await _awsIncube.getOrganizationByAdminId(_incubeProvider.superAdmin);
      setState(() {
        _dealList = organization!.org_deals
            .where((element) => element.status == "review pending")
            .toList();
      });
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      safePrint('queryListItems method is failed');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    final AwsIncube awsAmplify = AwsIncube();
    List<Team> teamsList = [];

    Future<void> fetchTeams() async {
      try {
        Organization? _org = await awsAmplify
            .getOrganizationByAdminId(incubeProvider.superAdmin);
        if (_org == null) {
          safePrint('we got the null organization in fetchTeams method');
          return;
        }
        if (_org.org_team.isEmpty) {
          safePrint('there are no requests right now');
        }
        setState(() {
          teamsList = _org.org_team;
        });
        safePrint('fetching requests is done');
      } on Exception catch (e) {
        safePrint('fetchUserRequest is giving error: ' + e.toString());
      }
    }

    Future<void> assignToTeam(
        String dealId, String teamId, String teamLeaderEmail) async {
      //update teamId in deal list of org
      //update dealId in team list of org
      //update dealId in deal list of teamLeader userDb
      //as a last step, update the status of the deal "open"
      Organization? org =
          await awsAmplify.getOrganizationByAdminId(incubeProvider.superAdmin);
      if (org == null) {
        safePrint(
            'In assignToTeam method, we are receiving null value for org');
        return;
      }
      //step 1: updating teamId
      List<Deals> dealList = org.org_deals;
      int dealIndex =
          dealList.indexWhere((element) => element.idDeal == dealId);
      var specificDeal = dealList[dealIndex];
      dealList[dealIndex] = Deals(
          idDeal: specificDeal.idDeal,
          teamId: teamId,
          company_logo: specificDeal.company_logo,
          company_name: specificDeal.company_name,
          company_description: specificDeal.company_description,
          seeking: specificDeal.seeking,
          status: specificDeal.status,
          calls: []);

      //step 2: update dealId in team list
      List<Team> teamLs = org.org_team;
      int teamIndex = teamLs.indexWhere((element) => element.idTeam == teamId);
      var specificTeam = teamLs[teamIndex];
      specificTeam.dealIDs.add(dealId);
      teamLs[teamIndex] = Team(
          idTeam: specificTeam.idTeam,
          teamName: specificTeam.teamName,
          teamLeader: specificTeam.teamLeader,
          member: specificTeam.member,
          dealIDs: specificTeam.dealIDs);

      //step 3: now we can update the organization
      Organization updatedOrg =
          org.copyWith(org_deals: dealList, org_team: teamLs);
      try {
        final request = ModelMutations.update(updatedOrg);
        final response = await Amplify.API.mutate(request: request).response;
        print('Organization updated successfully');
      } catch (e) {
        print('Error updating organization: $e');
      }

      //step 4: update dealIds userDB
      userInfo? userDB = await awsAmplify.getUser(teamLeaderEmail);
      if (userDB == null) {
        safePrint(
            'In assignToTeam method, we are receiving null value for userDB');
        return;
      }
      userDB.dealIds.add(dealId);
      userInfo updatedUserDB = userDB.copyWith(dealIds: userDB.dealIds);
      try {
        final request = ModelMutations.update(updatedUserDB);
        final response = await Amplify.API.mutate(request: request).response;
        print('UserDB updated successfully');
      } catch (e) {
        print('Error updating UserDB: $e');
      }

      //last step: update status of the deal
      safePrint(
          "In assignToTeam method, this is superAdminId: ${incubeProvider.superAdmin}");
      safePrint("In assignToTeam method, this is dealId: $dealId");
      await awsAmplify
          .dealProcessing(incubeProvider.superAdmin, "open", dealId)
          .whenComplete(() {
        fetchDeals(context);
      });
    }

    void showTeamsAlertDialog(String dealId, String dealCompany) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return !incubeProvider.isAdmin
              ? AlertDialog(
                  content: Center(
                    child: Text(
                      "Only admin can assign the deal to the team",
                      style: BodySmall().copyWith(color: secondaryColor()),
                    ),
                  ),
                )
              : AlertDialog(
                  title: Text("Assign $dealCompany to team"),
                  content: Container(
                    height: 300, // Adjust the height as needed
                    width: 300, // Adjust the width as needed
                    child: ListView.builder(
                      itemCount: teamsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(teamsList[index].teamName),
                          onTap: () async {
                            safePrint(
                                'here ontap on list item, we are providing to the team id: ${teamsList[index].idTeam}');
                            safePrint(
                                'here ontap on list item, we are providing to the requestingUserId: $dealId');
                            await assignToTeam(dealId, teamsList[index].idTeam,
                                teamsList[index].teamLeader);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
        },
      );
    }

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        onPressed: () async {
                          safePrint(
                              'this is the dealId of the ontaped list: ${_dealList[index]!.idDeal}');
                          safePrint(
                              'this is the dealName of the ontaped list: ${_dealList[index]!.company_name}');
                          await fetchTeams().whenComplete(() {
                            showTeamsAlertDialog(_dealList[index]!.idDeal,
                                _dealList[index]!.company_name);
                          });
                        },
                        child: Text('Assign to team'))
                  ]),
                )),
          );
        },
      ),
    );
  }
}
