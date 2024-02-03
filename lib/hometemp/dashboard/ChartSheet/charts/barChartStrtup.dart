import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class BarChartStrtps extends StatelessWidget {
  final List xAxis;
  final List yAxis;
  const BarChartStrtps({super.key, required this.xAxis, required this.yAxis});

  @override
  Widget build(BuildContext context) {
    final List<double> doubleList = yAxis.map((s) => double.parse(s)).toList();
    return xAxis.isEmpty && yAxis.isEmpty
        ? Container(
            child: Text('one of the axis is empty'),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: BarChart(BarChartData(
              barTouchData: BarTouchData(
                handleBuiltInTouches: true,
                // distanceCalculator: ,
                touchTooltipData: BarTouchTooltipData(
                  maxContentWidth: 400,
                  tooltipBgColor:
                      Colors.primaries[Random().nextInt(18)].shade500,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    // Get the value of the touched bar
                    double value = rod.toY;
                    // Format the value as a string with two decimal places
                    String valueStr = value.toStringAsFixed(2);
                    // Return a BarTooltipItem with the value and some styling
                    return BarTooltipItem(
                      'x ${xAxis[groupIndex]} \ny $valueStr ',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  ))),
              maxY: doubleList.max,
              barGroups: List.generate(
                xAxis.length,
                (index) => BarChartGroupData(x: index, barRods: [
                  BarChartRodData(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: const BorderSide(color: Colors.black),
                      width: 15,
                      toY: double.tryParse(yAxis[index])!,
                      gradient: LinearGradient(
                          colors: [
                            Colors.primaries[Random().nextInt(18)].shade300,
                            Colors.primaries[Random().nextInt(18)],
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ]),
              ),
            )),
          );
  }
}
