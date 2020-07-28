import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/service/message.dart';

class TestView extends StatefulWidget {
  TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  Category category = Category(0, "flutter", "description");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Fireabse Test")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildMessageList(),
            buildMessageSender(),
          ],
        ),
      ),
    );
  }

  Widget buildMessageSender() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Message"),
                  controller: controller1,
                ),
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.send),
              onPressed: () {
                MessageService().sendMessage(
                    category,
                    Message(
                      0,
                      controller1.text,
                      null,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(
        query: MessageService().messageQuery(category),
        itemBuilder: (context, snapshot, animation, index) {
          return buildMessageCard(
            Message.fromJsom(snapshot.value),
          );
        },
      ),
    );
  }

  Card buildMessageCard(Message message) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(message.user.name),
          ],
        ),
      ),
    );
  }
}
