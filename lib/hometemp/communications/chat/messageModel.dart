// import 'package:cloud_firestore/cloud_firestore.dart';

// class MessageModel {
//   final String message;
//   final DateTime time;
//   final String senderUid;
//   final String userName;
//   final String userImage;

//   MessageModel({
//     required this.message,
//     required this.time,
//     required this.senderUid,
//     required this.userName,
//     required this.userImage,
//   });

//   factory MessageModel.fromDocument(DocumentSnapshot document) {
//     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//     DateTime dateTime = (data['dateTime'] as Timestamp).toDate();

//     return MessageModel(
//       message: data['message'],
//       time: dateTime,
//       senderUid: data['senderUid'],
//       userName: data['userName'],
//       userImage: data['userImage'],
//     );
//   }
//   Map<String, dynamic> toMap() {
//     return {
//       'message': message,
//       'dateTime': time,
//       'senderUid': senderUid,
//       'userName': userName,
//       'userImage': userImage,
//     };
//   }
// }
