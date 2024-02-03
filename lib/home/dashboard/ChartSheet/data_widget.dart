// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './chartProvider.dart';
import './charts/barChartStrtup.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import './charts/lineChartSrtup.dart';

import 'storage.dart';

const Color blue = Color(0xFF4285F4);
const Color red = Color(0xFFEA4335);
const Color yellow = Color(0xFFFBBC05);
const Color green = Color(0xFF34A853);

class DataWidget extends StatelessWidget {
  DataWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final IncubeDashboardItem item;
  @override
  Widget build(BuildContext context) {
    final chartData = Provider.of<ChartsProvider>(context);

    final Map<String, Widget Function(IncubeDashboardItem i)> _map = {
      "line-chart": (l) => BarChartStrtps(
          xAxis: chartData.xAxisData, yAxis: chartData.yAxisData),
      "custom": (l) => Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue,
            child: const Text(
              'This is my custom widget!',
              style: TextStyle(color: Colors.white),
            ),
          ),
    };

    return _map[item.data]!(item);
  }
}
