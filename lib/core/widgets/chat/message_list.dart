import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/provider/user_provider.dart';
import 'package:group_6/service/message.dart';

class MessageList extends StatelessWidget {
  final Category category;

  const MessageList({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: MessageService().messageQuery(category),
      defaultChild: Center(child: CircularProgressIndicator()),
      itemBuilder: (context, snapshot, animation, index) {
        return buildMessageView(
          Message.fromJsom(snapshot.value),
        );
      },
    );
  }

  Widget buildMessageView(Message message) {
    final currentUser = UserProvider().currentUser;
    return Card(
      margin: EdgeInsets.all(5),
      color: currentUser.uid == message.user.id
          ? Colors.grey.withOpacity(0.1)
          : null,
      child: Container(
        padding: EdgeInsets.all(10),
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
