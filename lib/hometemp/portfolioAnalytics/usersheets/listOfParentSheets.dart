// import 'package:amplify_api/amplify_api.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:incube/AmplifyFuntions/AwsAmplify.dart';
// import 'package:incube/AmplifyFuntions/api-calls.dart';
// import 'package:incube/hometemp/portfolioAnalytics/usersheets/sheetDetails.dart';
// import 'package:incube/hometemp/portfolioAnalytics/usersheets/userSheetProvider.dart';
// import 'package:incube/models/Organization.dart';
// import 'package:incube/provider.dart';
// import 'package:incube/uiThemes.dart';
// import 'package:provider/provider.dart';

// class ParentSheetLists extends StatefulWidget {
//   final String folderName;
//   final List<String> listsIds;
//   const ParentSheetLists(
//       {super.key, required this.listsIds, required this.folderName});

//   @override
//   State<ParentSheetLists> createState() => _ParentSheetListsState();
// }

// class _ParentSheetListsState extends State<ParentSheetLists> {
//   bool isLoading = false;
//   List<List<Map<String, dynamic>>> allSheets = [];
//   List<Map<String, dynamic>> childsSheet = [];
//   final apiCalls = ApiCalls();
//   final _awsAmplify = AwsIncube();
//   bool showChild = false;
//   @override
//   void initState() {
//     super.initState();
//     setData();
//   }

  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       final provider = Provider.of<UserSheetProvider>(context, listen: false);
  //       final _textController = TextEditingController();
  //       return AlertDialog(
  //         title: Text('Add New sheet to the folder ${widget.folderName}'),
  //         content: TextField(
  //           controller: _textController,
  //           decoration:
  //               const InputDecoration(hintText: "Please provide the sheet id"),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Submit'),
  //             onPressed: () async {
  //               //get the sheet from id, it will check if the id is right or not
  //               try {
  //                 List<Map<String, dynamic>> temp =
  //                     await apiCalls.sheetList(_textController.text);
  //                 setState(() {
  //                   allSheets.add(temp);
  //                 });
  //                 //we have the folder name we just need to add it
  //                 int index = provider.userSheets.indexWhere(
  //                     (element) => element.folderName == widget.folderName);
  //                 if (index == -1) {
  //                   safePrint('we got index -1');
  //                 }
  //                 safePrint('we got the index of the element, its: $index');

  //                 provider.userSheets[index].googleSheet
  //                     .add(_textController.text);
  //                 safePrint(
  //                     'we have added element to the provider this is the id: ${provider.userSheets[index].googleSheet}');
  //                 await updateOrganization();
  //               } catch (e) {
  //                 safePrint('we got an error in id of google sheet: $e');
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   Future<void> updateOrganization() async {
//     safePrint('we are updating organization, in updateOrganization');
//     final IncubeProvider incubeProvider =
//         Provider.of<IncubeProvider>(context, listen: false);
//     final UserSheetProvider userSheerProvider =
//         Provider.of<UserSheetProvider>(context, listen: false);
//     Organization? _org =
//         await _awsAmplify.getOrganizationByAdminId(incubeProvider.superAdmin);
//     if (_org == null) {
//       safePrint('we got the null organization in fetchTeams method');
//       return;
//     }
//     Organization updatedOrg =
//         _org.copyWith(sheets: userSheerProvider.userSheets);
//     try {
//       final request = ModelMutations.update(updatedOrg);
//       final response = await Amplify.API.mutate(request: request).response;
//       print('Organization updated successfully');
//     } catch (e) {
//       print('Error updating organization: $e');
//     }
//   }

//   Future<void> setData() async {
//     setState(() {
//       isLoading = true;
//     });
//     List<List<Map<String, dynamic>>> wholeList = [];
//     for (String id in widget.listsIds) {
//       List<Map<String, dynamic>> temp = await apiCalls.sheetList(id);
//       wholeList.add(temp);
//     }
//     setState(() {
//       allSheets = wholeList;
//     });
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return showChild
//         ? SheetDetails(sheets: childsSheet)
//         : Scaffold(
//             body: Consumer<UserSheetProvider>(
//               builder: (context, provider, child) {
//                 return ListView.builder(
//                   itemCount: allSheets.length,
//                   itemBuilder: (context, item) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           childsSheet = allSheets[item];
//                           showChild = true;
//                         });
//                       },
//                       child: ListTile(
//                         title: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           color: tertiaryColor1(),
//                           elevation: 1,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text(
//                             allSheets[item][0]['parentName'],
//                             style: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 _showDialog();
//               },
//               child: const Icon(Icons.add),
//             ),
//           );
//   }
// }
