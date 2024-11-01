import 'package:flutter/material.dart';
import 'package:realtime_chat_app/Constant/chatMessage.dart';
import 'package:realtime_chat_app/Constant/colors.dart';
import 'package:realtime_chat_app/models/messageModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List messages = [
    MessageModel(
        message: "Hello",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "Hi",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "Kaisa hai bhai",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "Mai thik, tu kaisa hai",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "Bas mast yarr, aur bata kya chalra aaj kal",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "kuch ni chalra bhai",
        sender: "202",
        receiver: "101",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: true),
    MessageModel(
        message: "Thik hai bhai chala le phir kuch",
        sender: "101",
        receiver: "202",
        timestamp: DateTime(2024, 11, 1),
        isSeenByReceiver: false),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leadingWidth: screenWidth * 0.12,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: screenWidth * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Other User",
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => ChatMessage(
          msg: messages[index],
          currentUser: "101",
          isImage: false,
        ),
      ),
    );
  }
}
