import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini_ai/models/index.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getData();
  }

  List<String> chat = [];
  List<ChatModel> listChat = [];

  TextEditingController chatValue = TextEditingController();

  sendMessage() {
    chat.add(chatValue.text);
    chatValue.clear();
    notifyListeners();
  }

  getData() async {
    Dio dio = Dio();
    final response = await dio.get("https://tegaldev.metimes.id/chat-sample");
    final results = jsonDecode(response.data);
    for (Map<String, dynamic> i in results['data']) {
      listChat.add(ChatModel.fromJson(i));
    }
  }
}
