import 'package:chatbot_app/models/chatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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

  ScrollController chatScrollController = ScrollController();

  int? value;

  postChatMessage() async {
    String chatMessage = chatFieldController.text;
    chats.add(ChatModel(
        chatContent: chatMessage, isMyChat: true, chatTime: DateTime.now()));
    update();
    chatFieldController.clear();
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: '');
    final content = [Content.text('${chatMessage}')];
    final response = await model.generateContent(content);
    if (response != null) {
      chatFieldController.clear();
      chats.add(ChatModel(
          chatContent: response.text!,
          isMyChat: false,
          chatTime: DateTime.now()));
    }
    update();
  }
}
