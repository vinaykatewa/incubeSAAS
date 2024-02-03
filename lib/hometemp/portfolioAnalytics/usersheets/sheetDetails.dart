import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/hometemp/charts/barChartStrtup.dart';
import 'package:incube/rezieableContainer.dart';
import 'package:incube/uiThemes.dart';

class SheetDetails extends StatefulWidget {
  final List<Map<String, dynamic>> sheets;
  const SheetDetails({super.key, required this.sheets});

  @override
  State<SheetDetails> createState() => _SheetDetailsState();
}

class _SheetDetailsState extends State<SheetDetails> {
  bool isLoading = false;
  final apiCalls = ApiCalls();
  List<Widget> charts = [
    ResizableContainer(
      child: const BarChartStrtps(
          xAxis: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
          yAxis: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11']),
    ),
  ];

  List<String> extractColumnNames(List<Map<String, dynamic>> startupData) {
    Set<String> columnNames = Set<String>();

    for (var data in startupData) {
      columnNames.addAll(data.keys);
    }

    return columnNames.toList();
  }

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
            child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemCount: widget.sheets.length,
                        itemBuilder: (context, index) {
                          return ResizableContainer(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    widget.sheets[index]['sheetName'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 12,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: dynamicStartupTable(
                                      (widget.sheets[index]['data'] as List)
                                          .map<Map<String, dynamic>>((e) {
                                        if (e is Map) {
                                          return Map<String, dynamic>.from(e);
                                        } else {
                                          return {};
                                        }
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: ListView.builder(
              //     itemCount: charts.length,
              //     itemBuilder: (context, index) {
              //       return ClipRRect(
              //         borderRadius: BorderRadius.circular(10),
              //         child: charts[index],
              //       );
              //     },
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: CustomButton(
              //       icon: Icon(
              //         Icons.add,
              //         color: Colors.white.withOpacity(0.9),
              //       ),
              //       text: 'Add Bar chart',
              //       screenWidth: screenWidth,
              //       onPressed: () {
              //         setState(() {
              //           charts.add(
              //             ResizableContainer(
              //               child: const BarChartStrtps(xAxis: [
              //                 '1',
              //                 '2',
              //                 '3',
              //                 '4',
              //                 '5',
              //                 '6',
              //                 '7',
              //                 '8',
              //                 '9',
              //                 '10',
              //                 '11'
              //               ], yAxis: [
              //                 '1',
              //                 '2',
              //                 '3',
              //                 '4',
              //                 '5',
              //                 '6',
              //                 '7',
              //                 '8',
              //                 '9',
              //                 '10',
              //                 '11'
              //               ]),
              //             ),
              //           );
              //         });
              //       }),
              // ),
            ],
          ));
  }
}
