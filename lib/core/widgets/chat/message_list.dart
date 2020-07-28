import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/my_message_widget.dart';
import 'package:group_6/core/widgets/your_message_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/provider/category_provider.dart';
import 'package:group_6/provider/user_provider.dart';
import 'package:group_6/service/message.dart';

class MessageList extends StatefulWidget {
  final Category category;

  const MessageList({Key key, this.category}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState(category);
}

class _MessageListState extends State<MessageList> {
  Category category;

  List<Message> messages = [];

  List<Message> messagesReversed = [];

  bool loading = true;

  _MessageListState(this.category);

  onMessagesAdd(DataSnapshot rawMessage) {
    messages.add(Message.fromJsom(rawMessage.value));
    setState(() {
      loading = false;
      messagesReversed = messages.reversed.toList();
    });
  }

  @override
  void initState() {
    super.initState();

    CategoryProvider().onCategoryChange = (currentCategory) {
      setState(() {
        loading = true;
      });
      messages.clear();
      MessageService().listenMessageLoad(currentCategory, onMessagesAdd);
    };

    CategoryProvider().onCategoryChange(category);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: messagesReversed.length,
        reverse: true,
        itemBuilder: (context, index) {
          return buildMessageView(messagesReversed[index]);
        },
      );
    }
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
