import 'package:flutter/material.dart';

import 'constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        title: Text("Ahmed Noaman"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildMyBubbleChat(),
        ),
      ),
    );
  }
}

Widget buildUserBubbleChat() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Hello to my friend"),
        ),
      ),
    ],
  );
}

Widget buildMyBubbleChat() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Hello to my friend"),
        ),
      ),
    ],
  );
}
