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
  List<TextEditingController> _controllers = [];
  bool isLoading = false;
  List<String> tabList = ['Tab 1', 'Tab 2', 'Tab 3'];
  List<List<Widget>> tabBarViewList = [
    [
      TabViewModel(
        tabContentModel: TabContentModel(title: "", content: ""),
      )
    ],
    [
      TabViewModel(
        tabContentModel: TabContentModel(title: "", content: ""),
      )
    ],
    [
      TabViewModel(
        tabContentModel: TabContentModel(title: "", content: ""),
      )
    ],
  ];
  @override
  void initState() {
    super.initState();
    _controllers =
        tabList.map((tab) => TextEditingController(text: tab)).toList();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    setState(() {
      tabList[index] = value;
    });
  }

  void setTabs() {}
  void addField(int tabIndex) {
    setState(() {
      tabBarViewList[tabIndex].add(TabViewModel(
          tabContentModel: TabContentModel(title: "", content: "")));
    });
  }

  void addTab() {
    setState(() {
      int index = tabList.length;
      tabList.add("Tab $index");
      tabBarViewList.add([
        TabViewModel(
          tabContentModel: TabContentModel(title: "", content: ""),
        )
      ]);
    });
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
          body: Container(
            color: tertiaryColor1(),
            padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: screenWidth * 0.01),
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
                    IconButton(
                        onPressed: () {
                          addTab();
                        },
                        icon: const Icon(Icons.add))
                  ],
                ),
                Builder(builder: (context) {
                  return TabBar(
                    labelStyle: LabelLarge()
                        .copyWith(color: Colors.white.withOpacity(0.9)),
                    labelColor: Colors.white.withOpacity(0.9),
                    unselectedLabelColor: textColor().withOpacity(0.5),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryColor(),
                    ),
                    onTap: (value) {
                      TabController tabController =
                          DefaultTabController.of(context);
                      int previousIndex = tabController.previousIndex;
                      setState(() {
                        tabList[previousIndex] =
                            _controllers[previousIndex].text;
                      });
                    },
                    tabs: tabList.map((String tab) {
                      return Tab(
                        text: tab,
                      );
                    }).toList(),
                  );
                }),
                SizedBox(height: screenHeight * 0.05),
                Expanded(
                  child: TabBarView(
                    children: tabList.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TabTitle(
                                tabContentModel: TabContentModel(
                                    title: "title $index",
                                    content: "content $index"),
                                controller: _controllers[index]),
                            Container(
                              width: screenWidth * 0.9,
                              height: screenHeight * 0.6,
                              child: Center(
                                child: ListView.builder(
                                  itemCount: tabBarViewList[index].length,
                                  itemBuilder: (context, itemIndex) {
                                    return tabBarViewList[index][itemIndex];
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadiusAuth()),
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
                                    addField(index);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          borderRadiusAuth()),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: Text("Add field")),
                            )
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
  const TabViewModel({Key? key, required this.tabContentModel})
      : super(key: key);
  @override
  State<TabViewModel> createState() => _TabViewModelState();
}

class _TabViewModelState extends State<TabViewModel> {
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
                controller: tabTitleController,
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
