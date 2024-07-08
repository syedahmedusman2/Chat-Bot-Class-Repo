class ChatModel {
  ChatModel(
      {required this.chatContent,
      required this.isMyChat,
      required this.chatTime});
  final String chatContent;
  final bool isMyChat;
  final DateTime chatTime;
}
