import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/home/dealPipeline/dealDetails.dart';
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
  List<Members> _membersList = [];
  final _awsIncube = AwsIncube();
  bool isLoading = false;
  bool wantToShowDetails = false;
  late Deals? dealToProvideDealDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchDeals(context);
      fetchMembers(context);
    });
  }

  Future<void> fetchMembers(BuildContext context) async {
    //only for team leader
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    if (incubeProvider.isteamLeader) {
      final organization =
          await _awsIncube.getOrganizationByAdminId(incubeProvider.superAdmin);
      if (organization == null) {
        safePrint('In fetchMembers, organization is null');
        return;
      }
      Team specificTeam = organization.org_team.where((element) {
        safePrint('In fetchMembers, element.idTeam is: ${element.idTeam}');
        safePrint(
            'In fetchMembers, incubeProvider.teamId is: ${incubeProvider.teamId}');
        return element.idTeam == incubeProvider.teamId;
      }).first;
      setState(() {
        _membersList = specificTeam.member;
      });
      safePrint(
          'In fetchMembers, this is the length of the members list: ${_membersList.length}');
    }
  }

  Future<void> fetchDeals(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    safePrint('fetchDeals method is running');
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    try {
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
    Future<void> assignMember(String dealId, String email) async {
      //give this deal to userDB
      //give this deal to org->team->memberDB
      userInfo? _userDB = await _awsIncube.getUser(email);
      if (_userDB == null) {
        safePrint('In assignMember, userDB is null');
        return;
      }
      //step1: assign deal to userDB
      _userDB.dealIds.add(dealId);
      userInfo updatedUserDB = _userDB.copyWith(dealIds: _userDB.dealIds);
      try {
        final request = ModelMutations.update(updatedUserDB);
        final response = await Amplify.API.mutate(request: request).response;
        print('UserDB updated successfully');
      } catch (e) {
        print('Error updating UserDB: $e');
      }

      //step2: update the dealIds in members
      safePrint(
          'In assignMember, we are using this superAdmin id: ${_incubeProvider.superAdmin}');
      final organization =
          await _awsIncube.getOrganizationByAdminId(_incubeProvider.superAdmin);
      if (organization == null) {
        safePrint('In assignMember, organization is null');
        return;
      }
      int specificTeamIndex = organization.org_team.indexWhere((element) {
        return element.idTeam == _incubeProvider.teamId;
      });

      List<Team> teamLs = organization.org_team;
      int teamIndex = teamLs
          .indexWhere((element) => element.idTeam == _incubeProvider.teamId);
      var specificTeam = teamLs[teamIndex];
      if (teamIndex == -1) {
        safePrint('In assignMember, team index is -1');
        return;
      }
      List<Members> specificMember = teamLs[teamIndex].member;
      int specificMemberIndex =
          specificMember.indexWhere((element) => element.memberEmail == email);
      specificMember[specificMemberIndex].deals.add(dealId);

      teamLs[teamIndex] = Team(
          idTeam: specificTeam.idTeam,
          teamName: specificTeam.teamName,
          teamLeader: specificTeam.teamLeader,
          member: specificMember,
          dealIDs: specificTeam.dealIDs);
      //step 3: now we can update the organization
      Organization updatedOrg = organization.copyWith(org_team: teamLs);
      try {
        final request = ModelMutations.update(updatedOrg);
        final response = await Amplify.API.mutate(request: request).response;
        print('Organization updated successfully');
      } catch (e) {
        print('Error updating organization: $e');
      }
    }

    void showMembersAlertDialog(String dealId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Assign deal to: "),
            content: Container(
              height: 300,
              width: 300,
              child: _membersList.isEmpty
                  ? const Center(
                      child: Text('No team exist'),
                    )
                  : ListView.builder(
                      itemCount: _membersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(_membersList[index].memberName),
                          onTap: () async {
                            //just pass the deal id and userId
                            assignMember(
                                dealId, _membersList[index].memberEmail);
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

    Future<void> providingDealToDealVariable(Deals _deal) async {
      setState(() {
        dealToProvideDealDetail = _deal;
      });
    }

    if (wantToShowDetails) {
      return DealDetails(
        deal: dealToProvideDealDetail!,
      );
    } else {
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
                      Text("seeking: \$ ${_dealList[index]!.seeking}"),
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
                              onPressed: () async {
                                await providingDealToDealVariable(
                                        _dealList[index]!)
                                    .whenComplete(() {
                                  setState(() {
                                    wantToShowDetails = true;
                                  });
                                });
                              },
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
                                'this is the dealID we are giving to showMembersALertDialog: ${_dealList[index]!.idDeal}');
                            showMembersAlertDialog(_dealList[index]!.idDeal);
                          },
                          child: Text('Assign to member'))
                    ]),
                  )),
            );
          },
        ),
      );
    }
  }
}
