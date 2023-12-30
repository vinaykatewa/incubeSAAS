import 'package:flutter/material.dart';

class IncubeProvider extends ChangeNotifier {
  String _userId = 'init user id';
  String _userName = 'init user name';
  String _email = 'init email';
  String _imageFile = 'init image file';
  late bool _isAdmin;

  String _organizationId = 'init organization id';
  String _superAdmin = 'init super admin id';
  String _requestStatus = 'new';
  String _teamId = 'default team id';
  late bool _isteamLeader;

  String get email => _email;
  String get userName => _userName;
  String get imageFile => _imageFile;
  String get userId => _userId;
  String get organizationId => _organizationId;
  bool get isAdmin => _isAdmin;
  String get superAdmin => _superAdmin;
  String get requestStatus => _requestStatus;
  String get teamId => _teamId;
  bool get isteamLeader => _isteamLeader;

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

  set organizationId(String value) {
    _organizationId = value;
    notifyListeners();
  }

  set isAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  set superAdmin(String value) {
    _superAdmin = value;
    notifyListeners();
  }

  set requestStatus(String value) {
    _requestStatus = value;
    notifyListeners();
  }

  set teamId(String value) {
    _teamId = value;
    notifyListeners();
  }

  set isteamLeader(bool value) {
    _isteamLeader = value;
    notifyListeners();
  }
}
