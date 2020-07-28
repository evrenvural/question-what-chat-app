import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildMessageView();
        },
      ),
    );
  }

  Container buildMessageView() {
    return Container(
      height: 50,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
