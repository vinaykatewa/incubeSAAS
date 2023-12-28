import 'package:flutter/material.dart';
import 'package:incube/models/Organization.dart';

class IncubeProvider extends ChangeNotifier {
  String _email = 'init email';
  String _userName = 'init user name';
  String _imageFile = 'init image file';

  String _userId = 'init user id';
  String _organizationName = 'init organization name';
  String _organizationId = 'init organization id';
  String _adminId = 'init admin id';

  String get email => _email;
  String get userName => _userName;
  String get imageFile => _imageFile;
  String get userId => _userId;
  String get organizationName => _organizationName;
  String get organizationId => _organizationId;
  String get adminId => _adminId;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  set imageFile(String value) {
    _imageFile = value;
    notifyListeners();
  }

  set userId(String value) {
    _userId = value;
    notifyListeners();
  }

  set organizationName(String value) {
    _organizationName = value;
    notifyListeners();
  }

  set organizationId(String value) {
    _organizationId = value;
    notifyListeners();
  }

  set adminId(String value) {
    _adminId = value;
    notifyListeners();
  }

  // List<Organization?> get orgList => _orgList;

  // List<Organization?> org_list = [];

  // addAllOrganization(List<Organization?> org) {
  //   org_list = org;
  //   notifyListeners();
  // }
}
