// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/hometemp/dashboard/ChartSheet/data_widget.dart';
import 'package:incube/hometemp/dealPipeline/dealDetails/dealDetailsProvider.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/DealsCall.dart';
import 'package:incube/models/tabDetails.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:incube/uiThemes.dart';

class DealDetails extends StatefulWidget {
  Deals currentDeal;
  DealDetails({
    Key? key,
    required this.currentDeal,
  }) : super(key: key);

  @override
  State<DealDetails> createState() => _DealDetailsState();
}

class _DealDetailsState extends State<DealDetails> {
  var screenWidth;
  var screenHeight;
  int _selectedTab = 0;
  bool editingField = false;
  TextEditingController tabController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    settingProvider();
  }

  void settingProvider() {
    setState(() {
      isLoading = true;
    });
    final DealDetailsProvider dealDetailProvider =
        Provider.of<DealDetailsProvider>(context, listen: false);
    dealDetailProvider.tabList = widget.currentDeal.calls.tabList;
    dealDetailProvider.tabTitles = widget.currentDeal.calls.tabTitles;
    dealDetailProvider.tabContent = widget.currentDeal.calls.tabContent
        .map((tabContentList) => tabContentList.tabDetailsList)
        .toList();
    // dealDetailProvider.calender = widget.deal.meetings;
    // dealDetailProvider.documentsName = widget.currentDeal.documents;
    dealDetailProvider.controllers = dealDetailProvider.tabList
        .map((tab) => TextEditingController(text: tab))
        .toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });

    Future<void> showAlert(BuildContext context, String header, String body,
        int tabIndex, int fieldIndex) async {
      TextEditingController headerController =
          TextEditingController(text: header);
      TextEditingController bodyController = TextEditingController(text: body);
      DealDetailsProvider _dealDetailsProvider =
          Provider.of<DealDetailsProvider>(context, listen: false);

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit your details'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: headerController,
                    // decoration: InputDecoration(hintText: "Header"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: bodyController,
                    // decoration: InputDecoration(hintText: "Body"),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Save'),
                onPressed: () {
                  _dealDetailsProvider.updateFieldHeader(
                      tabIndex: tabIndex,
                      fieldIndex: fieldIndex,
                      header: headerController.text);

                  _dealDetailsProvider.updateFieldBody(
                      tabIndex: tabIndex,
                      fieldIndex: fieldIndex,
                      body: bodyController.text);

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return isLoading
        ? Container(
            padding: EdgeInsets.only(
                top: 48 * 0.001271 * screenHeight,
                // bottom: 10 * 0.001271 * screenHeight,
                left: 32 * 0.000651 * screenWidth,
                right: 32 * 0.000651 * screenWidth),
            child: const CircularProgressIndicator())
        : Consumer<DealDetailsProvider>(
            builder: (context, _detailsProvider, child) {
            int globalTabCount = _detailsProvider.tabList.length + 1;
            return DefaultTabController(
              length: _detailsProvider.tabList.length,
              child: Container(
                padding: EdgeInsets.only(
                    top: 48 * 0.001271 * screenHeight,
                    // bottom: 10 * 0.001271 * screenHeight,
                    left: 32 * 0.000651 * screenWidth,
                    right: 32 * 0.000651 * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //page header
                    header(),
                    SizedBox(
                      height: 24 * 0.001271 * screenHeight,
                    ),
                    Container(
                      height: 44 * 0.001271 * screenHeight,
                      // width: 797 * 0.000651 * screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 44 * 0.001271 * screenHeight,
                            width: 885 * 0.000651 * screenWidth,
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: _detailsProvider.tabList
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int idx = entry.key;
                                  String tab = entry.value;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedTab = idx;
                                        tabController.text = tab;
                                        editingField = false;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  4 * 0.000651 * screenWidth),
                                          padding: EdgeInsets.only(
                                              top: 8 * 0.001271 * screenHeight,
                                              bottom:
                                                  8 * 0.001271 * screenHeight,
                                              left: 12 * 0.000651 * screenWidth,
                                              right:
                                                  12 * 0.000651 * screenWidth),
                                          decoration: BoxDecoration(
                                              color: _selectedTab == idx
                                                  ? Color(0xFFFFFFFF)
                                                  : Color(0xFFFFFFFF)
                                                      .withOpacity(0),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          width: 60 * 0.000651 * screenWidth,
                                          child: Center(
                                            child: editingField &&
                                                    _selectedTab == idx
                                                ? TextField(
                                                    controller: tabController,
                                                    style: textSmSemibold(
                                                            0.000651 *
                                                                screenWidth)
                                                        .copyWith(
                                                            color:
                                                                greyColor700()),
                                                  )
                                                : Text(tab,
                                                    style: _selectedTab == idx
                                                        ? textSmSemibold(
                                                                0.000651 *
                                                                    screenWidth)
                                                            .copyWith(
                                                                color:
                                                                    greyColor700())
                                                        : textSmSemibold(
                                                                0.000651 *
                                                                    screenWidth)
                                                            .copyWith(
                                                                color:
                                                                    greyColor500())),
                                          ),
                                        ),
                                        if (idx ==
                                            _detailsProvider.tabList.length - 1)
                                          GestureDetector(
                                            onTap: () {
                                              _detailsProvider.addTab(
                                                  "tab $globalTabCount");
                                              globalTabCount++;
                                            },
                                            child: Container(
                                              height:
                                                  36 * 0.001271 * screenHeight,
                                              width:
                                                  84 * 0.000651 * screenWidth,
                                              padding: EdgeInsets.only(
                                                  top: 8 *
                                                      0.001271 *
                                                      screenHeight,
                                                  bottom: 8 *
                                                      0.001271 *
                                                      screenHeight,
                                                  left: 12 *
                                                      0.000651 *
                                                      screenWidth,
                                                  right: 12 *
                                                      0.000651 *
                                                      screenWidth),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  border: Border.all(
                                                      color: greyColor200(),
                                                      width: 1 *
                                                          0.000651 *
                                                          screenWidth),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Text(
                                                'Add new',
                                                style: textSmSemibold(
                                                        0.000651 * screenWidth)
                                                    .copyWith(
                                                        color: blueColor600()),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24 * 0.000651 * screenWidth,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40 * 0.001271 * screenHeight,
                              width: 141 * 0.000651 * screenWidth,
                              padding: EdgeInsets.only(
                                  top: 10 * 0.001271 * screenHeight,
                                  bottom: 10 * 0.001271 * screenHeight,
                                  left: 14 * 0.000651 * screenWidth,
                                  right: 14 * 0.000651 * screenWidth),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border.all(
                                      color: blueColor300(),
                                      width: 1 * 0.000651 * screenWidth),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'Add new details',
                                style: textSmSemibold(0.000651 * screenWidth)
                                    .copyWith(color: blueColor700()),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24 * 0.000651 * screenWidth,
                          ),
                          editingField == true
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      editingField = false;
                                    });
                                    _detailsProvider.tabList[_selectedTab] =
                                        tabController.text;
                                  },
                                  child: Container(
                                    height: 40 * 0.001271 * screenHeight,
                                    width: 83 * 0.000651 * screenWidth,
                                    padding: EdgeInsets.only(
                                        top: 10 * 0.001271 * screenHeight,
                                        bottom: 10 * 0.001271 * screenHeight,
                                        left: 14 * 0.000651 * screenWidth,
                                        right: 10 * 0.000651 * screenWidth),
                                    decoration: BoxDecoration(
                                        color: blueColor600(),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20 * 0.001271 * screenHeight,
                                          width: 20 * 0.000651 * screenWidth,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                                Color(0xFFFFFFFF),
                                                BlendMode
                                                    .modulate), // change the color as needed
                                            child: Image.asset(
                                                'assets/editIcon.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6 * 0.000651 * screenWidth,
                                        ),
                                        Text(
                                          'Save',
                                          style: textSmSemibold(
                                                  0.000651 * screenWidth)
                                              .copyWith(
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      editingField = true;
                                    });
                                  },
                                  child: Container(
                                    height: 40 * 0.001271 * screenHeight,
                                    width: 83 * 0.000651 * screenWidth,
                                    padding: EdgeInsets.only(
                                        top: 10 * 0.001271 * screenHeight,
                                        bottom: 10 * 0.001271 * screenHeight,
                                        left: 14 * 0.000651 * screenWidth,
                                        right: 14 * 0.000651 * screenWidth),
                                    decoration: BoxDecoration(
                                        color: blueColor600(),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20 * 0.001271 * screenHeight,
                                          width: 20 * 0.000651 * screenWidth,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                                Color(0xFFFFFFFF),
                                                BlendMode
                                                    .modulate), // change the color as needed
                                            child: Image.asset(
                                                'assets/editIcon.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6 * 0.000651 * screenWidth,
                                        ),
                                        Text(
                                          'Edit',
                                          style: textSmSemibold(
                                                  0.000651 * screenWidth)
                                              .copyWith(
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    //spacing b/w header and body
                    SizedBox(
                      height: 32 * 0.001271 * screenHeight,
                    ),
                    // body(),
                    Container(
                      height: 513 * 0.001271 * screenHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 8 * 0.001271 * screenHeight),
                            width: 640 * 0.000651 * screenWidth,
                            child: SingleChildScrollView(
                              child: Column(
                                children: _detailsProvider
                                    .tabContent[_selectedTab]
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int fieldIndex = entry.key;
                                  tabDetails details = entry.value;
                                  String header = details.tabContentHeader;
                                  String body = details.tabContentBody;
                                  return Container(
                                    margin: EdgeInsets.only(
                                        bottom: 32 * 0.001271 * screenHeight),
                                    width: 670 * 0.000651 * screenWidth,
                                    padding: EdgeInsets.only(
                                        top: 16 * 0.001271 * screenHeight,
                                        bottom: 16 * 0.001271 * screenHeight,
                                        left: 16 * 0.000651 * screenWidth,
                                        right: 16 * 0.000651 * screenWidth),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        border: Border.all(
                                            color: greyColor100(),
                                            width: 1 * 0.000651 * screenWidth),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              header,
                                              style: textLgMedium(
                                                      0.000651 * screenWidth)
                                                  .copyWith(
                                                      color: greyColor900()),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showAlert(context, header, body,
                                                    _selectedTab, fieldIndex);
                                              },
                                              child: Text(
                                                'Edit',
                                                style: textSmMedium(
                                                        0.000651 * screenWidth)
                                                    .copyWith(
                                                        color: blueColor600()),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20 * 0.001271 * screenHeight,
                                        ),
                                        Divider(
                                          color: greyColor200(),
                                        ),
                                        SizedBox(
                                          height: 20 * 0.001271 * screenHeight,
                                        ),
                                        Text(
                                          body +
                                              'vdfvkjnnnnnnnnnnnnnnnnnffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
                                          style: textMdRegular(
                                                  0.000651 * screenWidth)
                                              .copyWith(color: greyColor600()),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 38 * 0.000651 * screenWidth,
                          ),
                          Column(
                            children: [
                              Calender(),
                              SizedBox(
                                height: 16 * 0.001271 * screenHeight,
                              ),
                              documents(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
  }

  Widget header() {
    Widget tagname() {
      return Container(
        height: 28 * 0.001271 * screenHeight,
        width: 328 * 0.000651 * screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 4 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/homeIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/slashIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            // SizedBox(width: 8 * 0.000651 * screenWidth),
            Text(
              'deal pipeline',
              style: textSmMedium(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
            ),
            SizedBox(width: 12 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/slashIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            // SizedBox(width: 8 * 0.000651 * screenWidth),
            Text(
              'details',
              style: textSmSemibold(0.000651 * screenWidth)
                  .copyWith(color: blueColor700()),
            ),
          ],
        ),
      );
    }

    Widget pagetitle() {
      return Container(
        height: 62 * 0.001271 * screenHeight,
        width: 1057 * 0.000651 * screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.currentDeal.company_name,
              style: displaySmSemibold(0.000651 * screenWidth)
                  .copyWith(color: greyColor900()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4 * 0.001271 * screenHeight,
            ),
            Text(
              widget.currentDeal.company_description,
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tagname(),
        SizedBox(
          height: 20 * 0.001271 * screenHeight,
        ),
        pagetitle(),
      ],
    );
  }

  Widget Calender() {
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return Container(
          height: 242 * 0.001271 * screenHeight,
          // width: 360 * 0.000651 * screenWidth,
          padding: EdgeInsets.only(
              top: 16 * 0.001271 * screenHeight,
              // bottom: 16 * 0.001271 * screenHeight,
              left: 12 * 0.000651 * screenWidth,
              right: 12 * 0.000651 * screenWidth),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                  color: greyColor100(), width: 1 * 0.000651 * screenWidth),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 356 * 0.000651 * screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming activities',
                      style: textLgBold(0.000651 * screenWidth)
                          .copyWith(color: greyColor900()),
                    ),
                    Icon(
                      Icons.list,
                      color: greyColor400(),
                    )
                  ],
                ),
              ),
              Container(
                height: 190 * 0.001271 * screenHeight,
                width: 336 * 0.000651 * screenWidth,
                child: ListView(
                  children: _detailsProvider.calender.map((tab) {
                    return CalenderContainer(tab);
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget CalenderContainer(CalenderModel cal) {
    return SizedBox(
      width: 360 * 0.000651 * screenWidth,
      child: Column(
        children: [
          Divider(
            color: greyColor200(),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 48 * 0.001271 * screenHeight,
                    width: 48 * 0.000651 * screenWidth,
                    child: Image.asset('assets/calendarAvatar.png')),
                SizedBox(
                  width: 12 * 0.000651 * screenWidth,
                ),
                SizedBox(
                  // height: 48 * 0.001271 * screenHeight,
                  width: 276 * 0.000651 * screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cal.title,
                        style: textSmMedium(0.000651 * screenWidth)
                            .copyWith(color: greyColor700()),
                      ),
                      SizedBox(
                        height: 8 * 0.001271 * screenHeight,
                      ),
                      Text(
                        cal.timings,
                        style: textXsSemibold(0.000651 * screenWidth)
                            .copyWith(color: greyColor600()),
                      ),
                      Text(
                        cal.description,
                        style: textSmRegular(0.000651 * screenWidth)
                            .copyWith(color: greyColor600()),
                      ),
                    ],
                  ),
                )
              ]),
        ],
      ),
    );
  }

  Widget documents() {
    return Consumer<DealDetailsProvider>(
      builder: (context, _detailsProvider, child) {
        return Container(
          height: 250 * 0.001271 * screenHeight,
          // width: 360 * 0.000651 * screenWidth,
          padding: EdgeInsets.only(
              top: 16 * 0.001271 * screenHeight,
              // bottom: 16 * 0.001271 * screenHeight,
              left: 12 * 0.000651 * screenWidth,
              right: 12 * 0.000651 * screenWidth),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              border: Border.all(
                  color: greyColor100(), width: 1 * 0.000651 * screenWidth),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 336 * 0.000651 * screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Files',
                      style: textLgBold(0.000651 * screenWidth)
                          .copyWith(color: greyColor900()),
                    ),
                    Icon(
                      Icons.file_copy,
                      color: greyColor400(),
                    )
                  ],
                ),
              ),
              Container(
                height: 190 * 0.001271 * screenHeight,
                width: 356 * 0.000651 * screenWidth,
                child: ListView(
                  children: _detailsProvider.documentsName.map((tab) {
                    return documentContainer(tab);
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget documentContainer(String tab) {
    return SizedBox(
      height: 72 * 0.001271 * screenHeight,
      width: 366 * 0.000651 * screenWidth,
      child: Column(
        children: [
          Divider(
            color: greyColor200(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 48 * 0.001271 * screenHeight,
                  width: 48 * 0.000651 * screenWidth,
                  child: Image.asset('assets/filesIcon.png')),
              SizedBox(
                height: 20 * 0.001271 * screenHeight,
                child: Text(
                  tab,
                  style: textSmBold(0.000651 * screenWidth)
                      .copyWith(color: greyColor900()),
                ),
              ),
              SizedBox(
                width: 210 * 0.000651 * screenWidth,
              ),
              SizedBox(
                height: 20 * 0.001271 * screenHeight,
                child: Text(
                  'open',
                  style: textSmSemibold(0.000651 * screenWidth)
                      .copyWith(color: greyColor600()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
