import 'package:flutter/material.dart';
import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/models/ModelProvider.dart';

class DealDetailsProvider extends ChangeNotifier {
  List<String> tabList = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];
  List<String> tabTitles = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];
  List<List<tabDetails>> tabContent = [
    [
      tabDetails(
          tabContentHeader: 'About the company1 /// 1',
          tabContentBody:
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.'),
      tabDetails(
          tabContentHeader: 'About the company1 /// 2',
          tabContentBody:
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
    ],
    [
      tabDetails(
          tabContentHeader: 'About the company2',
          tabContentBody:
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
    ],
    [
      tabDetails(
          tabContentHeader: 'About the company3',
          tabContentBody:
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
    ],
    [
      tabDetails(
          tabContentHeader: 'About the company',
          tabContentBody:
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla. Elit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus.')
    ],
  ];
  // List<Meeting> calender = [
  // ];
  List<CalenderModel> calender = [
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
  ];
  List<String> documentsName = [
    'Spotify',
    'Report',
  ];
  List<String> documentsList = [];

  List<TextEditingController> _controllers = [];

  DealDetailsProvider() {
    _controllers =
        tabList.map((tab) => TextEditingController(text: tab)).toList();
  }
  set controllers(List<TextEditingController> value) {
    _controllers = value;
    Future.microtask(() => notifyListeners());
  }

  List<TextEditingController> get controllers => _controllers;
  // void addMeeting(Meeting meeting) {
  //   calender.add(meeting);
  //   Future.microtask(() => notifyListeners());
  // }

  void addDocumentName(String name) {
    documentsName.add(name);
    Future.microtask(() => notifyListeners());
  }

  void addDocument(String document) {
    documentsList.add(document);
    Future.microtask(() => notifyListeners());
  }

  void addTab(String tabTitle) {
    tabList.add(tabTitle);
    tabTitles.add(tabTitle);
    _controllers.add(TextEditingController(text: tabTitle));
    tabContent.add([
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    ]);
    Future.microtask(() => notifyListeners());
  }

  void updateFieldHeader(
      {required int tabIndex,
      required int fieldIndex,
      required String header}) {
    var updatedDetails =
        tabContent[tabIndex][fieldIndex].copyWith(tabContentHeader: header);
    tabContent[tabIndex][fieldIndex] = updatedDetails;
    Future.microtask(() => notifyListeners());
  }

  void updateFieldBody(
      {required int tabIndex, required int fieldIndex, required String body}) {
    var updatedDetails =
        tabContent[tabIndex][fieldIndex].copyWith(tabContentBody: body);
    tabContent[tabIndex][fieldIndex] = updatedDetails;
    Future.microtask(() => notifyListeners());
  }

  void deleteTab(int index) {
    tabList.removeAt(index);
    _controllers.removeAt(index);
    tabTitles.removeAt(index);
    tabContent.removeAt(index);
    Future.microtask(() => notifyListeners());
  }

  void addField(int tabIndex) {
    _controllers.add(TextEditingController());
    tabContent[tabIndex].add(
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    );
    Future.microtask(() => notifyListeners());
  }
}
