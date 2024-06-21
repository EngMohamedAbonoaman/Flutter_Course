import 'package:flutter/material.dart';
import 'package:todoapp2/widgets/buildtextfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  List<Map<String, dynamic>> chat = [
    {
      "id": 1,
      "msg": "Hello my friend",
    },
    {
      "id": 2,
      "msg": "Hello Ali",
    },
    {
      "id": 1,
      "msg": "Hello Ahmed",
    },
    {
      "id": 1,
      "msg": "How are you ?",
    },
    {
      "id": 2,
      "msg": "I am fine",
    },
    {
      "id": 2,
      "msg": "And you ?",
    },
    {
      "id": 1,
      "msg": "I am fine thank you.",
    }
  ];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        elevation: 30,
        backgroundColor: Colors.white,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(
            builder: (context, constrains) => SizedBox(
              width: constrains.maxWidth * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.abc),
                  ),
                  SizedBox(
                    width: constrains.maxWidth * .07,
                  ),
                  Text(
                    "Mohamed Noaman",
                    style: TextStyle(
                      fontSize: constrains.maxWidth * .08,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .85,
              child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 5, right: 15, left: 15),
                  child: chat[index]['id'] == 1
                      ? buildSenderMSG(
                          chat[index]['msg'],
                        )
                      : buildReceiverMSG(chat[index]['msg']),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .15,
              child: BuildTextField(
                hint: "Your MSG...",
                validate: () {},
                padding: 15,
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSenderMSG(String msg) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            msg,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget buildReceiverMSG(String msg) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: const BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            msg,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}
