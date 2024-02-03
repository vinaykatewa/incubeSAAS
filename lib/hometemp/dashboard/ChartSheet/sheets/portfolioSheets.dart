import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/localDataBase.dart';

// List sheetGroup = [];

class PortFolioSheets extends StatefulWidget {
  final String saveKey;
  const PortFolioSheets({super.key, required this.saveKey});

  @override
  State<PortFolioSheets> createState() => _PortFolioSheetsState();
}

class _PortFolioSheetsState extends State<PortFolioSheets> {
  TextEditingController idController = TextEditingController();

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
      minWidth: 600,

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

  List<List<Map<String, dynamic>>> allsheets = [];
  @override
  void initState() {
    getSheets();
    super.initState();
  }

  getSheets() async {
    final localSheets =
        await CacheDataLocal().getData(widget.saveKey.toString());
    // print(localSheets);
    setState(() {
      if (localSheets != null) {
        if (localSheets is List) {
          allsheets = [];
          for (var sheet in localSheets) {
            if (sheet is List) {
              List<Map<String, dynamic>> innerList = [];
              for (var innerItem in sheet) {
                if (innerItem is Map) {
                  innerList.add(Map<String, dynamic>.from(innerItem));
                }
              }
              allsheets.add(innerList);
              // print(allsheets);
              allsheets.removeWhere((list) => list.isEmpty);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print(allsheets);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add a Sheeet"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: idController,
                          decoration:
                              const InputDecoration(labelText: "Sheet ID"),
                          // onChanged: (value) {
                          //   setState(() {
                          //     sheetId = value;
                          //   });
                          // },
                        ),
                        const SizedBox(height: 20),
                        // IconPicker(
                        //   selectedIcon: selectedIcon,
                        //   onIconSelected: (icon) {
                        //     setState(() {
                        //       selectedIcon = icon;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          final sheets_add =
                              await startupList(idController.text);
                          setState(() {
                            // sheetGroup.add(
                            //   sheetId,
                            // );
                            allsheets.add(sheets_add);
                          });
                          print(sheets_add);
                          await CacheDataLocal()
                              .putData(widget.saveKey.toString(), allsheets);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.upload_file)),
        appBar: AppBar(),
        body: GridView.builder(
          itemCount: allsheets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              crossAxisCount: 1,
              mainAxisExtent: MediaQuery.devicePixelRatioOf(context) *
                  MediaQuery.of(context).size.height *
                  0.5),
          padding: const EdgeInsets.all(30),
          itemBuilder: ((context, index) {
            // debugPrint(allsheets[index].length.toString());
            return Column(
              children: [
                Text(
                  allsheets[index][0]['parentName'],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Material(
                    // elevation: 10,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                      color: Colors.black,
                      width: 0.2,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: allsheets[index].length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio:
                                      MediaQuery.devicePixelRatioOf(context),
                                  crossAxisSpacing: 40,
                                  mainAxisSpacing: 40,
                                  // mainAxisExtent: 100,
                                  crossAxisCount: 3),
                          itemBuilder: (context, indexi) {
                            bool showButton = false;

                            return StatefulBuilder(
                                // stream: null,
                                builder: (context, StateSetter setter) {
                              return Column(
                                children: [
                                  Expanded(
                                      child: MouseRegion(
                                    onEnter: (_) => setter(() {
                                      showButton = true;
                                    }),
                                    onExit: (_) => setter(() {
                                      showButton = false;
                                    }),
                                    child: Stack(
                                      children: [
                                        Material(
                                            // type: MaterialType.transparency,
                                            elevation: showButton ? 5 : 20,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: dynamicStartupTable(
                                                    (allsheets[index][indexi]
                                                            ['data'] as List)
                                                        .map<
                                                            Map<String,
                                                                dynamic>>((e) {
                                                  if (e is Map) {
                                                    return Map<String,
                                                        dynamic>.from(e);
                                                  } else {
                                                    return {}; // Or handle the case when the element is not a Map
                                                  }
                                                }).toList()))),
                                        showButton
                                            ? ClipRRect(
                                                child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 5, sigmaY: 5),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                    )),
                                              )
                                            : const SizedBox.shrink(),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                child: showButton
                                                    ? ElevatedButton(
                                                        style: ButtonStyle(
                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(20),
                                                            shape: MaterialStateProperty.all(
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.horizontal(
                                                                            left: Radius.circular(
                                                                                10))))),
                                                        onPressed: () =>
                                                            print("Hi!"),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              Icon(Icons.edit),
                                                        ))
                                                    : const SizedBox.shrink(),
                                              ),
                                              AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                child: showButton
                                                    ? ElevatedButton(
                                                        style: ButtonStyle(
                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(20),
                                                            shape: MaterialStateProperty.all(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0)))),
                                                        onPressed: () =>
                                                            setter(() {
                                                              showButton =
                                                                  false;
                                                            }),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(Icons
                                                              .remove_red_eye_rounded),
                                                        ))
                                                    : const SizedBox.shrink(),
                                              ),
                                              AnimatedSwitcher(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                child: showButton
                                                    ? ElevatedButton(
                                                        style: ButtonStyle(
                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(20),
                                                            shape: MaterialStateProperty.all(
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.horizontal(
                                                                            right:
                                                                                Radius.circular(10))))),
                                                        onPressed: () async {
                                                          setState(() {
                                                            allsheets[index]
                                                                .remove(allsheets[
                                                                        index]
                                                                    [indexi]);
                                                          });

                                                          await CacheDataLocal()
                                                              .putData(
                                                                  widget.saveKey
                                                                      .toString(),
                                                                  allsheets);
                                                        },
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                              Icons.delete),
                                                        ))
                                                    : const SizedBox.shrink(),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                  Text(allsheets[index][indexi]['sheetName']),
                                ],
                              );
                            });
                          }),
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }

  Future startupList(String sheetId) async {
    List<Map<String, dynamic>> f = [];
    final url = Uri.parse('http://localhost:5000/fetchData');

    final response = await http.post(
      url,
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': sheetId
        // 'key2': 'value2',
      }),
    );

    if (response.statusCode == 200) {
      final t = jsonDecode(response.body);
      // strtpLists.clear();
      return List<Map<String, dynamic>>.from(t);
    } else {
      // isLoading = false;
      print('Request failed with status: ${response.statusCode}');
      return f;
    }
  }
}
