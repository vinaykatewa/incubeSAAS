// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:incube/uiThemes.dart';
// import 'chatDisplay.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';
// import 'messageModel.dart';

// class ChatForm extends StatefulWidget {
//   ChatForm({Key? key});

//   @override
//   State<ChatForm> createState() => _ChatFormState();
// }

// class _ChatFormState extends State<ChatForm> {
//   final TextEditingController _textController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   CollectionReference _messagesForChannel(String channelName) {
//     return FirebaseFirestore.instance
//         .collection('channels')
//         .doc(channelName)
//         .collection('messages');
//   }

//   late User? _currentUser;
//   late String _userName;
//   late String _userImage;
//   String _currentChannel = 'general';

//   @override
//   void initState() {
//     super.initState();
//     _currentUser = FirebaseAuth.instance.currentUser;

//     _fetchUserName();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: tertiaryColor1(),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   StreamBuilder(
//                     stream: _messagesForChannel(_currentChannel)
//                         .orderBy('dateTime')
//                         .snapshots(),
//                     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (!snapshot.hasData) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       var messages = snapshot.data!.docs.reversed;

//                       return ListView(
//                         shrinkWrap: true,
//                         reverse: true,
//                         children: messages.map((DocumentSnapshot document) {
//                           MessageModel messageModel =
//                               MessageModel.fromDocument(document);

//                           return ChatDisplay(
//                             message: messageModel.message,
//                             time: messageModel.time,
//                             senderUid: messageModel.senderUid,
//                             userName: messageModel.userName,
//                             userImage: messageModel.userImage,
//                             currentUserUid: _currentUser?.uid ?? '',
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textController,
//                     style: BodySmall().copyWith(color: textColor()),
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       contentPadding: EdgeInsets.all(screenWidth * 0.01),
//                       filled: true,
//                       fillColor: tertiaryColor2(),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(MainBorderRadius()),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     onSubmitted: (value) {
//                       _sendMessage(value);
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.send,
//                     color: secondaryColor(),
//                   ),
//                   onPressed: () {
//                     _sendMessage(_textController.text);
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.settings,
//                     color: secondaryColor(),
//                   ),
//                   onPressed: () {
//                     _showChannelDialog(context);
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _fetchUserName() async {
//     try {
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance
//           .collection(_currentUser!.uid)
//           .doc('Fields')
//           .get();

//       if (userDoc.exists) {
//         String userNameFirebase = userDoc['User_Name'];

//         setState(() {
//           _userName = userNameFirebase;
//         });
//       } else {
//         print('User document does not exist.');
//       }
//     } catch (e) {
//       print('Error fetching user name: $e');
//     }
//     try {
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance
//           .collection(_currentUser!.uid)
//           .doc('Fields')
//           .get();

//       if (userDoc.exists) {
//         String userImgFirebase = userDoc['imageUrl'];

//         setState(() {
//           _userImage = userImgFirebase;
//         });
//       } else {
//         print('user Image  does not exist.');
//       }
//     } catch (e) {
//       print('Error fetching user image: $e');
//     }
//   }

//   void _sendMessage(String message) {
//     _messagesForChannel(_currentChannel).add(
//       MessageModel(
//         message: message,
//         time: DateTime.now(),
//         senderUid: _currentUser!.uid,
//         userName: _userName,
//         userImage: _userImage,
//       ).toMap(),
//     );
//     _textController.clear();
//   }

//   void _showChannelDialog(BuildContext context) {
//     TextEditingController channelNameController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: secondaryColor(),
//           title: Text(
//             'Select or Create Channel',
//             style: BodyMedium().copyWith(color: Colors.white),
//           ),
//           content: Column(
//             children: [
//               TextField(
//                 controller: channelNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Channel Name',
//                   labelStyle: BodySmall()
//                       .copyWith(color: Colors.white.withOpacity(0.8)),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 style: BodySmall().copyWith(color: Colors.white),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(MainBorderRadius()),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (channelNameController.text.isNotEmpty) {
//                     _createChannel(channelNameController.text);
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Create Channel',
//                     style: BodySmall().copyWith(color: Colors.black)),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 color: Colors.white,
//                 height: 1,
//                 width: double.infinity,
//               ),
//               StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('channels')
//                     .snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) {
//                     return CircularProgressIndicator();
//                   }

//                   var channels = snapshot.data!.docs;

//                   return Column(
//                     children: channels.map((DocumentSnapshot channel) {
//                       Map<String, dynamic> data =
//                           channel.data() as Map<String, dynamic>;

//                       return ListTile(
//                         title: Text(data['name'],
//                             style: BodySmall().copyWith(color: Colors.white)),
//                         onTap: () {
//                           _selectChannel(data['name']);
//                           Navigator.pop(context);
//                         },
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel',
//                   style: BodySmall().copyWith(color: Colors.white)),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _createChannel(String channelName) async {
//     String channelId = Uuid().v4();
//     await FirebaseFirestore.instance
//         .collection('channels')
//         .doc(channelId)
//         .set({'name': channelName});
//     _selectChannel(channelName);
//   }

//   void _selectChannel(String channelName) {
//     setState(() {
//       _currentChannel = channelName;
//     });
//     _fetchUserName();
//   }
// }
