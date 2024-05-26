import 'package:flutter/material.dart';
import 'package:flutter_gemini_ai/modules/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(title: const Text('test')),
          body: Center(
              child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width > 600
                ? 400
                : MediaQuery.of(context).size.width,
            child: Stack(children: [
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 60,
                  child: ListView.builder(
                    itemCount: value.listChat.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, i) {
                      final data = value.listChat[i];
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: data.posisi == "kanan"
                                  ? Colors.green[200]
                                  : Colors.grey[100]),
                          margin: EdgeInsets.only(
                            bottom: 8,
                            left: data.posisi == 'kanan' ? 80 : 16,
                            right: data.posisi == 'kiri' ? 80 : 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  data.chat,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ));
                    },
                  )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 50,
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        controller: value.chatValue,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: value.sendMessage,
                              icon: const Icon(Icons.send),
                            ),
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none)),
                      )),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.camera_alt,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.mic, size: 20),
                      const SizedBox(width: 10),
                    ]),
                  ))
            ]),
          )),
        ),
      ),
    );
  }
}
