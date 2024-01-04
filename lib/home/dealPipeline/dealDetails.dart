import 'package:flutter/material.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/uiThemes.dart';

class DealDetails extends StatefulWidget {
  final Deals deal;
  const DealDetails({super.key, required this.deal});

  @override
  State<DealDetails> createState() => _DealDetailsState();
}

class _DealDetailsState extends State<DealDetails>
    with TickerProviderStateMixin {
  // final _awsIncube = AwsIncube();
  Team mainTeam = Team(
    dealIDs: ["Ilbo1uIlsz47M6sPJRKvvwY0B3WNjRxNtF8nv4Mj5dr1rysWRA"],
    idTeam: "G9qeWQM9gGSAglqD59USBvqnxknHPzZCRSa0iS97bOTu4Ry8Cq",
    teamName: "third team",
    teamLeader: "imvinaykatewa@gmail.com",
    member: [
      Members(
        userId: "2cf18d84-42c4-4572-b496-af9f99a5d13a",
        memberName: "teamLeader",
        memberEmail: "imvinaykatewa@gmail.com",
        deals: [],
      ),
      Members(
        userId: "8c4bea95-8cf2-4992-a88e-943179e6dd21",
        memberName: "normal user",
        memberEmail: "vinaykatewa2605@gmail.com",
        deals: ["Ilbo1uIlsz47M6sPJRKvvwY0B3WNjRxNtF8nv4Mj5dr1rysWRA"],
      ),
    ],
  );
  bool isLoading = false;

  List<Tab> tabList = [];
  List<DealsCall> tabContents = [];
  // List<TabContentModel> tabContents = [
  // ];

  @override
  void initState() {
    super.initState();
    setTabs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMainTeam(context);
    });
  }

  void setTabs() {
    setState(() {
      final List<DealsCall> calls = widget.deal.calls;
      tabList = calls.map((call) => Tab(child: Text(call.tabName))).toList();
      tabContents = calls.map((call) {
        return call;
      }).toList();
    });
  }

  void _onTabAdd() {
    setState(() {
      final newTabIndex = tabList.length;

      tabContents.add(
          DealsCall(tabName: "title", tabContentHeader: [], tabContentBody: [])
          // TabContentModel(
          //     title: "title ${tabList.length + 1}",
          //     description: "description ${tabList.length}"),
          );
      tabList.add(Tab(
        child: Text(tabContents[newTabIndex].tabName),
      ));
    });
  }

  Future<void> getMainTeam(BuildContext context) async {
    // setState(() {
    //   isLoading = true;
    // });
    // try {
    //   final IncubeProvider incubeProvider =
    //       Provider.of<IncubeProvider>(context, listen: false);
    //   final teamId = widget.deal.teamId;
    //   final organization =
    //       await _awsIncube.getOrganizationByAdminId(incubeProvider.superAdmin);
    //   if (organization == null) {
    //     safePrint('In fetchMembers, organization is null');
    //     return;
    //   }
    //   Team temp = organization.org_team
    //       .where((element) => element.idTeam == teamId)
    //       .first;
    //   setState(() {
    //     mainTeam = temp;
    //   });
    //   safePrint(
    //       'In getMembers method, we are done setting mainteam: ${mainTeam.teamName}');
    // } catch (e) {
    //   safePrint('We got an error in getMainTeam method: ${e.toString()}');
    // } finally {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
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
      return DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: tabList.toList(),
            ),
            title: Text(widget.deal.company_name),
            actions: [
              IconButton(
                  onPressed: () {
                    _onTabAdd();
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: TabBarView(
            children: tabContents.map((tabContent) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    tabContent.tabContentHeader.length,
                    (index) {
                      return Container(
                        width: screenWidth * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${tabContent.tabContentHeader[index]} ",
                              style: BodySmall().copyWith(color: textColor()),
                            ),
                            // Text(
                            //   "${tabContent.tabContentHeader[index]}: ${tabContent.tabContentBody[index]}",
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            Container(
                              width: screenWidth * 0.2,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: TextEditingController(
                                        text: tabContent.tabContentBody[index]),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}

//tab content model
class TabContentModel {
  final String title;
  final String description;

  TabContentModel({required this.description, required this.title});
}
