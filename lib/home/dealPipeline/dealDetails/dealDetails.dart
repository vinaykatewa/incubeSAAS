import 'dart:io';
import 'dart:typed_data';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/ModelProvider.dart';
import 'package:incube/provider.dart';
import 'package:incube/uiThemes.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:file_picker/file_picker.dart';

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
  var documentLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      documentLoading = true;
    });
    gettingDocument(context);
    setState(() {
      documentLoading = true;
    });
  }

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
    Deals updatedDeal = dealList[dealIndex].copyWith(
        calls: specificDealCall, documents: dealDetailProvider.documentsName);
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
                    bottom: screenHeight * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.2,
                        color: Colors.blueGrey,
                      ),
                    ),
                    VerticalDivider(
                      color: secondaryColor(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Text(
                            widget.deal.company_name,
                            style:
                                TitleLarge().copyWith(color: secondaryColor()),
                          ),
                          Divider(
                            color: secondaryColor(),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Expanded(
                            flex: 1,
                            child: Builder(builder: (context) {
                              return TabBar(
                                isScrollable: true,
                                // labelStyle: LabelLarge().copyWith(
                                //     color: Colors.white.withOpacity(0.9)),
                                labelColor: Colors.white.withOpacity(0.9),
                                unselectedLabelColor:
                                    textColor().withOpacity(0.5),
                                // indicator: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(
                                //       MainBorderRadius()),
                                //   color: secondaryColor(),
                                // ),
                                onTap: (value) {
                                  TabController tabController =
                                      DefaultTabController.of(context);
                                  int previousIndex =
                                      tabController.previousIndex;
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
                                      Container(
                                        decoration: BoxDecoration(
                                          color: index ==
                                                  _detailsProvider.tabList
                                                      .indexWhere((element) =>
                                                          element == tab)
                                              ? secondaryColor()
                                              : secondaryColor()
                                                  .withOpacity(0.7),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MainBorderRadius())),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.01,
                                            ),
                                            Tab(
                                              child: Text(
                                                tab,
                                                style: BodySmall().copyWith(
                                                    color: _detailsProvider
                                                                .controllers[
                                                                    index]
                                                                .text ==
                                                            tab
                                                        ? Colors.white
                                                        : Colors.white
                                                            .withOpacity(0.7)),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                safePrint(
                                                    'we are providing this index: $index');
                                                safePrint(
                                                    'we are providing this tab: ${_detailsProvider.tabList[index - 1]}');
                                                safePrint(
                                                    'we are providing this tabContent: ${_detailsProvider.tabContent[index]}');
                                                _detailsProvider
                                                    .deleteTab(index);
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: _detailsProvider
                                                            .controllers[index]
                                                            .text ==
                                                        tab
                                                    ? Colors.white
                                                    : Colors.white
                                                        .withOpacity(0.7),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      if (index ==
                                          _detailsProvider.tabList.length - 1)
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: secondaryColor(),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              _detailsProvider.addTab(
                                                  "tab $globalTabCount");
                                              globalTabCount++;
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                }).toList(),
                              );
                            }),
                          ),
                          // SizedBox(height: screenHeight * 0.02),
                          Expanded(
                            flex: 5,
                            child: TabBarView(
                              children: _detailsProvider.tabList
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TabTitle(
                                        tabIndex: index,
                                        title:
                                            _detailsProvider.tabTitles[index],
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
                                                DefaultTabController.of(
                                                    context);
                                            return ListView.builder(
                                              itemCount: _detailsProvider
                                                  .tabContent[
                                                      tabController.index]
                                                  .length,
                                              itemBuilder:
                                                  (context, itemIndex) {
                                                return Column(
                                                  children: [
                                                    TabViewModel(
                                                      tabIndex:
                                                          tabController.index,
                                                      fieldIndex: itemIndex,
                                                      tabContentModel:
                                                          TabContentModel(
                                                        title: _detailsProvider
                                                            .tabContent[
                                                                tabController
                                                                    .index]
                                                                [itemIndex]
                                                            .tabContentHeader,
                                                        content: _detailsProvider
                                                            .tabContent[
                                                                tabController
                                                                    .index]
                                                                [itemIndex]
                                                            .tabContentBody,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: screenHeight *
                                                            0.01),
                                                  ],
                                                );
                                              },
                                            );
                                          }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Divider(
                                        color: secondaryColor(),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                              text: "field",
                                              onPressed: () {
                                                _detailsProvider
                                                    .addField(index);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              screenWidth: screenWidth),
                                          SizedBox(
                                            width: screenWidth * 0.008,
                                          ),
                                          CustomButton(
                                              text: "Calender",
                                              onPressed: () {
                                                _calendar(context);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                              ),
                                              screenWidth: screenWidth),
                                          SizedBox(
                                            width: screenWidth * 0.008,
                                          ),
                                          CustomButton(
                                              text: "Save the edits",
                                              onPressed: () {
                                                saveDataInDB(context, index);
                                              },
                                              icon: Icon(Icons.save,
                                                  color: Colors.white
                                                      .withOpacity(0.9)),
                                              screenWidth: screenWidth),
                                          CustomButton(
                                              text: "upload file",
                                              onPressed: () {
                                                openFilePicker(context,
                                                    widget.deal.idDeal);
                                              },
                                              icon: Icon(Icons.save,
                                                  color: Colors.white
                                                      .withOpacity(0.9)),
                                              screenWidth: screenWidth),
                                        ],
                                      ),
                                      Divider(
                                        color: secondaryColor(),
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
                    VerticalDivider(
                      color: secondaryColor(),
                    ),
                    ////////////////////////////////////////////////////////////////
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.2,
                            child: buildCalender(),
                          ),
                          SizedBox(
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.2,
                            child: documentsWidget(context),
                          ),
                        ],
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

  Widget documentsWidget(BuildContext context) {
    return
        // documentLoading
        //     ? ElevatedButton(
        //         onPressed: () {
        //           setState(() {
        //             documentLoading = true;
        //           });
        //           gettingDocument(context);
        //           setState(() {
        //             documentLoading = true;
        //           });
        //         },
        //         child: const Text('Refresh'))
        //     :
        Consumer<DealDetailsProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.documentsList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'title: $index ${provider.documentsList[index]}',
                style: TitleLarge().copyWith(color: secondaryColor()),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Container();
                    // AlertDialog(
                    //   content:
                    //       SfPdfViewer.memory(provider.documentsList[index]),
                    // );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void gettingDocument(BuildContext context) async {
    //iterate the name list
    final DealDetailsProvider detailProvider = DealDetailsProvider();
    final ApiCalls apiCalls = ApiCalls();
    for (String s in detailProvider.documentsName) {
      Uint8List? ourDoc = await apiCalls.getItemByName(s);
      if (ourDoc == null) {
        safePrint('In gettingDocument, we got ourdocument as null');
        return;
      }
      detailProvider.addDocument(ourDoc);
    }
  }

  void openFilePicker(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final ApiCalls apiCallClass = ApiCalls();
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Please select the file'),
              content: ElevatedButton(
                child: const Text('Select File'),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    if (result.files.first.bytes != null) {
                      safePrint(
                          'In openFilePicker, platformFile name is: ${result.files.first.name}');
                      apiCallClass.putItemsInS3(
                          result.files.first.name, result.files.first.bytes!);
                    }
                    if (result.files.first.bytes == null) {
                      safePrint('In openFilePicker, bytes is null');
                    }
                    Navigator.of(context).pop();
                  }
                  if (result == null) {
                    safePrint('result is null');
                  }
                },
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildCalender() {
    return Consumer<DealDetailsProvider>(
      builder: (context, _dealDetailProvider, child) {
        return ListView.builder(
          itemCount: _dealDetailProvider.calender.length,
          itemBuilder: (context, index) {
            Meeting meeting = _dealDetailProvider.calender[index];
            DateTime meetingDateTime;
            try {
              meetingDateTime =
                  DateFormat('EEEE, yyyy-MM-dd – kk:mm').parse(meeting.date);
            } catch (e) {
              // Handle the exception
              print('Invalid date format: ${meeting.date}');
              return Container(); // Return an empty container
            }

            return Column(
              children: <Widget>[
                Text(
                  DateFormat('EEEE').format(meetingDateTime), // Weekday
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  DateFormat('d').format(meetingDateTime), // Date
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time), // Clock icon
                    Text(
                      DateFormat('hh:mm a').format(meetingDateTime), // Time
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  meeting.link, // Meeting link
                  style: TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _calendar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController linkController = TextEditingController();
        DateTime selectedDate = DateTime.now();
        TimeOfDay selectedTime = TimeOfDay.now();

        return AlertDialog(
          title: Text('Add Meeting'),
          content: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text("Select date and time"),
                onPressed: () async {
                  // Show the date picker
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;

                    // Show the time picker
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (pickedTime != null) {
                      selectedTime = pickedTime;
                    }
                  }
                },
              ),
              TextField(
                controller: linkController,
                decoration: InputDecoration(hintText: "Enter meeting link"),
              ),
            ],
          ),
          actions: <Widget>[
            Consumer<DealDetailsProvider>(
              builder: (context, _dealDetailProvider, child) {
                return TextButton(
                  child: Text(
                    'Save',
                    style: BodySmall()
                        .copyWith(color: secondaryColor().withOpacity(0.9)),
                  ),
                  onPressed: () {
                    // Format the date and time as a string
                    String formattedDate =
                        DateFormat('EEEE, yyyy-MM-dd – kk:mm').format(DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    ));

                    // Create a new Meeting object
                    Meeting newMeeting = Meeting(
                      date: formattedDate,
                      link: linkController.text,
                    );

                    // Add the new meeting to the provider's list
                    _dealDetailProvider.addMeeting(newMeeting);
                    safePrint(
                        "we have added this meeting to the list: ${_dealDetailProvider.calender[0].date}");

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ],
        );
      },
    );
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
        return SizedBox(
          width: screenWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
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
              ),
              //content body
              Expanded(
                flex: 4,
                child: Container(
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

  final ApiCalls apiCallClass = ApiCalls();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return SizedBox(
          width: screenWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: screenWidth * 0.05,
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
              ),
              //content body
              Expanded(
                flex: 4,
                child: Container(
                  width: screenWidth * 0.25,
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                          onPressed: () async {
                            // final url =
                            //     Uri.parse("http://localhost:5000/prompt");
                            // final response = await http
                            //     .post(url, body: {'key': 'api prompt'});
                            // safePrint('Response status: ${response.statusCode}');
                            // safePrint('Response body: ${response.body}');
                          },
                          icon: Icon(
                            Icons.generating_tokens_outlined,
                            color: Colors.white.withOpacity(0.9),
                          )),
                      IconButton(
                          onPressed: () async {
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
              ),
            ],
          ),
        );
      },
    );
  }
}
