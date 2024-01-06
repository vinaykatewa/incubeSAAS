import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/ModelProvider.dart';
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
  // List<TextEditingController> _controllers = [];
  bool isLoading = false;
  // List<String> tabList = ['Tab 1', 'Tab 2', 'Tab 3'];
  // List<List<tabDetails>> tabContent = [
  //   [tabDetails(tabContentHeader: "Header 1", tabContentBody: "Body 1")],
  //   [tabDetails(tabContentHeader: "Header 2", tabContentBody: "Body 2")],
  //   [tabDetails(tabContentHeader: "Header 3", tabContentBody: "Body 3")],
  // ];

  // void _onTextChanged(int index, String value) {
  //   setState(() {
  //     tabList[index] = value;
  //   });
  // }

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
                                borderRadius: BorderRadius.circular(10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  tabContentModel: TabContentModel(
                                    title: "title $index",
                                    content: "content $index",
                                  ),
                                  controller:
                                      _detailsProvider.controllers[index],
                                ),
                                Container(
                                  width: screenWidth * 0.9,
                                  height: screenHeight * 0.6,
                                  child: Center(
                                    child: Builder(builder: (context) {
                                      TabController tabController =
                                          DefaultTabController.of(context);
                                      return ListView.builder(
                                        itemCount: _detailsProvider
                                            .tabContent[tabController.index]
                                            .length,
                                        itemBuilder: (context, itemIndex) {
                                          return TabViewModel(
                                            tabIndex: tabController.index,
                                            fieldIndex: itemIndex,
                                            tabContentModel: TabContentModel(
                                              title: _detailsProvider
                                                  .tabContent[tabController
                                                      .index][itemIndex]
                                                  .tabContentHeader,
                                              content: _detailsProvider
                                                  .tabContent[tabController
                                                      .index][itemIndex]
                                                  .tabContentBody,
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        borderRadiusAuth()),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFb5454fb),
                                        Color(0xFF000649),
                                      ],
                                    ),
                                  ),
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
                                    child: const Text("Add field"),
                                  ),
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
  final TabContentModel tabContentModel;
  final TextEditingController controller;
  const TabTitle(
      {Key? key, required this.tabContentModel, required this.controller})
      : super(key: key);
  @override
  State<TabTitle> createState() => _TabTitleState();
}

class _TabTitleState extends State<TabTitle> {
  TextEditingController tabTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                readOnly: true,
                decoration: InputDecoration(
                  labelText: widget.tabContentModel.title,
                  labelStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.4285714286,
                      color: const Color.fromRGBO(0, 0, 0, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
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
                color: const Color.fromRGBO(0, 0, 0, 1)),
          ),
          //content body
          Container(
            width: screenWidth * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.controller,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: widget.tabContentModel.content,
                  labelStyle: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.4285714286,
                      color: textColor()),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    borderRadius: BorderRadius.circular(borderRadiusAuth()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
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
                    controller: tabHeaderController,
                    maxLines: null,
                    onChanged: (value) {
                      _detailsProvider.updateFieldHeader(
                          widget.tabIndex, widget.fieldIndex, value);
                    },
                    decoration: InputDecoration(
                      // labelText: widget.tabContentModel.title,
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.4285714286,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(borderRadiusAuth()),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(borderRadiusAuth()),
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
                    color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
              //content body
              Container(
                width: screenWidth * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: tabBodyController,
                    maxLines: null,
                    onChanged: (value) {
                      _detailsProvider.updateFieldBody(
                          widget.tabIndex, widget.fieldIndex, value);
                    },
                    decoration: InputDecoration(
                      // labelText: widget.tabContentModel.content,
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.4285714286,
                          color: textColor()),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(borderRadiusAuth()),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(borderRadiusAuth()),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
