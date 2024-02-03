import 'package:flutter/material.dart';

class ChartsProvider extends ChangeNotifier {
  List<dynamic> _xAxisData = [];
  List<dynamic> _yAxisData = [];

  List<dynamic> get xAxisData => _xAxisData;
  List<dynamic> get yAxisData => _yAxisData;

  void updateData(List<dynamic> newXData, List<dynamic> newYData) {
    _xAxisData = newXData;
    _yAxisData = newYData;
    notifyListeners();
  }
}
