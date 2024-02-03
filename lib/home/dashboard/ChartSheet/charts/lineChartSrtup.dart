import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../chartProvider.dart';
import 'package:provider/provider.dart';
// import 'package:localsheets/appUI/over_view.dart';
import 'barChartStrtup.dart';
import 'pieChartsFL.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LineCharti extends StatelessWidget {
  LineCharti({
    super.key,
    required this.isShowingMainData,
    required this.xAxis,
    required this.yAxis,
  });
  final List xAxis;
  final List yAxis;
  final bool isShowingMainData;

  int _sliderValue = 10;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return Column(
        children: [
          Flexible(
            child: LineChart(
              isShowingMainData ? sampleData1 : sampleData2,
              duration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      );
    });
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: xAxis.length.toDouble(),
        maxY: xAxis.length.toDouble(),
        minY: 0,
      );

  LineChartData get sampleData2 => LineChartData(
        lineTouchData: lineTouchData2,
        gridData: gridData,
        titlesData: titlesData2,
        borderData: borderData,
        lineBarsData: lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 400,
          tooltipBgColor: Colors.primaries[Random().nextInt(18)].shade50,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              return LineTooltipItem(
                  '',
                  TextStyle(
                      color: barSpot.bar.color, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'x:   ${xAxis[barSpot.x.toInt()]}',
                      style: TextStyle(
                          color: barSpot.bar.color,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '   ' +
                          (int.tryParse(yAxis[barSpot.spotIndex])!)
                              .toStringAsFixed(2)
                              .toString(),
                      style: TextStyle(
                          color: barSpot.bar.color,
                          fontWeight: FontWeight.bold),
                    )
                  ]);
            }).toList();
          },
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineTouchData get lineTouchData2 => const LineTouchData(
        enabled: true,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData2_1,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    final len = yAxis.length;
    final List<double> doubleList = yAxis.map((s) => double.parse(s)).toList();
    String text;
    if (value.toInt() < len) {
      doubleList.sort();
      text = (doubleList[value.toInt()] / (doubleList.sum / doubleList.length))
          .toStringAsFixed(2)
          .toString();
    } else {
      return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: false,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(
        value.toString(),
        style: style,
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
              color: Colors.primaries[Random().nextInt(18)].withOpacity(0.5),
              width: 1),
          left: const BorderSide(color: Colors.black38),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      color: Colors.primaries[Random().nextInt(5)],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.primaries[Random().nextInt(18)].shade100,
                Colors.primaries[Random().nextInt(18)].shade50
              ])),
      spots: List.generate(xAxis.length, (index) {
        final List<double> doubleList =
            yAxis.map((s) => double.parse(s)).toList();
        return FlSpot(
            index.toDouble(),
            double.tryParse(yAxis[index])! /
                (doubleList.sum / doubleList.length));
      }));

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.primaries[Random().nextInt(10)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.primaries[Random().nextInt(15)].withOpacity(0),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.primaries[Random().nextInt(18)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.primaries[Random().nextInt(4)].withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
        isCurved: true,
        color: Colors.primaries[Random().nextInt(18)].withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.primaries[Random().nextInt(18)].withOpacity(0.2),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.primaries[Random().nextInt(18)].withOpacity(0.5),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    const text = "    quest    ions   1000";
    final intInStr = RegExp(r'\d+');
    print(intInStr
        .allMatches(text)
        .map((m) => m.group(0).toString())
        .toString()
        .replaceAll(RegExp(r'[()]'), ''));
    getSheetData();
    super.initState();
    isShowingMainData = true;
  }

  List<String> sheetDatasKeys = [];

  getSheetData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('groups');
    setState(() {
      dropdownVal = 'Select Folders';
      if (data == null) {
        sheetDatasKeys = [];
      } else {
        sheetDatasKeys = List<String>.from(data);
      }
    });
    print(sheetDatasKeys);
  }

  List graphList = [];
  getKeyData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key)!.toList();
    setState(() {
      if (data == null) {
        graphList = [];
      } else {
        graphList = data.map((item) {
          List<dynamic> dynamicList = jsonDecode(item);
          return dynamicList.map((i) => i as Map<String, dynamic>).toList();
        }).toList();
        print('this is the graphlist from getkeyData: ${graphList.toString()}');
      }
    });
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    final chartData = Provider.of<ChartsProvider>(context);
    return Material(
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: const Alignment(0.0, -0.9),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(dropdownVal),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownVal = newValue!;
                    });
                    getKeyData(newValue!);
                  },
                  items: sheetDatasKeys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(dropdownVal1),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownVal1 = newValue!;
                    });
                    sheetNames.clear();
                    graphList.forEach((element) {
                      element.forEach((element1) {
                        if (element1['parentName'] == dropdownVal1) {
                          print(element1);
                          sheetNames.add(element1);
                        }
                      });
                    });
                    print(dropdownVal1);
                  },
                  items: graphList.map((value) {
                    return DropdownMenuItem(
                      value: value[0]['parentName'].toString(),
                      child: Text(value[0]['parentName'].toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.3),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(dropdownVal2),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownVal2 = newValue!;
                    });
                    xyAxiskeys.clear();
                    graphList.forEach((element) {
                      element.forEach((element1) {
                        if (element1['parentName'] == dropdownVal1 &&
                            element1['sheetName'] == dropdownVal2) {
                          for (var data in element1['data']) {
                            xyAxiskeys.addAll(data.keys);
                          }
                        }
                      });
                    });
                  },
                  items: sheetNames.map((value) {
                    return DropdownMenuItem(
                      value: value['sheetName'].toString(),
                      child: Text(value['sheetName'].toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(selectX),
                  // value: dropdownVal,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectX = newValue!;
                    });
                    xAxis.clear();
                    xyAxiskeys.toSet().toList().forEach((element) {
                      if (element == selectX) {
                        sheetNames.forEach((elementsh) {
                          if (element == selectX &&
                              elementsh['sheetName'] == dropdownVal2) {
                            elementsh['data'].forEach((elementsh1) {
                              print(elementsh1[selectX]);
                              xAxis.add(elementsh1[selectX]);
                            });
                          }
                        });
                      }
                    });
                  },
                  items: xyAxiskeys
                      .toSet()
                      .toList()
                      .where((element) => element != selectY)
                      .map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.3),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(selectY),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectY = newValue!;
                    });
                    yAxis.clear();
                    xyAxiskeys.toSet().toList().forEach((element) {
                      if (element == selectY) {
                        sheetNames.forEach((elementsh) {
                          if (element == selectY &&
                              elementsh['sheetName'] == dropdownVal2 &&
                              element != selectX) {
                            elementsh['data'].forEach((elementsh1) {
                              final intInStr = RegExp(r'\d+');
                              final num = intInStr
                                  .allMatches(elementsh1[selectY].toString())
                                  .map((m) => m.group(0).toString())
                                  .toString()
                                  .replaceAll(RegExp(r'[()]'), '')
                                  .replaceAll(RegExp(r'[,\s]'), '');
                              // print(elementsh1[selectY]);
                              yAxis.add(num);
                              print(yAxis);
                            });
                          }
                        });
                      }
                    });
                  },
                  items: xyAxiskeys
                      .toSet()
                      .toList()
                      .where((element) => element != selectX)
                      .map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  hint: Text(SelectChart),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      SelectChart = newValue!;
                    });
                  },
                  items: ['Pie-Chart', 'Line-Chart', 'Bar-Chart']
                      .toSet()
                      .toList()
                      .where((element) => element != selectX)
                      .map((value) {
                    return DropdownMenuItem(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: FilledButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                  onPressed: () {
                    chartData.updateData(xAxis, yAxis);
                    print(
                        'we have set the data, length of xAxis: ${xAxis.length} yAxis: ${yAxis.length}');
                    // charts.add(
                    //   SelectChart == 'Line-Chart'
                    //       ? expandedContainer(
                    //   e:
                    // LineCharti(
                    //       isShowingMainData: true,
                    //       xAxis: xAxis,
                    //       yAxis: yAxis),
                    // )
                    //       : SelectChart == 'Bar-Chart'
                    //           ? expandedContainer(
                    //               e: BarChartStrtps(xAxis: xAxis, yAxis: yAxis))
                    //           : expandedContainer(
                    //               e: PieCharti(
                    //                 xAxis: xAxis,
                    //                 yAxis: yAxis,
                    //               ),
                    //             ),
                    // );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Add Chart'),
                  )),
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  String dropdownVal = '';
  String dropdownVal1 = 'Select Parent sheet';
  String dropdownVal2 = 'Select Sheet';
  String selectX = 'Select Xaxis';
  String selectY = 'Select Yaxis';
  String SelectChart = 'Line-Chart';
  List sheetNames = [];
  List xyAxiskeys = [];
  List xAxis = [];
  List yAxis = [];
}
