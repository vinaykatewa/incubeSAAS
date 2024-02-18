import 'package:flutter/material.dart';
import 'package:incube/home/dealDetailsmodels.dart';
import 'package:incube/models/Deals.dart';
import 'package:incube/models/ModelProvider.dart';

class DashboardProvider extends ChangeNotifier {
  List<CalenderModel> calender = [
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
    CalenderModel(
        title: 'Meeting with Vinay',
        timings: '8:30-9:30AM',
        description:
            'This is the  meeting or event description what the meeting is going to be about.'),
  ];

  List<CompanyModel> company = [
    CompanyModel(name: 'Linear', Raising: '50'),
    CompanyModel(name: 'Shopify', Raising: '70'),
    CompanyModel(name: 'Linear', Raising: '50'),
    CompanyModel(name: 'Shopify', Raising: '70'),
    CompanyModel(name: 'Linear', Raising: '50'),
    CompanyModel(name: 'Shopify', Raising: '70'),
    CompanyModel(name: 'Linear', Raising: '50'),
    CompanyModel(name: 'Shopify', Raising: '70'),
    CompanyModel(name: 'Linear', Raising: '50'),
    CompanyModel(name: 'Shopify', Raising: '70'),
  ];

  List<BarModel> barChartList = [
    BarModel(
        title: 'Company finances',
        description: 'Keep track of company and their financial spendings.',
        xName: 'Month',
        yName: 'Spendings in millions',
        xAxis: [1, 2, 3, 4, 5, 6],
        yAxis: [0, 20, 40, 60, 80, 100]),
  ];

  /// 1: calendar
  /// 2: Assign deals
  List<String> savedSmallWidgets = ['1', '1', '1', '1', '1', '1', '1'];

  // 101: Bar chart
  List<String> saveLargeWidgets = [
    '101',
    '101',
    '101',
    '101',
    '101',
    '101',
    '101'
  ];

  //list of widget
  List<Widget> smallWidget = [];

  void addWidget(Widget widget) {
    smallWidget.add(widget);
    notifyListeners();
  }
}

class CompanyModel {
  final String name;
  final String Raising;

  CompanyModel({required this.name, required this.Raising});
}

class BarModel {
  final String title;
  final String description;
  final String xName;
  final String yName;
  final List<int> xAxis;
  final List<double> yAxis;
  BarModel({
    required this.title,
    required this.description,
    required this.xName,
    required this.yName,
    required this.xAxis,
    required this.yAxis,
  });
}
