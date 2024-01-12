import 'package:flutter/material.dart';
import 'package:incube/models/ModelProvider.dart';

class DealDetailsProvider extends ChangeNotifier {
  List<String> tabList = ['Tab 1', 'Tab 2', 'Tab 3'];
  List<String> tabTitles = ['Title 1', 'Title 2', 'Title 3'];
  List<Meeting> calender = [
    Meeting(
      date: 'Friday, 2024-01-12 – 17:10',
      link: 'https:google-meet',
    ),
  ];
  List<String> documentsName = ["Database.pdf"];
  List<String> documentsList = [];

  List<List<tabDetails>> tabContent = [
    [
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    ],
    [
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    ],
    [
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    ],
  ];
  List<TextEditingController> _controllers = [];

  DealDetailsProvider() {
    _controllers =
        tabList.map((tab) => TextEditingController(text: tab)).toList();
  }

  List<TextEditingController> get controllers => _controllers;
  void addMeeting(Meeting meeting) {
    calender.add(meeting);
    notifyListeners();
  }

  void addDocument(String document) {
    documentsList.add(document);
    notifyListeners();
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
    notifyListeners();
  }

  void updateFieldHeader(int tabIndex, int fieldIndex, String header) {
    var updatedDetails =
        tabContent[tabIndex][fieldIndex].copyWith(tabContentHeader: header);
    tabContent[tabIndex][fieldIndex] = updatedDetails;
    notifyListeners();
  }

  void updateFieldBody(int tabIndex, int fieldIndex, String body) {
    var updatedDetails =
        tabContent[tabIndex][fieldIndex].copyWith(tabContentBody: body);
    tabContent[tabIndex][fieldIndex] = updatedDetails;
    notifyListeners();
  }

  void deleteTab(int index) {
    tabList.removeAt(index);
    _controllers.removeAt(index);
    tabTitles.removeAt(index);
    tabContent.removeAt(index);
    notifyListeners();
  }

  void addField(int tabIndex) {
    _controllers.add(TextEditingController());
    tabContent[tabIndex].add(
      tabDetails(
          tabContentHeader: "context",
          tabContentBody:
              "provide prompt and our ai will generate text for you"),
    );
    notifyListeners();
  }
}
