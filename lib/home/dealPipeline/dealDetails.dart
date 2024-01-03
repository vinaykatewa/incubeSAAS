import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class DealDetails extends StatefulWidget {
  final Deals deal;
  const DealDetails({required this.deal});

  @override
  State<DealDetails> createState() => _DealDetailsState();
}

class _DealDetailsState extends State<DealDetails> {
  final _awsIncube = AwsIncube();
  Team mainTeam =
      Team(dealIDs: [], idTeam: "", teamName: "", teamLeader: "", member: []);
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMainTeam(context);
    });
  }

  Future<void> getMainTeam(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try {
      final IncubeProvider incubeProvider =
          Provider.of<IncubeProvider>(context, listen: false);
      final teamId = widget.deal.teamId;
      final organization =
          await _awsIncube.getOrganizationByAdminId(incubeProvider.superAdmin);
      if (organization == null) {
        safePrint('In fetchMembers, organization is null');
        return;
      }
      Team temp = organization.org_team
          .where((element) => element.idTeam == teamId)
          .first;
      setState(() {
        mainTeam = temp;
      });
      safePrint(
          'In getMembers method, we are done setting mainteam: ${mainTeam.teamName}');
    } catch (e) {
      safePrint('We got an error in getMainTeam method: ${e.toString()}');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return Scaffold(
        body: Center(
          child: LinearProgressIndicator(backgroundColor: secondaryColor()),
        ),
      );
    } else {
      Widget showingTeamDetails() {
        return SingleChildScrollView(
          child: Container(
            // Remove the fixed width and use flexible width
            width: screenWidth * 0.2,
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Column(
              children: [
                Text(
                  "team name: ${mainTeam.teamName}",
                  style: BodyMedium().copyWith(color: secondaryColor()),
                ),
                Divider(
                  color: secondaryColor(),
                ),
                Text(
                  'Members:',
                  style: BodySmall().copyWith(color: secondaryColor()),
                ),
                Container(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: mainTeam.member.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          mainTeam.member[index].memberName,
                          style: BodySmall().copyWith(color: secondaryColor()),
                        ),
                        onTap: () async {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.deal.company_name,
              style: BodyLarge().copyWith(color: secondaryColor())),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          showingTeamDetails(),
        ],
      ));
    }
  }
}
