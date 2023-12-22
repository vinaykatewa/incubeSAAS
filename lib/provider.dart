import 'package:flutter/material.dart';
import 'package:incube/models/Organization.dart';

class IncubeProvider extends ChangeNotifier {
  late final String email;
  late final String userName;
  late final String imageFile;

  late final String userId;
  late final String organization_name;
  late final String organizationId;

  List<Organization?> org_list = [];

  // addOrganization(Organization org) {
  //   org_list.toList(org.);
  //   notifyListeners();
  // }

  addAllOrganization(List<Organization?> org) {
    org_list = org;
    notifyListeners();
  }
}
