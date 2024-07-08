import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, this.isMyChat = false, required this.chatContent});
  bool isMyChat;
  String chatContent;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMyChat ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
            minWidth: MediaQuery.of(context).size.width * 0.2,
          ),
          // height: 100,
          // width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: isMyChat == false
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  topRight: isMyChat
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  bottomRight: const Radius.circular(10)),
              color:
                  isMyChat ? const Color(0xffEFF4FF) : const Color(0xffF3F3F3)),
          child: Text(
            chatContent,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
