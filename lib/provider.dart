import 'package:flutter/material.dart';

class IncubeProvider extends ChangeNotifier {
  bool isUserAuthenticated = false;
  String userUid = "";
  String acceleratorName = "";
  String userName = "";
  String email = "";
  String userImageUrl = "";
  void setUserUid(String uid) {
    userUid = uid;
    notifyListeners();
  }

  void changeUserAuthState() {
    isUserAuthenticated = isUserAuthenticated;
    notifyListeners();
  }
}
