import 'dart:math';

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:incube/home/dealDetails.dart';
import 'package:incube/home/dealPipelineProvider.dart';
import 'package:incube/home/organizationProvider.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/Team.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';

class DealSourcing extends StatefulWidget {
  const DealSourcing({super.key});

  @override
  State<DealSourcing> createState() => _DealSourcingState();
}

class _DealSourcingState extends State<DealSourcing> {
  var screenWidth;
  var screenHeight;
  int currentIndex = 0;
  int _selectedTab = 0;
  List<Deals?> newLs = [];
  bool showDealDetails = false;
  late Deals viewDeal;
  List<String> tabsList = [
    'View all',
    'In progress',
    'Unassigned',
    'Completed',
  ];
  int currentPage = 0;
  final _pageController = PageController();
  final _itemsPerPage = 6;
  // var _pages = 1;

  @override
  void initState() {
    super.initState();
    settingList();
  }

  void settingList() {
    DealsPipelineProvider _dealPipelineProvider =
        Provider.of<DealsPipelineProvider>(context, listen: false);
    setState(() {
      newLs = _dealPipelineProvider.allDeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
    return showDealDetails
        ? DealDetails(
            currentDeal: viewDeal,
          )
        : Consumer<DealsPipelineProvider>(
            builder: (context, dealPipelineProvider, child) {
              return DefaultTabController(
                length: tabsList.length + 1,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 48 * 0.001271 * screenHeight,
                      // bottom: 96 * 0.001271 * screenHeight,
                      left: 32 * 0.000651 * screenWidth,
                      right: 32 * 0.000651 * screenWidth),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(context),
                        //tabs
                        Container(
                          height: 44 * 0.001271 * screenHeight,
                          padding: EdgeInsets.only(
                              top: 4 * 0.001271 * screenHeight,
                              bottom: 4 * 0.001271 * screenHeight,
                              left: 4 * 0.000651 * screenWidth,
                              right: 4 * 0.000651 * screenWidth),
                          decoration: BoxDecoration(
                              color: greyColor50(),
                              border: Border.all(
                                  color: greyColor200(),
                                  width: 1 * 0.000651 * screenWidth),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: tabsList.asMap().entries.map((entry) {
                              int idx = entry.key;
                              String tab = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedTab = idx;
                                    if (idx == 0) {
                                      newLs = dealPipelineProvider.allDeals;
                                    } else if (idx == 1) {
                                      newLs =
                                          dealPipelineProvider.inProcessDeals;
                                    } else if (idx == 2) {
                                      newLs =
                                          dealPipelineProvider.unAssignedDeals;
                                    } else {
                                      newLs =
                                          dealPipelineProvider.completedDeals;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 36 * 0.001271 * screenHeight,
                                  padding: EdgeInsets.only(
                                      left: 12 * 0.000651 * screenWidth,
                                      right: 12 * 0.000651 * screenWidth,
                                      top: 8 * 0.001271 * screenHeight,
                                      bottom: 8 * 0.001271 * screenHeight),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                    color: _selectedTab == idx
                                        ? const Color(0xFFFFFFFF)
                                        : greyColor50().withOpacity(0),
                                  ),
                                  child: Center(
                                    child: Text(tab,
                                        style: _selectedTab == idx
                                            ? textSmSemibold(
                                                    0.000651 * screenWidth)
                                                .copyWith(color: greyColor700())
                                            : textSmSemibold(
                                                    0.000651 * screenWidth)
                                                .copyWith(
                                                    color: greyColor500())),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(
                          height: 32 * 0.001271 * screenHeight,
                        ),
                        SizedBox(
                          height: 24 * 0.001271 * screenHeight,
                        ),
                        body(newLs, (newLs.length / _itemsPerPage).ceil(),
                            _selectedTab),
                        Divider(
                          color: greyColor200(),
                        ),
                        footer((newLs.length / _itemsPerPage).ceil()),
                        // footer(1),
                      ]),
                ),
              );
            },
          );
  }

  Widget header(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deal pipeline',
            style: displaySmSemibold(0.000651 * screenWidth)
                .copyWith(color: greyColor900()),
          ),
          SizedBox(
            height: 4 * 0.001271 * screenHeight,
          ),
          Text(
            'Search or go through startups looking to raise fresh rounds.',
            style: textMdRegular(0.000651 * screenWidth)
                .copyWith(color: greyColor600()),
          ),
          SizedBox(
            height: 24 * 0.001271 * screenHeight,
          ),
          // tabs()
        ],
      ),
    );
  }

  Widget body(List<Deals?> bodyList, int _pages, int selectedTab) {
    return Container(
      height: 467 * 0.001271 * screenHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pages,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        itemBuilder: (context, pageIndex) {
          final start = pageIndex * _itemsPerPage;
          final end = min(start + _itemsPerPage, bodyList.length);
          final pageItems = bodyList.sublist(start, end);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: (336 * 0.000651 * screenWidth) /
                  (195 * 0.001271 * screenHeight),
              mainAxisSpacing: 24 * 0.001271 * screenHeight,
              crossAxisSpacing: 24 * 0.000651 * screenWidth,
            ),
            itemCount: pageItems.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: greyColor200(),
                      width: 1,
                    ),
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 24 * 0.000651 * screenWidth,
                              right: 24 * 0.000651 * screenWidth,
                              // top: 24 * 0.001271 * screenHeight,
                              bottom: 24 * 0.001271 * screenHeight),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 54 * 0.001271 * screenHeight,
                                    width: 54 * 0.000651 * screenWidth,
                                    child:
                                        Image.asset('assets/startupImg.png')),
                                SizedBox(
                                  width: 12 * 0.000651 * screenWidth,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pageItems[index]!.company_name,
                                      style:
                                          textMdSemibold(0.000651 * screenWidth)
                                              .copyWith(color: greyColor900()),
                                    ),
                                    SizedBox(
                                      height: 4 * 0.001271 * screenHeight,
                                    ),
                                    Text(
                                      "Raising \$${pageItems[index]!.seeking}m",
                                      style:
                                          textSmMedium(0.000651 * screenWidth)
                                              .copyWith(color: greyColor600()),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24 * 0.001271 * screenHeight,
                            ),
                            Text(
                              pageItems[index]!.company_description,
                              style: textSmRegular(0.000651 * screenWidth)
                                  .copyWith(color: greyColor600()),
                            ),
                          ]),
                        ),
                        Divider(
                          color: greyColor200(),
                        ),
                        _selectedTab == 0
                            ? GestureDetector(
                                onTap: () {
                                  if (pageItems[index] != null) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return TeamsDialogBox(
                                          index: index,
                                          deal: pageItems[index]!,
                                        );
                                      },
                                    );
                                  } else {
                                    safePrint('pageItems[index] != null');
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 24 * 0.000651 * screenWidth,
                                    // bottom: 16 * 0.001271 * screenHeight
                                  ),
                                  child: Text(
                                    'Assign To',
                                    style:
                                        textSmSemibold(0.000651 * screenWidth)
                                            .copyWith(color: blueColor700()),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (pageItems[index] != null) {
                                        setState(() {
                                          showDealDetails = true;
                                          viewDeal = pageItems[index]!;
                                          safePrint(
                                              'we have set the viewDeal: ${viewDeal.company_name}');
                                        });
                                      } else {
                                        safePrint('deal is null');
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: 24 * 0.000651 * screenWidth,
                                      ),
                                      child: Text(
                                        'View Deal',
                                        style: textSmSemibold(
                                                0.000651 * screenWidth)
                                            .copyWith(color: blueColor700()),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      right: 24 * 0.000651 * screenWidth,
                                    ),
                                    child: Text(
                                      pageItems[index]!.teamName,
                                      style:
                                          textSmRegular(0.000651 * screenWidth)
                                              .copyWith(color: greyColor600()),
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }

  Widget footer(int _pages) {
    return Container(
      width: 1057 * 0.000651 * screenWidth,
      height: 65 * 0.001271 * screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: currentPage > 0
                ? () {
                    _pageController.animateToPage(
                      currentPage - 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
            child: SizedBox(
              height: 15 * 0.001271 * screenHeight,
              width: 85 * 0.000651 * screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: greyColor600(),
                    size: 18 * 0.000651 * screenWidth,
                  ),
                  SizedBox(
                    width: 6 * 0.000651 * screenWidth,
                  ),
                  Text(
                    'Previous',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 298 * 0.000651 * screenWidth,
            child: Row(
              children: List<Widget>.generate(_pages, (index) {
                return pageNumber(index);
              }),
            ),
          ),
          GestureDetector(
            onTap: currentPage < _pages - 1
                ? () {
                    _pageController.animateToPage(
                      currentPage + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                : null,
            child: SizedBox(
              height: 15 * 0.001271 * screenHeight,
              width: 85 * 0.000651 * screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next',
                    style: textSmSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor600()),
                  ),
                  SizedBox(
                    width: 6 * 0.000651 * screenWidth,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: greyColor600(),
                    size: 18 * 0.000651 * screenWidth,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageNumber(
    int i,
  ) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          i,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 40 * 0.001271 * screenHeight,
        width: 40 * 0.000651 * screenWidth,
        // decoration: BoxDecoration(
        //   color: currentPage == i ? Colors.blue : Colors.grey,
        // ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:
              currentPage == i ? greyColor100() : greyColor50().withOpacity(0),
        ),
        child: Text(
          '${i + 1}',
          style: textSmMedium(0.000651 * screenWidth).copyWith(
              color: currentIndex == i ? greyColor800() : greyColor600()),
        ),
        // Text(
        //   '$i',
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}

class TeamsDialogBox extends StatelessWidget {
  final Deals deal;
  final int index;

  const TeamsDialogBox({super.key, required this.deal, required this.index});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    OrganizationProvider _organizationProvider =
        Provider.of<OrganizationProvider>(context, listen: false);
    List<Team> teamsList = _organizationProvider.teamsList;
    DealsPipelineProvider _dealPipelineProvider =
        Provider.of<DealsPipelineProvider>(context, listen: false);

    return AlertDialog(
      title: Text(
        "Assign ${deal.company_name} to team",
        style: textLgSemibold(0.000651 * screenWidth)
            .copyWith(color: greyColor900()),
      ),
      content: Container(
        height: 300, // Adjust the height as needed
        width: 300, // Adjust the width as needed
        child: ListView.builder(
          itemCount: teamsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(teamsList[index].teamName),
              onTap: () async {
                _dealPipelineProvider.assignDealToDeal(
                    index, teamsList[index].idTeam, deal);
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
  }
}
