import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'portfolioSheets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../charts/groupModel.dart';

class PortfolioStartups extends StatefulWidget {
  const PortfolioStartups({super.key});

  @override
  State<PortfolioStartups> createState() => _PortfolioStartupsState();
}

class _PortfolioStartupsState extends State<PortfolioStartups> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  addData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final groupDatalIST = prefs.getStringList('groups');
    setState(() {
      if (groupDatalIST == null) {
        groups = [];
      } else {
        groups = groupDatalIST;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Hello');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String groupName = "";
          IconData selectedIcon = Icons.group;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add a Group"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Group Name"),
                      onChanged: (value) {
                        setState(() {
                          groupName = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
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
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        groups.add(groupName);
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setStringList('groups', groups);
                      Navigator.of(context).pop();
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
      backgroundColor: const Color(0xFFE8ECFC),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                // SizedBox(
                //   height: 300,
                //   width: 600,
                //   child: LineChartPage()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                // Container(
                //   height: MediaQuery.of(context).size.height *0.6,
                //   width: MediaQuery.of(context).size.height *0.6,
                //   child: dynamicStartupTable(strtpLists))
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 2,
                  child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: groups.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blue[200]!, width: 0.2),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue[100]!,
                                      blurRadius: 10,
                                      offset: Offset(0, 2)),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Colors.primaries[Random().nextInt(18)][50]!,
                                  Colors.white
                                ])),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => PortFolioSheets(
                                            saveKey: groups[index]))));
                              },
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    groups[index],
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio:
                            MediaQuery.devicePixelRatioOf(context),
                        crossAxisSpacing: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
