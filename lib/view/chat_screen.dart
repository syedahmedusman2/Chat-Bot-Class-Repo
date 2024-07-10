import 'package:chatbot_app/components/chatBubble.dart';
import 'package:chatbot_app/controllers/chat_controller.dart';
import 'package:chatbot_app/models/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (cont) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView.builder(
            controller: cont.chatScrollController,
            itemCount: cont.chats.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                isMyChat: cont.chats[index].isMyChat,
                chatData: cont.chats[index],
              );
            }),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Material(
            color: Colors.white,
            child: TextFormField(
              controller: cont.chatFieldController,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Enter Prompt Here",
                suffixIcon: InkWell(
                  onTap: () {
                    cont.postChatMessage();
                    // cont.addChat(ChatModel(
                    //     chatContent: cont.chatFieldController.text,
                    //     isMyChat: true,
                    //     chatTime: DateTime.now()));
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
        ),
      );
    });
  }
}
