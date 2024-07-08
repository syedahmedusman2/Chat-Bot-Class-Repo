import 'package:chatbot_app/models/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatModel> chats = [];
  TextEditingController chatFieldController = TextEditingController();
  addChat(ChatModel chatData) {
    chats.add(chatData);
    chats.add(ChatModel(
        chatContent: chatFieldController.text,
        isMyChat: false,
        chatTime: DateTime.now()));
    chatFieldController.clear();
    update();
  }
}
