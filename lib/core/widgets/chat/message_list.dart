import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/my_message_widget.dart';
import 'package:group_6/core/widgets/your_message_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/provider/user_provider.dart';
class MessageList extends StatelessWidget {
  final Category category;

  MessageList(this.category);

  @override
  Widget build(BuildContext context) {
    return Text("ad");
  }

  Widget buildMessageView(Message message) {
    final user = UserProvider().currentUser;
    return user.uid == message.user.id
        ? MyMessageWidget(user: user, message: message)
        : YourMessageWidget(user: user, message: message);
  }

  /*return FirebaseAnimatedList(
      query: MessageService().messageQuery(widget.category),
      itemBuilder: (context, snapshot, animation, index) {
        return buildMessageView(Message.fromJsom(snapshot.value));
      },
    );*/
}
