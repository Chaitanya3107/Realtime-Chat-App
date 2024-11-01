import 'package:flutter/material.dart';
import 'package:realtime_chat_app/Constant/colors.dart';
import 'package:realtime_chat_app/Constant/formatDate.dart';
import 'package:realtime_chat_app/models/messageModel.dart';

class ChatMessage extends StatefulWidget {
  final MessageModel msg;
  final String currentUser;
  final bool isImage;
  const ChatMessage(
      {super.key,
      required this.msg,
      required this.currentUser,
      required this.isImage});
  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisAlignment: widget.msg.sender == widget.currentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: widget.msg.sender == widget.currentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.025, vertical: 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                          color: widget.msg.sender == widget.currentUser
                              ? kPrimaryColor
                              : kPrimaryColor1,
                          borderRadius: BorderRadius.circular(20)),
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.75),
                      child: Text(
                        widget.msg.message,
                        style: TextStyle(
                            color: widget.msg.sender == widget.currentUser
                                ? kBackgroundColor
                                : Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.04,
                        screenWidth * 0.005, screenWidth * 0.005, 0),
                    child: Text(
                      formatDate(widget.msg.timestamp),
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outline),
                    ),
                  ),
                  widget.msg.sender == widget.currentUser
                      ? widget.msg.isSeenByReceiver
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.0),
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: kPrimaryColor,
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth * 0.02),
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: kPrimaryColor1,
                              ),
                            )
                      : SizedBox()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
