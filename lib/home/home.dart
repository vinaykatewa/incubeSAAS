import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/dealSourcing/dealSourcing.dart';
import 'package:incube/home/portfolioAnalytics/usersheets/userSheetProvider.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/route.dart';
import 'package:provider/provider.dart';
import '../AmplifyFuntions/AwsAmplify.dart';
import '../uiThemes.dart';
import './communications/communications.dart';
import './dashboard/dashboard.dart';
import 'dealPipeline/dealPipeline.dart';
import './investmentTracking/investmentTracking.dart';
import './portfolioAnalytics/portfolioAnalytics.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedButtonIndex = 0;
  late String uid;
  List<userRequest> _userRequests = [];
  final AwsIncube awsAmplify = AwsIncube();
  List<Team> _teams = [];
  final _awsAmplify = AwsIncube();
  final _apiCall = ApiCalls();
  Future<void> setGoogleSheet() async {
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    try {
      final temp = await _apiCall.googleSheetGetData();
      _incubeProvider.replaceSheetData(temp);
      safePrint(
          'length of provider sheet: ${_incubeProvider.sheetData.length}');
    } catch (e) {}
  }

  Future<void> setUserPersonalSheets() async {
    //we are setting userSheets (provider) from organization's userSheets
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    final UserSheetProvider userSheerProvider =
        Provider.of<UserSheetProvider>(context, listen: false);
    Organization? _org =
        await awsAmplify.getOrganizationByAdminId(incubeProvider.superAdmin);
    if (_org == null) {
      safePrint('we got the null organization in fetchTeams method');
      return;
    }
    userSheerProvider.userSheets = _org.sheets;
    safePrint(
        'we are done setting the userSheet, here is the length: ${userSheerProvider.userSheets.length}');
  }

  @override
  void initState() {
    super.initState();
    setGoogleSheet();
    setUserPersonalSheets();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final IncubeProvider _incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);

    Future<void> fetchUserRequests() async {
      safePrint('we are using this admin id in fetchUserRequest method: ' +
          _incubeProvider.superAdmin);
      try {
        Organization? _org = await _awsAmplify
            .getOrganizationByAdminId(_incubeProvider.superAdmin);
        if (_org!.request!.isEmpty) {
          safePrint('there are no requests right now');
        }
        setState(() {
          _userRequests = _org.request!;
        });
        safePrint('fetching requests is done');
      } on Exception catch (e) {
        safePrint('fetchUserRequest is giving error: ' + e.toString());
      }
    }

    Future<void> fetchTeams() async {
      safePrint('we are using this admin id in fetchTeams method: ' +
          _incubeProvider.superAdmin);
      try {
        Organization? _org = await _awsAmplify
            .getOrganizationByAdminId(_incubeProvider.superAdmin);
        if (_org == null) {
          safePrint('we got the null organization in fetchTeams method');
          return;
        }
        if (_org!.org_team!.isEmpty) {
          safePrint('there are no requests right now');
        }
        setState(() {
          _teams = _org.org_team!;
        });
        safePrint('fetching requests is done');
      } on Exception catch (e) {
        safePrint('fetchUserRequest is giving error: ' + e.toString());
      }
    }

    Future<void> acceptRequest(String requestUserId, String memberName,
        String memberEmail, String teamId, bool isteamLeader) async {
      safePrint(
          'In acceptRequest method, we are using this requestUserId: $requestUserId');
      safePrint('In acceptRequest method, we are using this teamId: $teamId');
      safePrint(
          'In acceptRequest method, we are using this superAdmin: ${_incubeProvider.superAdmin}');
      Organization? requestedOrg = await _awsAmplify
          .getOrganizationByAdminId(_incubeProvider.superAdmin);
      if (requestedOrg == null) {
        safePrint('requestedOrg is null in acceptRequest method');
        return;
      }
      List<userRequest?> _list = requestedOrg.request!;
      if (_list.isEmpty) {
        safePrint('In acceptRequest method, _list of userRequest is empty');
        return;
      }
      int requestIndex =
          requestedOrg.request!.indexWhere((r) => r.userId == requestUserId);
      if (requestIndex == -1) {
        safePrint('In acceptRequest method, is returning index -1');
        return;
      }
      //now we have the index of the specific request
      //take userId from it and delete it
      final _userEmail = requestedOrg.request![requestIndex].userEmail;
      safePrint(
          'In acceptRequest method, this is the user email we got from list of userRequest: $_userEmail');
      requestedOrg.request!.removeAt(requestIndex);

      //now add the userId to the team DB
      //query team using teamId
      if (requestedOrg.org_team == null) {
        safePrint('requestedOrg.org_team is null in acceptRequest method');
        return;
      }
      int teamIndex = requestedOrg.org_team!
          .indexWhere((element) => element.idTeam == teamId);
      if (teamIndex == -1) {
        safePrint('In acceptRequest method, teamIndex is giving -1');
        return;
      }
      Team? specificTeam = requestedOrg.org_team[teamIndex];
      if (specificTeam == null) {
        safePrint('In acceptRequest method, specificTeam is null');
        return;
      }
      safePrint(
          'In acceptRequest method, this is length of team member list before: ${specificTeam.member.length}');
      specificTeam.member.add(Members(
          userId: requestUserId,
          memberName: memberName,
          memberEmail: memberEmail,
          deals: []));
      safePrint(
          'In acceptRequest method, this is length of team member list after adding: ${specificTeam.member.length}');
      requestedOrg.org_team[teamIndex] = specificTeam;

      await _awsAmplify.updateOrganization(requestedOrg).whenComplete(() {
        safePrint("we are done update the status of the request ");
      });

      //query the userDb provide teamid to user DB
      // also mark the request as accepted
      safePrint(
          'In acceptRequest method, this is teamId we are for userDB: $teamId');
      userInfo? userDbObject = await _awsAmplify.getUser(_userEmail);
      if (userDbObject == null) {
        safePrint('In acceptRequest method, we got _userDbObject null');
        safePrint('mean we did not find any user with this email');
        return;
      }
      final updatedUserDbObject = userDbObject.copyWith(
        requestStatus: "accepted",
        teamId: teamId,
        isteamLeader: isteamLeader,
      );
      safePrint(
          'In acceptRequest method, we have updated the user status here it is: ${updatedUserDbObject.requestStatus}');
      try {
        final request = ModelMutations.update(updatedUserDbObject);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            'In acceptRequest method, we are done updating the userDB here is the new details');
        safePrint('status: ${response.data!.requestStatus}');
        safePrint('teamId: ${response.data!.teamId}');
        safePrint('isteamLeader: ${response.data!.isteamLeader.toString()}');
      } catch (e) {
        safePrint('we got the error: ${e.toString()}');
      }
    }

    Future<void> denyRequest(String requestUserId) async {
      Organization? requestedOrg = await _awsAmplify
          .getOrganizationByAdminId(_incubeProvider.superAdmin);
      if (requestedOrg == null) {
        safePrint('requestedOrg is null in denyRequest method');
        return;
      }
      List<userRequest?> _list = requestedOrg.request!;
      int index =
          requestedOrg.request!.indexWhere((r) => r.userId == requestUserId);
      if (index == -1) {
        safePrint('the list is returning index -1 in acceptRequest method');
        return;
      }
      final _userEmail = requestedOrg.request[index].userEmail;
      requestedOrg.request!.removeAt(index);
      await _awsAmplify.updateOrganization(requestedOrg).whenComplete(() {
        safePrint(
            "Request with userId $requestUserId denied and removed from the list");
      });

      //update the userDb
      userInfo? _userDbObject = await _awsAmplify.getUser(_userEmail);
      if (_userDbObject == null) {
        safePrint('_userDbObject is null in acceptRequest method');
        return;
      }
      final updatedUserDbObject = _userDbObject.copyWith(
        requestStatus: "denied",
      );
      try {
        final request = ModelMutations.update(updatedUserDbObject);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            'we are done updating the userDb ${response.data!.requestStatus}');
      } catch (e) {
        safePrint('we got the error: ${e.toString()}');
      }
    }

    Future<void> getTeamAndCallAcceptRequest(String teamName, String teamLeader,
        String requestUserId, String requestUserName) async {
      try {
        Organization? org = await _awsAmplify
            .getOrganizationByAdminId(_incubeProvider.superAdmin);
        if (org == null) {
          safePrint('we got null org in addTeams method');
          return;
        }
        int specificTeamIndex = org.org_team.indexWhere((element) =>
            element.teamName == teamName && element.teamLeader == teamLeader);
        if (specificTeamIndex == -1) {
          safePrint(
              'In getTeamAndCallAcceptRequest, we got specificTeamIndex -1');
          return;
        }
        String teamId = org.org_team[specificTeamIndex].idTeam;
        //now pass this teamId to acceptRequest method
        acceptRequest(requestUserId, requestUserName, teamLeader, teamId, true);
        safePrint(
            'In getTeamAndCallAcceptRequest, we got this teamId: $teamId');
      } catch (e) {}
    }

    Future<void> addTeams(String teamName, String teamLeader,
        String requestUserId, String requestUserName) async {
      final teamId = _awsAmplify.generateUid();
      safePrint('In addTeams, we got this teamName: $teamName');
      safePrint('In addTeams, we got this teamLeader: $teamLeader');
      safePrint('In addTeams, we got this requestUserId: $requestUserId');
      try {
        Organization? org = await _awsAmplify
            .getOrganizationByAdminId(_incubeProvider.superAdmin);
        if (org == null) {
          safePrint('we got null org in addTeams method');
          return;
        }
        org.org_team.add(Team(
            idTeam: teamId,
            teamName: teamName,
            teamLeader: teamLeader,
            member: [],
            dealIDs: []));
        Organization updatedOrg = org.copyWith(org_team: org.org_team);
        final request = ModelMutations.update(updatedOrg);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            "this is the length of the list after adding new deal:${response.data!.org_deals.length.toString()} ");
      } catch (e) {
        safePrint(
            'try block of addTeam method is giving an error: ${e.toString()}');
      }
      //after this call
      getTeamAndCallAcceptRequest(
          teamName, teamLeader, requestUserId, requestUserName);
    }

    void addTeamAlertDialog(BuildContext context, String teamLeaderEmail,
        String requestUserId, String requestingUserName) {
      String teamName = '';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Team'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Team Name'),
                  onChanged: (value) {
                    teamName = value;
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  if (teamName.isNotEmpty) {
                    safePrint('Team Name: $teamName');
                    safePrint('Team Leader: $teamLeaderEmail');
                    await addTeams(teamName, teamLeaderEmail, requestUserId,
                        requestingUserName);
                    Navigator.of(context).pop();
                  } else {
                    print('Please fill in all fields.');
                  }
                },
                child: Text('Add Team'),
              ),
            ],
          );
        },
      );
    }

//addTeamAlertDialog
    void showTeamsAlertDialog(BuildContext context, String requestingUserName,
        String requestingUserId, String requestingUserEmail) {
      safePrint(
          'in showTeamsAlertDialog we are provide this requestingUserName: $requestingUserName');
      safePrint(
          'in showTeamsAlertDialog we are provide this requestingUserId: $requestingUserId');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Assign team to $requestingUserName"),
            content: Container(
              height: 300,
              width: 300,
              child: _teams.isEmpty
                  ? const Center(
                      child: Text('No team exist'),
                    )
                  : ListView.builder(
                      itemCount: _teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(_teams[index].teamName),
                          onTap: () async {
                            safePrint(
                                'here ontap on list item, we are providing to the team id: ${_teams[index].idTeam}');
                            safePrint(
                                'here ontap on list item, we are providing to the requestingUserId: $requestingUserId');
                            await acceptRequest(
                                    requestingUserId,
                                    requestingUserName,
                                    requestingUserEmail,
                                    _teams[index].idTeam,
                                    false)
                                .whenComplete(() async {
                              safePrint(
                                  'acceptRequest method is completed in showTeamAlertDialog method');
                              safePrint(
                                  'now we will call fetchUserRequests method');
                              await fetchUserRequests().whenComplete(() {
                                safePrint(
                                    'we are done update list after modifying the requests');
                              }).whenComplete(() {
                                Navigator.of(context).pop();
                              });
                            });
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
              TextButton(
                onPressed: () {
                  safePrint(
                      'In showTeamsAlertDialog, add and assign team button is pressed');
                  Navigator.of(context).pop();
                  addTeamAlertDialog(context, requestingUserEmail,
                      requestingUserId, requestingUserName);
                },
                child: Text('Add and Assign team'),
              ),
            ],
          );
        },
      );
    }

    void showRequests() {
      final screenHeight = MediaQuery.of(context).size.height;
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MainBorderRadius()),
            bottomLeft: Radius.circular(MainBorderRadius()),
          ),
        ),
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: screenHeight,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Someone wants to join your organization',
                    style: LabelSmall().copyWith(
                      color: secondaryColor(),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Use ListView.builder to display your existing list
                  Expanded(
                    child: ListView.builder(
                      itemCount: _userRequests.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(_userRequests[index].userName),
                          leading: IconButton(
                            onPressed: () async {
                              await fetchTeams().whenComplete(() {
                                safePrint(
                                    'we are providing showTeamsAlertDialog userName ${_userRequests[index].userName}');
                                safePrint(
                                    'we are providing showTeamsAlertDialog userId ${_userRequests[index].userId}');
                                Navigator.of(context).pop();
                                showTeamsAlertDialog(
                                  context,
                                  _userRequests[index].userName,
                                  _userRequests[index].userId,
                                  _userRequests[index].userEmail,
                                );
                              });
                            },
                            icon: FaIcon(FontAwesomeIcons.check),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              await denyRequest(_userRequests[index].userId)
                                  .whenComplete(() async {
                                await fetchUserRequests().whenComplete(() {
                                  safePrint(
                                      'we are done update list after modifying the requests');
                                });
                              });
                            },
                            icon: FaIcon(FontAwesomeIcons.xmark),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> signOutCurrentUser() async {
      final result = await Amplify.Auth.signOut();
      if (result is CognitoCompleteSignOut) {
        Navigator.popAndPushNamed(context, AppRoutes.auth);
        safePrint('Sign out completed successfully');
      } else if (result is CognitoFailedSignOut) {
        safePrint('Error signing user out: ${result.exception.message}');
      }
    }

    String _getButtonText(int index) {
      switch (index) {
        case 0:
          return 'DashBoard';
        case 1:
          return 'Deal Pipeline';
        case 2:
          return 'Deal Sourcing';
        case 3:
          return 'Portfolio Analytics';
        case 4:
          return 'Communications';
        default:
          return '';
      }
    }

    void onButtonTapped(index) {
      setState(() {
        selectedButtonIndex = index;
      });
    }

    Widget Navigation() {
      return Container(
        margin: const EdgeInsets.all(0),
        padding: EdgeInsets.only(
            left: screenWidth * 0.01, right: screenWidth * 0.01),
        width: double.infinity,
        height: screenHeight * 0.05,
        color: secondaryColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Incube',
              style: GoogleFonts.bodoniModa(
                color: Colors.transparent,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              child: Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.02),
                    decoration: BoxDecoration(
                        color: selectedButtonIndex == index
                            ? tertiaryColor1()
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(MainBorderRadius()),
                        )),
                    child: TextButton(
                      onPressed: () {
                        onButtonTapped(index);
                      },
                      child: Text(
                        _getButtonText(index),
                        style: LabelMedium().copyWith(
                          color: selectedButtonIndex == index
                              ? Colors.black
                              : Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                signOutCurrentUser();
              },
              child: Container(
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.user,
                      color: Colors.white.withOpacity(0.9),
                      size: screenWidth * 0.01,
                    ),
                    SizedBox(
                      width: screenWidth * 0.007,
                    ),
                    Text(
                      'Log out',
                      style: LabelSmall().copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _incubeProvider.isAdmin
                ? IconButton(
                    onPressed: () async {
                      await fetchUserRequests().whenComplete(() {
                        showRequests();
                      });
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.bars,
                      color: Colors.white.withOpacity(0.9),
                      size: screenWidth * 0.01,
                    ))
                : SizedBox(),
          ],
        ),
      );
    }

    Widget _buildScreen(int index) {
      switch (index) {
        case 0:
          return const Dashboard();
        case 1:
          return const DealPipeline();
        case 2:
          return const DealSourcing();
        case 3:
          return const PortfolioAnalytics();
        case 4:
          return const Communications();
        default:
          return Container();
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Navigation(),
          Expanded(
            child: _buildScreen(selectedButtonIndex),
          ),
        ],
      ),
    );
  }
}

class DealManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Deal Management Screen'),
    );
  }
}

class InvestmentTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Investment Tracking Screen'),
    );
  }
}

class PortfolioAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Portfolio Analytics Screen'),
    );
  }
}
