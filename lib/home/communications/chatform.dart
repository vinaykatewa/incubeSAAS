import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:incube/uiThemes.dart';

class ChatForm extends StatefulWidget {
  const ChatForm({Key? key});

  @override
  State<ChatForm> createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  final TextEditingController _textController = TextEditingController();
  final CollectionReference _messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: tertiaryColor1(),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _messages.orderBy('timestamp').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var messages = snapshot.data!.docs.reversed;

                return ListView(
                  reverse: true,
                  children: messages.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['message']),
                      // We can add more details like sender, timestamp, etc.
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: BodySmall().copyWith(color: textColor()),
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      contentPadding: EdgeInsets.all(screenWidth * 0.01),
                      filled: true,
                      fillColor: tertiaryColor2(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MainBorderRadius()),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) {
                      _sendMessage(value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_textController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String message) {
    _messages.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      // You can add more details like sender, etc.
    });

    _textController.clear();
  }
}
