import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incube/AmplifyFuntions/api-calls.dart';
import 'package:incube/home/userSheets/userSheetsProvider.dart';
import 'package:incube/models/usersPersonalSheets.dart';
import 'package:incube/themes.dart/blueShades.dart';
import 'package:incube/themes.dart/greyShades.dart';
import 'package:incube/themes.dart/typography.dart';
import 'package:provider/provider.dart';

class UserSheets extends StatefulWidget {
  const UserSheets({super.key});

  @override
  State<UserSheets> createState() => _UserSheetsState();
}

class _UserSheetsState extends State<UserSheets> {
  var screenWidth;
  var screenHeight;
  var showAll = 'all sheets';
  bool showPerticularFolder = false;
  var folderIndex = 0;
  @override
  Widget build(BuildContext context) {
    setState(() {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    });
    return Consumer<UserSheetsProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.only(
              top: 48 * 0.001271 * screenHeight,
              left: 32 * 0.000651 * screenWidth,
              right: 32 * 0.000651 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(showAll),
              SizedBox(
                height: 24 * 0.001271 * screenHeight,
              ),
              provider.isLoading
                  ? Center(
                      child: Image.network(
                        'https://i.giphy.com/media/ZUEVCzp1WVCNi/200.gif',
                      ),
                    )
                  : Flexible(
                      // height: 564 * 0.001271 * screenHeight,
                      // constraints: BoxConstraints(
                      //   maxHeight: 564 * 0.001271 * screenHeight,
                      // ),
                      child: showPerticularFolder
                          ? bodyTable(
                              provider.folders[folderIndex], folderIndex)
                          : ListView.builder(
                              itemCount: provider.folders.length,
                              itemBuilder: (contect, index) {
                                // return bodyTable(provider.folders[index], index);
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      showAll =
                                          provider.folders[index].folderName;
                                      showPerticularFolder = true;
                                      folderIndex = index;
                                    });
                                  },
                                  title: Text(
                                    provider.folders[index].folderName,
                                    style:
                                        textLgSemibold(0.000651 * screenWidth)
                                            .copyWith(color: greyColor900()),
                                  ),
                                );
                              }),
                    )
            ],
          ),
        );
      },
    );
  }

  Widget header(String title) {
    Widget tagname() {
      return Container(
        height: 28 * 0.001271 * screenHeight,
        width: 328 * 0.000651 * screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 4 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/homeIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/slashIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            // SizedBox(width: 8 * 0.000651 * screenWidth),
            GestureDetector(
              onTap: () {
                setState(() {
                  showAll = 'all sheets';
                  folderIndex = 0;
                  showPerticularFolder = false;
                });
              },
              child: Text(
                'User sheets',
                style: textSmMedium(0.000651 * screenWidth)
                    .copyWith(color: greyColor600()),
              ),
            ),
            SizedBox(width: 12 * 0.000651 * screenWidth),
            SizedBox(
                height: 24 * 0.001271 * screenHeight,
                width: 24 * 0.000651 * screenWidth,
                child: Image.asset('assets/slashIcon.png')),
            //horizontal gap between
            SizedBox(width: 12 * 0.000651 * screenWidth),
            // SizedBox(width: 8 * 0.000651 * screenWidth),
            Text(
              title,
              style: textSmSemibold(0.000651 * screenWidth)
                  .copyWith(color: blueColor700()),
            ),
          ],
        ),
      );
    }

    Widget pagetitle() {
      return Container(
        height: 62 * 0.001271 * screenHeight,
        width: 1057 * 0.000651 * screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User sheets',
              style: displaySmSemibold(0.000651 * screenWidth)
                  .copyWith(color: greyColor900()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4 * 0.001271 * screenHeight,
            ),
            Text(
              'Please go through the following sheets',
              style: textSmRegular(0.000651 * screenWidth)
                  .copyWith(color: greyColor600()),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tagname(),
        SizedBox(
          height: 20 * 0.001271 * screenHeight,
        ),
        pagetitle(),
        Divider(
          color: greyColor200(),
        )
      ],
    );
  }

  Widget bodyTable(Folder folder, int currentIndex) {
    String folderName = folder.folderName;
    List parentNames =
        folder.sheets.map((sheet) => sheet[0]['parentName']).toList();
    int numberOfSheets = folder.sheets.length;
    Map<String, List<Map<String, dynamic>>> allData = {};
    for (var sheet in folder.sheets) {
      for (var map in sheet) {
        allData[map['sheetName']] =
            List<Map<String, dynamic>>.from(map['data']);
      }
    }
    return Column(
      children: [
        bodyTableHeader(folderName, currentIndex),
        SizedBox(
          height: 24 * 0.001271 * screenHeight,
        ),
        Container(
          height: 448 * 0.001271 * screenHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: greyColor200(),
              width: 1 * 0.000651 * screenWidth,
            ),
          ),
          child: ListView.builder(
            itemCount: parentNames.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Divider(
                    color: greyColor200(),
                  ),
                  TableContainer(parentNames[index], index, numberOfSheets,
                      '22 Jan 2024', allData),
                  Divider(
                    color: greyColor200(),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 32 * 0.001271 * screenHeight,
        ),
      ],
    );
  }

  Widget bodyTableHeader(String folderName, int index) {
    return Container(
      height: 52 * 0.001271 * screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 52 * 0.001271 * screenHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    folderName,
                    style: textLgSemibold(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                  SizedBox(
                    height: 4 * 0.001271 * screenHeight,
                  ),
                  Text(
                    'View or edit your data',
                    style: textSmRegular(0.000651 * screenWidth)
                        .copyWith(color: greyColor900()),
                  ),
                ]),
          ),
          GestureDetector(
            onTap: () {
              addingSheet(folderName, index);
            },
            child: Container(
              height: 40 * 0.001271 * screenHeight,
              width: 141 * 0.000651 * screenWidth,
              padding: EdgeInsets.only(
                  top: 10 * 0.001271 * screenHeight,
                  bottom: 10 * 0.001271 * screenHeight,
                  left: 14 * 0.000651 * screenWidth,
                  right: 14 * 0.000651 * screenWidth),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                      color: blueColor300(), width: 1 * 0.000651 * screenWidth),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                'Add new sheet',
                style: textSmSemibold(0.000651 * screenWidth)
                    .copyWith(color: blueColor700()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget TableContainer(String ParentName, int index, int numberOfSheets,
  //     String uploadedDate, Map<String, List<Map<String, dynamic>>> sheet) {
  //   return GestureDetector(
  //     onTap: () {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             content: Container(
  //               width: double.maxFinite,
  //               child: ListView.builder(
  //                 itemCount: sheet.keys.length,
  //                 itemBuilder: (context, index) {
  //                   String sheetName = sheet.keys.elementAt(index);
  //                   return ExpansionTile(
  //                     title: Text(
  //                       sheetName,
  //                       style: textSmSemibold(0.000651 * screenWidth)
  //                           .copyWith(color: greyColor900()),
  //                     ),
  //                     children: [
  //                       showDataTables(sheet[sheetName]!),
  //                     ],
  //                   );
  //                 },
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //     child: Container(
  //       height: 32 * 0.001271 * screenHeight,
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             width: 24 * 0.000651 * screenWidth,
  //           ),
  //           Text(
  //             index.toString(),
  //             style: textSmRegular(0.000651 * screenWidth)
  //                 .copyWith(color: greyColor600()),
  //           ),
  //           SizedBox(
  //             width: 24 * 0.000651 * screenWidth,
  //           ),
  //           VerticalDivider(color: greyColor200()),
  //           SizedBox(
  //             width: 68 * 0.000651 * screenWidth,
  //           ),
  //           Text(
  //             ParentName,
  //             style: textSmMedium(0.000651 * screenWidth)
  //                 .copyWith(color: greyColor900()),
  //           ),
  //           SizedBox(
  //             width: 68 * 0.000651 * screenWidth,
  //           ),
  //           VerticalDivider(color: greyColor200()),
  //           SizedBox(
  //             width: 68 * 0.000651 * screenWidth,
  //           ),
  //           Text(
  //             '${numberOfSheets.toString()} sheets',
  //             style: textSmRegular(0.000651 * screenWidth)
  //                 .copyWith(color: greyColor600()),
  //           ),
  //           SizedBox(
  //             width: 68 * 0.000651 * screenWidth,
  //           ),
  //           VerticalDivider(color: greyColor200()),
  //           SizedBox(
  //             width: 68 * 0.000651 * screenWidth,
  //           ),
  //           Text(
  //             uploadedDate,
  //             style: textSmRegular(0.000651 * screenWidth)
  //                 .copyWith(color: greyColor600()),
  //           ),
  //           SizedBox(
  //             width: 365 * 0.000651 * screenWidth,
  //           ),
  //           Text(
  //             'Open',
  //             style: textSmSemibold(0.000651 * screenWidth)
  //                 .copyWith(color: greyColor900()),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget TableContainer(String ParentName, int index, int numberOfSheets,
      String uploadedDate, Map<String, List<Map<String, dynamic>>> sheet) {
    return Container(
      height: 32 * 0.001271 * screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24 * 0.000651 * screenWidth,
          ),
          Text(
            index.toString(),
            style: textSmRegular(0.000651 * screenWidth)
                .copyWith(color: greyColor600()),
          ),
          SizedBox(
            width: 24 * 0.000651 * screenWidth,
          ),
          VerticalDivider(color: greyColor200()),
          SizedBox(
            width: 68 * 0.000651 * screenWidth,
          ),
          Text(
            ParentName,
            style: textSmMedium(0.000651 * screenWidth)
                .copyWith(color: greyColor900()),
          ),
          SizedBox(
            width: 68 * 0.000651 * screenWidth,
          ),
          VerticalDivider(color: greyColor200()),
          SizedBox(
            width: 68 * 0.000651 * screenWidth,
          ),
          Text(
            '${numberOfSheets.toString()} sheets',
            style: textSmRegular(0.000651 * screenWidth)
                .copyWith(color: greyColor600()),
          ),
          SizedBox(
            width: 68 * 0.000651 * screenWidth,
          ),
          VerticalDivider(color: greyColor200()),
          SizedBox(
            width: 68 * 0.000651 * screenWidth,
          ),
          Text(
            uploadedDate,
            style: textSmRegular(0.000651 * screenWidth)
                .copyWith(color: greyColor600()),
          ),
          SizedBox(
            width: 365 * 0.000651 * screenWidth,
          ),
          Container(
            width: 150,
            child: Row(
              children: [
                Flexible(
                  child: ExpansionTile(
                    title: Text(
                      'Open',
                      style: textSmSemibold(0.000651 * screenWidth)
                          .copyWith(color: greyColor900()),
                    ),
                    children: sheet.keys.map((sheetName) {
                      return ListTile(
                        title: Text(sheetName),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  width: double.maxFinite,
                                  child: showDataTables(sheet[sheetName]!),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showDataTables(List<Map<String, dynamic>> sheetData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: greyColor200(),
          width: 1 * 0.000651 * screenWidth,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24 * 0.001271 * screenHeight,
          ),
          SizedBox(
            height: 600 * 0.001271 * screenHeight,
            child: SingleChildScrollView(
              child: DataTable(
                columns: sheetData[0]
                    .keys
                    .map((key) => DataColumn(label: Text(key)))
                    .toList(),
                rows: sheetData
                    .map((row) => DataRow(
                        cells: row.values
                            .map((value) => DataCell(
                                Text(value is int ? value.toString() : value)))
                            .toList()))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> settingUserSheets() async {
    UserSheetsProvider _dealDetailsProvider =
        Provider.of<UserSheetsProvider>(context, listen: false);
    final apiCalls = ApiCalls();
    List<Folder> wholeList = [];
    for (usersPersonalSheets userSheet in _dealDetailsProvider.userSheets) {
      List<List<Map<String, dynamic>>> sheets = [];
      for (String id in userSheet.googleSheet) {
        List<Map<String, dynamic>> temp = await apiCalls.sheetList(id);
        sheets.add(temp);
      }
      wholeList.add(Folder(folderName: userSheet.folderName, sheets: sheets));
    }
    _dealDetailsProvider.folders = wholeList;
    _dealDetailsProvider.doneLoading();
  }

  void addingSheet(String folderName, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final provider =
            Provider.of<UserSheetsProvider>(context, listen: false);
        final _textController = TextEditingController();
        return AlertDialog(
          title: Text('Add New sheet to the folder ${folderName}'),
          content: TextField(
            controller: _textController,
            decoration:
                const InputDecoration(hintText: "Please provide the sheet id"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () async {},
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () async {
                provider.addSheet(_textController.text, index);
                settingUserSheets();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
