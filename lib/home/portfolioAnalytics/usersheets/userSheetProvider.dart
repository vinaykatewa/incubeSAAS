import 'package:flutter/material.dart';
import 'package:incube/models/usersPersonalSheets.dart';

class UserSheetProvider extends ChangeNotifier {
  List<List<Map<String, dynamic>>> allSheets = [];
  List<usersPersonalSheets> userSheets = [
    usersPersonalSheets(folderName: "Yuta", googleSheet: [
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk",
      "1rShG0F1Cn6eX0RXnZGf3s-XWcNX21h4LNZ2QpP7Hmwk"
    ])
  ];

  // Add an item to the list
  void addUserSheet(usersPersonalSheets newUserSheet) {
    userSheets.add(newUserSheet);
    notifyListeners();
  }

  void addnewSheet(usersPersonalSheets newUserSheet) {
    userSheets.add(newUserSheet);
    notifyListeners();
  }
}
