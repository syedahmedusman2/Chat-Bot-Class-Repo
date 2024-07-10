import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot_app/controllers/chat_controller.dart';
import 'package:chatbot_app/models/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, this.isMyChat = false, required this.chatData});
  bool isMyChat;
  ChatModel chatData;

  ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMyChat ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
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
          child: isMyChat == true
              ? Text(
                  chatData.chatContent,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              : chatData.isChatAnimated == true
                  ? Text(
                      chatData.chatContent,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  : AnimatedTextKit(
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      
                      onFinished: () {
                        chatData.isChatAnimated = false;
                        _chatController.chatScrollController.animateTo(
                          _chatController
                              .chatScrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          
                        );
                      },
                      animatedTexts: [
                          TypewriterAnimatedText(
                            
                            chatData.chatContent,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            speed: const Duration(milliseconds: 50),
                          ),
                        ]),
        ),
      ],
    );
  }
}
