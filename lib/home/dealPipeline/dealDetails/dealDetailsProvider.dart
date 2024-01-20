import 'package:flutter/material.dart';
import 'package:incube/models/ModelProvider.dart';

class DealDetailsProvider extends ChangeNotifier {
  List<String> tabList = [];
  List<String> tabTitles = [];
  List<List<tabDetails>> tabContent = [];
  List<Meeting> calender = [];
  List<String> documentsName = [];
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
  void addMeeting(Meeting meeting) {
    calender.add(meeting);
    Future.microtask(() => notifyListeners());
  }

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

  void updateFieldHeader(int tabIndex, int fieldIndex, String header) {
    var updatedDetails =
        tabContent[tabIndex][fieldIndex].copyWith(tabContentHeader: header);
    tabContent[tabIndex][fieldIndex] = updatedDetails;
    Future.microtask(() => notifyListeners());
  }

  void updateFieldBody(int tabIndex, int fieldIndex, String body) {
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
