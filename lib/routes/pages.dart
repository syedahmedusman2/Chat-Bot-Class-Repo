import 'package:chatbot_app/bindings.dart/chatBinding.dart';
import 'package:chatbot_app/view/chat_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: '/chatScreen', page: () => ChatScreen(), binding: ChatBinding())
  ];
}
