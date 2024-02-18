import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarChart extends StatefulWidget {
  final List<BarChartGroupData> barGroups;

  MyBarChart({required this.barGroups});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  var screenWidth;
  var screenHeight;
  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 0),
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.spaceAround,
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xFFF2F4F7),
                strokeWidth: 1,
              );
            },
          ),
          barGroups: widget.barGroups.map((group) {
            return BarChartGroupData(
              x: group.x,
              barRods: group.barRods.map((rod) {
                return BarChartRodData(
                    y: rod.y,
                    width: 30, // Adjust the width of the bars here
                    colors: rod.colors,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ));
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
