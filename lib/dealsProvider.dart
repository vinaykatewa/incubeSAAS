import 'package:flutter/material.dart';
import 'package:incube/models/Deals.dart';

class DealsProvider extends ChangeNotifier {
  List<Deals?> _ReviewdealList = [];

  // Getter
  List<Deals?> get ReviewdealList => _ReviewdealList;

  // Setter
  set ReviewdealList(List<Deals?> ReviewdealList) {
    _ReviewdealList = ReviewdealList;
    notifyListeners(); // Notify listeners when update happens
  }
}
