class ChatModel {
  ChatModel(
      {required this.chatContent,
      required this.isMyChat,
      required this.chatTime,
      this.isChatAnimated = false
      });
  final String chatContent;
  final bool isMyChat;
  final DateTime chatTime;
  bool isChatAnimated;
}
