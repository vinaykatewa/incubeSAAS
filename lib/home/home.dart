import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final awsFunction = AwsIncube();
  @override
  void initState() {
    super.initState();
    awsFunction.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationBar(
            selectedButtonIndex: selectedButtonIndex,
            onButtonTapped: (index) {
              setState(() {
                selectedButtonIndex = index;
              });
            },
          ),
          Expanded(
            child: _buildScreen(selectedButtonIndex),
          ),
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
        return const InvestmentTracking();
      case 3:
        return const PortfolioAnalytics();
      case 4:
        return const Communications();
      default:
        return Container();
    }
  }
}

class NavigationBar extends StatefulWidget {
  final Function(int) onButtonTapped;
  final int selectedButtonIndex;

  const NavigationBar(
      {Key? key,
      required this.selectedButtonIndex,
      required this.onButtonTapped})
      : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<userRequest> _userRequests = [];
  List<Team> _teams = [];
  final _awsAmplify = AwsIncube();

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

    Future<void> acceptRequest(String requestUserId, String teamId) async {
      safePrint(
          'we are using this superAdminId in acceptRequest method: ${_incubeProvider.superAdmin}');
      Organization? requestedOrg = await _awsAmplify
          .getOrganizationByAdminId(_incubeProvider.superAdmin);
      if (requestedOrg == null) {
        safePrint('requestedOrg is null in acceptRequest method');
        return;
      }
      List<userRequest?> _list = requestedOrg.request!;
      int requestIndex =
          requestedOrg.request!.indexWhere((r) => r.userId == requestUserId);
      if (requestIndex == -1) {
        safePrint('the list is returning index -1 in acceptRequest method');
        return;
      }
      //now we have the index of the specific request
      //take userId from it and delete it
      final _userEmail = requestedOrg.request![requestIndex].userEmail;

      requestedOrg.request!.removeAt(requestIndex);

      //now add the userId to the team DB
      //query team using teamId
      List<Team?> _team = requestedOrg.org_team!;
      if (_team == null) {
        safePrint('_team is null in acceptRequest method');
        return;
      }
      int teamIndex =
          requestedOrg.org_team!.indexWhere((element) => element.id == teamId);
      Team? specificTeam = requestedOrg.org_team![teamIndex];
      specificTeam.member!.add(requestUserId);
      requestedOrg.org_team![teamIndex] = specificTeam;

      await _awsAmplify.updateOrganization(requestedOrg).whenComplete(() {
        safePrint("we are done update the status of the request ");
      });

      //query the userDb provide teamid to user DB
      // also mark the request as accepted
      userInfo? _userDbObject = await _awsAmplify.getUser(_userEmail);
      if (_userDbObject == null) {
        safePrint('_userDbObject is null in acceptRequest method');
        return;
      }
      final updatedUserDbObject = _userDbObject.copyWith(
        requestStatus: "accepted",
        teamId: teamId,
        isteamLeader: true,
      );
      try {
        final request = ModelMutations.update(updatedUserDbObject);
        final response = await Amplify.API.mutate(request: request).response;
        safePrint(
            'we are done updating the userDB: ${response.data!.requestStatus}');
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
      final _userEmail = requestedOrg.request![index].userEmail;
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

    void showTeamsAlertDialog(BuildContext context, String requestingUserName,
        String requestingUserId) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Assign team to $requestingUserName"),
            content: Container(
              height: 300, // Adjust the height as needed
              width: 300, // Adjust the width as needed
              child: ListView.builder(
                itemCount: _teams.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_teams[index].teamName),
                    onTap: () async {
                      safePrint(
                          'this is we are providing to the team id: ${_teams[index].id}');
                      safePrint(
                          'this is we are providing to the team request id: $requestingUserId');
                      await acceptRequest(requestingUserId, _teams[index].id)
                          .whenComplete(() async {
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
            ],
          );
        },
      );
    }

    void _showRightSheet() {
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
                      color: Colors.white.withOpacity(0.9),
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
                                    'we are providing showTeamsAlertDialog userId${_userRequests[index].userId}');
                                showTeamsAlertDialog(
                                    context,
                                    _userRequests[index].userName,
                                    _userRequests[index].userId);
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

    return Material(
      child: Container(
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
                        color: widget.selectedButtonIndex == index
                            ? tertiaryColor1()
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(MainBorderRadius()),
                        )),
                    child: TextButton(
                      onPressed: () {
                        widget.onButtonTapped(index);
                      },
                      child: Text(
                        _getButtonText(index),
                        style: LabelMedium().copyWith(
                          color: widget.selectedButtonIndex == index
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
                        _showRightSheet();
                      });
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.bars,
                      color: Colors.white.withOpacity(0.9),
                      size: screenWidth * 0.01,
                    ))
                : SizedBox()
          ],
        ),
      ),
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
        return 'Investment Tracking';
      case 3:
        return 'Portfolio Analytics';
      case 4:
        return 'Communications';
      default:
        return '';
    }
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
