import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:provider/provider.dart';

class DealDetails extends StatefulWidget {
  final Deals deal;
  const DealDetails({Key? key, required this.deal}) : super(key: key);

  @override
  State<DealDetails> createState() => _DealDetailsState();
}

class _DealDetailsState extends State<DealDetails>
    with TickerProviderStateMixin {
  bool isLoading = false;
  final AwsIncube awsAmplify = AwsIncube();

  Future<void> saveDataInDB(BuildContext context, int currentTabIndex) async {
    //update the deal calls
    final DealDetailsProvider dealDetailProvider =
        Provider.of<DealDetailsProvider>(context, listen: false);
    final IncubeProvider incubeProvider =
        Provider.of<IncubeProvider>(context, listen: false);
    Organization? org =
        await awsAmplify.getOrganizationByAdminId(incubeProvider.superAdmin);
    if (org == null) {
      safePrint('In assignToTeam method, we are receiving null value for org');
      return;
    }
    List<Deals> dealList = org.org_deals;
    int dealIndex =
        dealList.indexWhere((element) => element.idDeal == widget.deal.idDeal);
    var specificDealCall = dealList[dealIndex].calls;
    //updating all 3 list
    specificDealCall.tabList[currentTabIndex] =
        dealDetailProvider.tabList[currentTabIndex];
    specificDealCall.tabTitles[currentTabIndex] =
        dealDetailProvider.tabTitles[currentTabIndex];
    specificDealCall.tabContent[currentTabIndex] = tabContentList(
        tabDetailsList: dealDetailProvider.tabContent[currentTabIndex]);
    // Update Deals
    Deals updatedDeal = dealList[dealIndex].copyWith(calls: specificDealCall);
    dealList[dealIndex] = updatedDeal;

    // Update Organization
    Organization updatedOrganization = org.copyWith(org_deals: dealList);

    // Perform the mutation to update the organization
    try {
      final request = ModelMutations.update(updatedOrganization);
      final response = await Amplify.API.mutate(request: request).response;
      print('Organization updated successfully');
    } catch (e) {
      print('Error updating organization: $e');
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
      return Consumer<DealDetailsProvider>(
        builder: (context, _detailsProvider, child) {
          int globalTabCount = _detailsProvider.tabList.length + 1;
          return DefaultTabController(
            length: _detailsProvider.tabList.length,
            child: Scaffold(
              body: Container(
                color: tertiaryColor1(),
                padding: EdgeInsets.only(
                  left: screenWidth * 0.04,
                  right: screenWidth * 0.04,
                  top: screenWidth * 0.01,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          widget.deal.company_name,
                          style: HeadlineLarge().copyWith(color: textColor()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Builder(builder: (context) {
                            return TabBar(
                              labelStyle: LabelLarge().copyWith(
                                  color: Colors.white.withOpacity(0.9)),
                              labelColor: Colors.white.withOpacity(0.9),
                              unselectedLabelColor:
                                  textColor().withOpacity(0.5),
                              indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(MainBorderRadius()),
                                color: secondaryColor(),
                              ),
                              onTap: (value) {
                                TabController tabController =
                                    DefaultTabController.of(context);
                                int previousIndex = tabController.previousIndex;
                                setState(() {
                                  _detailsProvider.tabList[previousIndex] =
                                      _detailsProvider
                                          .controllers[previousIndex].text;
                                });
                              },
                              tabs: _detailsProvider.tabList
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                String tab = entry.value;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Tab(
                                      text: tab,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        safePrint(
                                            'we are providing this index: $index');
                                        safePrint(
                                            'we are providing this tab: ${_detailsProvider.tabList[index - 1]}');
                                        safePrint(
                                            'we are providing this tabContent: ${_detailsProvider.tabContent[index]}');
                                        _detailsProvider.deleteTab(index);
                                      },
                                      icon: Icon(Icons.cancel),
                                    ),
                                  ],
                                );
                              }).toList(),
                            );
                          }),
                        ),
                        IconButton(
                          onPressed: () {
                            _detailsProvider.addTab("tab $globalTabCount");
                            globalTabCount++;
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Expanded(
                      child: TabBarView(
                        children: _detailsProvider.tabList
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TabTitle(
                                  tabIndex: index,
                                  title: _detailsProvider.tabTitles[index],
                                  controller:
                                      _detailsProvider.controllers[index],
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Container(
                                  width: screenWidth * 0.6,
                                  height: screenHeight * 0.5,
                                  child: Center(
                                    child: Builder(builder: (context) {
                                      TabController tabController =
                                          DefaultTabController.of(context);
                                      return ListView.builder(
                                        itemCount: _detailsProvider
                                            .tabContent[tabController.index]
                                            .length,
                                        itemBuilder: (context, itemIndex) {
                                          return Column(
                                            children: [
                                              TabViewModel(
                                                tabIndex: tabController.index,
                                                fieldIndex: itemIndex,
                                                tabContentModel:
                                                    TabContentModel(
                                                  title: _detailsProvider
                                                      .tabContent[tabController
                                                          .index][itemIndex]
                                                      .tabContentHeader,
                                                  content: _detailsProvider
                                                      .tabContent[tabController
                                                          .index][itemIndex]
                                                      .tabContentBody,
                                                ),
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.01),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadiusAuth()),
                                          color: secondaryColor()),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _detailsProvider.addField(index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                borderRadiusAuth()),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          "Add field",
                                          style: BodySmall().copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.9)),
                                        ),
                                      ),
                                    ),
                                    //hive
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadiusAuth()),
                                          color: secondaryColor()),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                borderRadiusAuth()),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          "Add Notes",
                                          style: BodySmall().copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.9)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              borderRadiusAuth()),
                                          color: secondaryColor()),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          saveDataInDB(context, index);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                borderRadiusAuth()),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          "Save the edits",
                                          style: BodySmall().copyWith(
                                              color: Colors.white
                                                  .withOpacity(0.9)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

class TabContentModel {
  final String title;
  final String content;

  TabContentModel({required this.title, required this.content});
}

class TabTitle extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final int tabIndex;
  const TabTitle(
      {Key? key,
      required this.title,
      required this.controller,
      required this.tabIndex})
      : super(key: key);
  @override
  State<TabTitle> createState() => _TabTitleState();
}

class _TabTitleState extends State<TabTitle> {
  TextEditingController titleHaderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleHaderController.text = "Title";
    widget.controller.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return Container(
          width: screenWidth * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.1,
                padding: EdgeInsets.only(left: screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MainBorderRadius()),
                    bottomLeft: Radius.circular(MainBorderRadius()),
                  ),
                ),
                child: TextField(
                    readOnly: true,
                    controller: titleHaderController,
                    style: BodySmall()
                        .copyWith(color: Colors.white.withOpacity(0.9)),
                    maxLines: null,
                    decoration:
                        const InputDecoration(border: InputBorder.none)),
              ),
              //content body
              Container(
                width: screenWidth * 0.3,
                padding: EdgeInsets.only(
                  left: screenWidth * 0.01,
                  right: screenWidth * 0.01,
                ),
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(MainBorderRadius()),
                    bottomRight: Radius.circular(MainBorderRadius()),
                  ),
                ),
                child: TextField(
                  controller: widget.controller,
                  onChanged: (value) {
                    _detailsProvider.tabTitles[widget.tabIndex] = value;
                  },
                  style: BodySmall()
                      .copyWith(color: Colors.white.withOpacity(0.9)),
                  maxLines: null,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TabViewModel extends StatefulWidget {
  final TabContentModel tabContentModel;
  final int tabIndex;
  final int fieldIndex;
  const TabViewModel(
      {Key? key,
      required this.tabContentModel,
      required this.tabIndex,
      required this.fieldIndex})
      : super(key: key);
  @override
  State<TabViewModel> createState() => _TabViewModelState();
}

class _TabViewModelState extends State<TabViewModel> {
  TextEditingController tabHeaderController = TextEditingController();
  TextEditingController tabBodyController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabHeaderController.text = widget.tabContentModel.title;
    tabBodyController.text = widget.tabContentModel.content;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return Container(
          width: screenWidth * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.1,
                padding: EdgeInsets.only(left: screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MainBorderRadius()),
                    bottomLeft: Radius.circular(MainBorderRadius()),
                  ),
                ),
                child: TextField(
                  controller: tabHeaderController,
                  onChanged: (value) {
                    _detailsProvider.tabContent[widget.tabIndex]
                            [widget.fieldIndex] =
                        _detailsProvider.tabContent[widget.tabIndex]
                                [widget.fieldIndex]
                            .copyWith(tabContentHeader: value);
                  },
                  style: BodySmall()
                      .copyWith(color: Colors.white.withOpacity(0.9)),
                  maxLines: null,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
              //content body
              Container(
                width: screenWidth * 0.3,
                padding: EdgeInsets.only(
                  left: screenWidth * 0.01,
                  right: screenWidth * 0.01,
                ),
                decoration: BoxDecoration(
                  color: secondaryColor(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(MainBorderRadius()),
                    bottomRight: Radius.circular(MainBorderRadius()),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: tabBodyController,
                        onChanged: (value) {
                          _detailsProvider.tabContent[widget.tabIndex]
                                  [widget.fieldIndex] =
                              _detailsProvider.tabContent[widget.tabIndex]
                                      [widget.fieldIndex]
                                  .copyWith(tabContentBody: value);
                        },
                        style: BodySmall()
                            .copyWith(color: Colors.white.withOpacity(0.9)),
                        maxLines: null,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _detailsProvider.updateFieldHeader(widget.tabIndex,
                              widget.fieldIndex, tabHeaderController.text);
                          _detailsProvider.updateFieldBody(widget.tabIndex,
                              widget.fieldIndex, tabBodyController.text);
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white.withOpacity(0.9),
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
