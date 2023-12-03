import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:incube/uiThemes.dart';

class ChatDisplay extends StatefulWidget {
  final String message;
  final DateTime time;
  final String senderUid;
  final String userName;
  final String userImage;
  final String currentUserUid;

  const ChatDisplay({
    Key? key,
    required this.message,
    required this.time,
    required this.senderUid,
    required this.userName,
    required this.userImage,
    required this.currentUserUid,
  }) : super(key: key);

  @override
  State<ChatDisplay> createState() => _ChatDisplayState();
}

class _ChatDisplayState extends State<ChatDisplay> {
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    bool isUserMessage = widget.currentUserUid == widget.senderUid;
    final screenWidth = MediaQuery.of(context).size.width;

    // Format the time to display in 4-digit format with AM/PM
    String formattedTime = DateFormat('hh:mm a').format(widget.time);

    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:
            isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0),
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.005,
              ),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                padding: EdgeInsets.all(8.0),
                constraints: const BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: 300.0,
                  minHeight: 20,
                ),
                decoration: BoxDecoration(
                  color: isUserMessage
                      ? secondaryColor()
                      : Colors.black.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.message,
                        style: BodySmall().copyWith(
                          fontSize: 15,
                          color: isUserMessage
                              ? Colors.white.withOpacity(1)
                              : Colors.black.withOpacity(0.7),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: isUserMessage
                ? EdgeInsets.only(right: screenWidth * 0.008)
                : EdgeInsets.only(left: screenWidth * 0.027),
            // width: 180,
            child: Row(
              mainAxisAlignment: isUserMessage
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    widget.userName,
                    style: BodySmall().copyWith(
                        fontSize: 12,
                        color: isUserMessage
                            ? Colors.black.withOpacity(0.5)
                            : Colors.black.withOpacity(0.5)),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.1,
                ),
                Text(
                  formattedTime,
                  style: BodySmall().copyWith(
                      fontSize: 10,
                      color: isUserMessage
                          ? Colors.black.withOpacity(0.4)
                          : Colors.black.withOpacity(0.4)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
