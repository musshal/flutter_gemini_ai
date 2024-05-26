import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini_ai/modules/chat_gemini_notifier.dart';
import 'package:provider/provider.dart';

class CHatGeminiPage extends StatelessWidget {
  const CHatGeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ChatGeminiNotifier(context: context),
        child: Consumer<ChatGeminiNotifier>(
            builder: (context, value, child) => Scaffold(
                    body: DashChat(
                  currentUser: value.currentUser,
                  onSend: value.sendMessage,
                  messages: value.listMessages,
                ))));
  }
}
