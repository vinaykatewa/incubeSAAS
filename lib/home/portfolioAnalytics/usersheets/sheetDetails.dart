import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/dealSourcing/barChartStrtup.dart';
import 'package:incube/rezieableContainer.dart';
import 'package:incube/uiThemes.dart';

class SheetDetails extends StatefulWidget {
  final List<String> listsIds;
  const SheetDetails({super.key, required this.listsIds});

  @override
  State<SheetDetails> createState() => _SheetDetailsState();
}

class _SheetDetailsState extends State<SheetDetails> {
  bool isLoading = false;
  List<List<Map<String, dynamic>>> allsheets = [];
  final apiCalls = ApiCalls();
  List<Widget> charts = [
    ResizableContainer(
      child: const BarChartStrtps(
          xAxis: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
          yAxis: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11']),
    ),
  ];

  @override
  void initState() {
    super.initState();
    setData();
  }

  Future<void> setData() async {
    setState(() {
      isLoading = true;
    });
    List<List<Map<String, dynamic>>> wholeList = [];
    for (String id in widget.listsIds) {
      List<Map<String, dynamic>> temp = await apiCalls.sheetList(id);
      wholeList.add(temp);
    }
    setState(() {
      allsheets = wholeList;
    });
    setState(() {
      isLoading = false;
    });
  }

  List<String> extractColumnNames(List<Map<String, dynamic>> startupData) {
    Set<String> columnNames = Set<String>();

    for (var data in startupData) {
      columnNames.addAll(data.keys);
    }

    return columnNames.toList();
  }

  // Define a function to create DataTable columns dynamically
  List<DataColumn> createDataColumns(List<String> columnNames) {
    List<DataColumn> columns = [];

    for (var columnName in columnNames) {
      columns.add(DataColumn(
        label: Text(columnName,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ));
    }

    return columns;
  }

  List<DataRow> createDataRows(
      List<Map<String, dynamic>> startupData, List<String> columnNames) {
    List<DataRow> rows = [];

    for (var data in startupData) {
      List<DataCell> cells = columnNames.map((columnName) {
        return DataCell(
          Text(
            data[columnName].toString(),
            style: const TextStyle(fontSize: 10),
          ),
          // showEditIcon: true
        );
      }).toList();

      DataRow row = DataRow(cells: cells);
      rows.add(row);
    }

    return rows;
  }

  // Create the DataTable
  DataTable2 dynamicStartupTable(List<Map<String, dynamic>> startupData) {
    List<String> columnNames = extractColumnNames(startupData);

    return DataTable2(
      fixedColumnsColor: Colors.primaries[Random().nextInt(18)][50],
      dataRowColor: MaterialStateProperty.all<Color>(
          Colors.primaries[Random().nextInt(18)][50]!),
      headingRowColor: MaterialStateProperty.all<Color>(
          Colors.primaries[Random().nextInt(18)][50]!),
      // fixedCornerColor: Colors.red,
      // decoration: BoxDecoration(
      //   border: Border.all()
      // ),
      fixedLeftColumns: 1,
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 900,

      border: TableBorder.all(
        width: 0.2,
      ),
      // dividerThickness: 0.2,
      // columnSpacing: 1, // Set the spacing between columns
      // horizontalMargin: 0,
      columns: createDataColumns(columnNames),

      rows: createDataRows(startupData, columnNames),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return isLoading
        ? Center(
            child: SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              child: const CircularProgressIndicator(),
            ),
          )
        : Material(
            child: ListView.builder(
                itemCount: allsheets.length,
                itemBuilder: (context, item) {
                  return Container(
                    height: screenHeight * 0.7,
                    width: screenWidth * 0.6,
                    color: tertiaryColor2(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          allsheets[item][0]['parentName'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: allsheets[item].length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  ResizableContainer(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            allsheets[item][index]['sheetName'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 12,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: dynamicStartupTable(
                                              (allsheets[item][index]['data']
                                                      as List)
                                                  .map<Map<String, dynamic>>(
                                                      (e) {
                                                if (e is Map) {
                                                  return Map<String,
                                                      dynamic>.from(e);
                                                } else {
                                                  return {};
                                                }
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ListView.builder(
                                      itemCount: charts.length,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: charts[index],
                                        );
                                      },
                                    ),
                                  ),
                                  CustomButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                      text: 'Add Bar chart',
                                      screenWidth: screenWidth,
                                      onPressed: () {
                                        setState(() {
                                          charts.add(
                                            ResizableContainer(
                                              child: const BarChartStrtps(
                                                  xAxis: [
                                                    '1',
                                                    '2',
                                                    '3',
                                                    '4',
                                                    '5',
                                                    '6',
                                                    '7',
                                                    '8',
                                                    '9',
                                                    '10',
                                                    '11'
                                                  ],
                                                  yAxis: [
                                                    '1',
                                                    '2',
                                                    '3',
                                                    '4',
                                                    '5',
                                                    '6',
                                                    '7',
                                                    '8',
                                                    '9',
                                                    '10',
                                                    '11'
                                                  ]),
                                            ),
                                          );
                                        });
                                      }),
                                ],
                              );
                            })
                      ],
                    ),
                  );
                }),
          );
  }
}
