import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/appbar_widget.dart';
import 'package:group_6/core/widgets/chat/message_sender.dart';
import 'package:group_6/core/widgets/menu_widget.dart';
import 'package:group_6/core/widgets/my_message_widget.dart';
import 'package:group_6/core/widgets/mylist.dart';
import 'package:group_6/core/widgets/your_message_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/provider/user_provider.dart';
import 'package:group_6/service/message.dart';

class ChatView extends StatefulWidget {
  final Category category;

  ChatView({Key key, this.category}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  GlobalKey listKey = GlobalKey();

  Category category;

  MediaQueryData get mediaQueryData => MediaQuery.of(context);

  @override
  void initState() {
    setState(() {
      category = widget.category;
    });
    super.initState();
  }

  void onMessageSend(String messageText) {
    MessageService().sendMessage(
      category,
      Message(
        0,
        messageText,
        null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBarWidget(
        titleText: category.name,
        onPressed: () => _drawerKey.currentState.openDrawer(),
      ),
      drawer: MenuWidget(
        onCategorySelected: (category) {
          _drawerKey.currentState.openEndDrawer();
          setState(() {
            this.category = category;
            listKey = GlobalKey();
          });
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MyFirebaseAnimatedList(
              query: MessageService().messageQuery(category),
              key: listKey,
              reverse: true,
              itemBuilder: (context, snapshot, animation, index) {
                return buildMessageView(Message.fromJsom(snapshot.value));
              },
            ),
          ),
          Container(
            height: mediaQueryData.size.height * 1 / 14,
            child: MessageSender(onSend: onMessageSend),
          ),
        ],
      ),
    );
  }

  Widget buildMessageView(Message message) {
    final user = UserProvider().currentUser;
    return user.uid == message.user.id
        ? MyMessageWidget(user: user, message: message)
        : YourMessageWidget(user: user, message: message);
  }
}
