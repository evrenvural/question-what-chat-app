import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/my_message_widget.dart';
import 'package:group_6/core/widgets/your_message_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/provider/user_provider.dart';
import 'package:group_6/service/message.dart';
import 'package:group_6/service/myauth.dart';

class MessageList extends StatelessWidget {
  final Category category;
  final ScrollController scrollController;

  const MessageList({Key key, this.category, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: MyAuth().getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildFirebaseAnimatedList();
        }
        return Center(child: CircularProgressIndicator());
      },
    ));
  }

  FirebaseAnimatedList buildFirebaseAnimatedList() {
    return FirebaseAnimatedList(
      query: MessageService().messageQuery(category),
      defaultChild: Center(child: CircularProgressIndicator()),
      controller: scrollController,
      itemBuilder: (context, snapshot, animation, index) {
        return buildMessageView(
          Message.fromJsom(snapshot.value),
        );
      },
    );
  }

  Widget buildMessageView(Message message) {
    final user = UserProvider().currentUser;
    return user.uid == message.user.id
        ? MyMessageWidget(user: user, message: message)
        : YourMessageWidget(user: user, message: message);
  }
}
