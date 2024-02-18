import 'package:flutter/material.dart';
import 'package:incube/models/usersPersonalSheets.dart';

class UserSheetsProvider extends ChangeNotifier {
  bool isLoading = true;
  List<List<Map<String, dynamic>>> allSheets = [];
  List<usersPersonalSheets> userSheets = [
    usersPersonalSheets(folderName: "Main files", googleSheet: [
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk",
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk"
    ]),
    usersPersonalSheets(folderName: "Secondary files", googleSheet: [
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk",
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk"
    ]),
    usersPersonalSheets(folderName: "Tertairy files", googleSheet: [
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk",
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk"
    ]),
  ];
  List<Folder> folders = [];

  void doneLoading() {
    isLoading = false;
    notifyListeners();
  }

  void addSheet(String temp, int index) {
    userSheets[index].googleSheet.add(temp);
    //call the api method and set folders list to make changes in the ui
    notifyListeners();
  }
}

class Folder {
  final String folderName;
  final List<List<Map<String, dynamic>>> sheets;

  Folder({required this.folderName, required this.sheets});
}
