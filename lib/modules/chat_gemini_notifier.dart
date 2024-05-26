import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatGeminiNotifier extends ChangeNotifier {
  final BuildContext context;

  ChatGeminiNotifier({required this.context});

  final Gemini gemini = Gemini.instance;

  List<ChatMessage> listMessages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "Shal");

  ChatUser geminiUser = ChatUser(id: "1", firstName: "Gemini");

  sendMessage(ChatMessage value) {
    listMessages = [value, ...listMessages];
    notifyListeners();
    try {
      String values = value.text;
      gemini.streamGenerateContent(values).listen((event) {
        String response = event.content!.parts
                ?.fold("", (before, after) => "$before ${after.text}") ??
            '';

        ChatMessage resultMessage = ChatMessage(
            user: geminiUser, createdAt: DateTime.now(), text: response);
        listMessages = [resultMessage, ...listMessages];
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }
}
