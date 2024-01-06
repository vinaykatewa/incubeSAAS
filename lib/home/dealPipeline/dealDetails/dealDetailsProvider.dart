import 'package:flutter/material.dart';
import 'package:incube/models/ModelProvider.dart';

class DealDetailsProvider extends ChangeNotifier {
  List<String> tabList = ['Tab 1', 'Tab 2', 'Tab 3'];
  List<String> tabTitles = ['Title 1', 'Title 2', 'Title 3'];

  List<List<tabDetails>> tabContent = [
    [tabDetails(tabContentHeader: "Header 1", tabContentBody: "Body 1")],
    [
      tabDetails(tabContentHeader: "Header 2", tabContentBody: "Body 2"),
      tabDetails(tabContentHeader: "Header 2", tabContentBody: "Body 2")
    ],
    [
      tabDetails(tabContentHeader: "Header 3", tabContentBody: "Body 3"),
      tabDetails(tabContentHeader: "Header 3", tabContentBody: "Body 3"),
      tabDetails(tabContentHeader: "Header 3", tabContentBody: "Body 3"),
    ],
  ];
  List<TextEditingController> _controllers = [];

  DealDetailsProvider() {
    _controllers =
        tabList.map((tab) => TextEditingController(text: tab)).toList();
  }

  List<TextEditingController> get controllers => _controllers;

  void addTab(String tabTitle) {
    tabList.add(tabTitle);
    tabTitles.add(tabTitle);
    _controllers.add(TextEditingController(text: tabTitle));
    tabContent.add([
      tabDetails(tabContentHeader: "new header", tabContentBody: "new body"),
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
      tabDetails(tabContentHeader: "new header", tabContentBody: "new body"),
    );
    notifyListeners();
  }
}
