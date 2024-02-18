// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:incube/hometemp/portfolioAnalytics/usersheets/listOfParentSheets.dart';
// import 'package:incube/hometemp/portfolioAnalytics/usersheets/sheetDetails.dart';
// import 'package:incube/hometemp/portfolioAnalytics/usersheets/userSheetProvider.dart';
// import 'package:incube/models/usersPersonalSheets.dart';
// import 'package:incube/uiThemes.dart';
// import 'package:provider/provider.dart';

// class Usersheets extends StatefulWidget {
//   const Usersheets({super.key});

//   @override
//   State<Usersheets> createState() => _UsersheetsState();
// }

// class _UsersheetsState extends State<Usersheets> {
//   bool showList = false;
//   String folderName = '';
//   List<String> listsIds = [''];
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return showList
//         ? ParentSheetLists(
//             folderName: folderName,
//             listsIds: listsIds,
//           )
//         : Consumer<UserSheetProvider>(
//             builder: (context, provider, child) {
//               return Scaffold(
//                 body: GridView.builder(
//                   itemCount: provider.userSheets.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 5,
//                     // mainAxisSpacing: 3,
//                     // crossAxisSpacing: screenWidth * 0.3,
//                     mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             folderName = provider.userSheets[index].folderName;
//                             listsIds = provider.userSheets[index].googleSheet;
//                             showList = true;
//                           });
//                         },
//                         child: SafeArea(
//                             top: true,
//                             child: Container(
//                               width: MediaQuery.sizeOf(context).width,
//                               height: MediaQuery.sizeOf(context).height * 1,
//                               decoration: BoxDecoration(
//                                 color: tertiaryColor2(),
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Align(
//                                     alignment: const AlignmentDirectional(0, 0),
//                                     child: Container(
//                                       width: 136,
//                                       height: 100,
//                                       decoration: BoxDecoration(
//                                         color: tertiaryColor2(),
//                                       ),
//                                       alignment:
//                                           const AlignmentDirectional(0, 0),
//                                       child: Text(
//                                         provider.userSheets[index].folderName,
//                                         style: LabelSmall().copyWith(
//                                             color: const Color.fromRGBO(30, 30,
//                                                     30, 0.800000011920929)
//                                                 .withOpacity(0.9)),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )));
//                   },
//                 ),
//                 floatingActionButton: FloatingActionButton(
//                   onPressed: _showDialog,
//                   child: const Icon(Icons.add),
//                 ),
//               );
//             },
//           );
//   }

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final provider = Provider.of<UserSheetProvider>(context, listen: false);
//         final _textController = TextEditingController();
//         return AlertDialog(
//           title: const Text('New folder'),
//           content: TextField(
//             controller: _textController,
//             decoration: const InputDecoration(
//                 hintText: "Please provide name to the folder"),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Submit'),
//               onPressed: () async {
//                 safePrint('we are adding folder');
//                 safePrint(
//                     'this is length before adding: ${provider.userSheets.length}');
//                 provider.addnewSheet(usersPersonalSheets(
//                     folderName: _textController.text, googleSheet: []));
//                 safePrint('we are done folder');
//                 safePrint(
//                     'this is length after adding: ${provider.userSheets.length}');
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
