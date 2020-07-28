import 'package:flutter/material.dart';

class MessageSender extends StatefulWidget {
  final Function(String text) onSend;

  const MessageSender({Key key, this.onSend}) : super(key: key);

  @override
  _MessageSenderState createState() => _MessageSenderState();
}

class _MessageSenderState extends State<MessageSender> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextField(
        controller: myController,
        decoration: buildInputDecoration(),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: "Bir mesaj yazın.",
      contentPadding: EdgeInsets.only(left: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      suffixIcon: InkWell(
        onTap: () {
          final text = myController.text;
          myController.clear();
          widget.onSend?.call(text);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
