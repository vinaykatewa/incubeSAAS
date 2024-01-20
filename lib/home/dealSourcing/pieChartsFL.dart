import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class PieCharti extends StatefulWidget {
  final List xAxis;
  final List yAxis;
  const PieCharti({super.key, required this.xAxis, required this.yAxis});

  @override
  State<PieCharti> createState() => _PieChartiState();
}

class _PieChartiState extends State<PieCharti> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<double> doubleList = widget.yAxis.map((s) => double.parse(s)).toList();

    return PieChart(
      
      PieChartData(
          pieTouchData:
              PieTouchData(touchCallback: (flTouchEvent, pieTouchResponse) {
            // print(pieTouchResponse!.touchedSection!.touchedSectionIndex);
            setState(() {
              touchedIndex =
                  pieTouchResponse!.touchedSection!.touchedSectionIndex;
            });
            // print(flTouchEvent);
            // print()
          }),
          centerSpaceRadius:
              50, // The radius of the hole in the center of the chart
          borderData: FlBorderData(show: true),
          sectionsSpace: 2,
           // Whether to show a border around the chart
          sections: List.generate(
            widget.xAxis.length,
            (index) => PieChartSectionData(
              borderSide: touchedIndex == index ? BorderSide(color: Colors.primaries[index].shade300, width: 4) : null,
              showTitle: touchedIndex == index,
              // A section represents a slice of the pie
              value: double.tryParse(widget.yAxis[
                  index])!, // The value of the section, which determines its size
              color:touchedIndex == index ?  Colors.primaries[index]
                  .shade700 : Colors.primaries[index]
                  .shade500, // The color of the section
              title: '${widget.xAxis[index]}  ${((double.tryParse(widget.yAxis[index])!/doubleList.sum) * 100).toStringAsFixed(2)}%',
              // titlePositionPercentageOffset: 1,
              
              // badgeWidget: Container(
              //   height: 40,
              //   width: 40,
              //   color: Colors.red,
              // ), // The title of the section, which can be shown on the chart
              titleStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // The style of the title text
              radius: touchedIndex == index
                  ? 150
                  : 100, // The radius of the section
            ),
          )),
      swapAnimationDuration: Duration(milliseconds: 100),
    );
  }
}
