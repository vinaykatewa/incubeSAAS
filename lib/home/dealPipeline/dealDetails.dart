import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int selectedIndex = 0;

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
      tabContents.add(DealsCall(
          tabName: "title",
          tabContent: [tabDetails(tabContentHeader: "", tabContentBody: "")]));
      tabList.add(Tab(
        child: Text(tabContents[newTabIndex].tabName),
      ));
    });
  }

  void addField() {
    setState(() {
      final currentTabContent = tabContents[selectedIndex];
      currentTabContent.tabContent.add(
        tabDetails(tabContentHeader: "", tabContentBody: ""),
      );
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
          body: Container(
            color: tertiaryColor1(),
            padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: tabContents.map((tabContent) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            tabContent.tabContent.length,
                            (index) {
                              return Container(
                                width: screenWidth * 0.5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            labelText: tabContent
                                                .tabContent[index]
                                                .tabContentHeader,
                                            // labelText: tabContent.
                                            //     .tabContentHeader[index],
                                            labelStyle: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                height: 1.4285714286,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1)),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      borderRadiusAuth()),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      borderRadiusAuth()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          height: 1.4285714286,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                    //content body
                                    Container(
                                      width: screenWidth * 0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            labelText: tabContent
                                                .tabContent[index]
                                                .tabContentBody,
                                            // tabContent
                                            //     .tabContentBody[index],
                                            labelStyle: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                height: 1.4285714286,
                                                color: textColor()),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      borderRadiusAuth()),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      borderRadiusAuth()),
                                            ),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFb5454fb),
                          Color(0xFF000649),
                        ]),
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        addField();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusAuth()),
                        ),
                        elevation: 2,
                      ),
                      child: Text("Add field")),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
