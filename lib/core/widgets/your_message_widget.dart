import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:group_6/core/my_colors.dart';
import 'package:group_6/model/message.dart';

class YourMessageWidget extends StatelessWidget {
  const YourMessageWidget({
    Key key,
    @required this.message,
    @required this.user,
  }) : super(key: key);

  final Message message;
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03, left: MediaQuery.of(context).size.width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildMessageInfo(context),
          buildMessageBox(context),
        ],
      ),
    );
  }

  Container buildMessageInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7.0, bottom: 6.0, left: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildMessageInfoName(context),
          // buildMessageInfoAvatar(),
        ],
      ),
    );
  }

  Text buildMessageInfoName(BuildContext context) {
    return Text(
      message.user.name,
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(color: MyColors.BLUE, fontWeight: FontWeight.w900),
    );
  }

  Padding buildMessageInfoAvatar() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
          radius: 12, backgroundImage: AssetImage('assets/robot_profile.gif')),
    );
  }

  Container buildMessageBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03,
          horizontal: MediaQuery.of(context).size.height * 0.03),
      decoration: buidBorderDecoration(),
      child: buildMessageText(context),
    );
  }

  BoxDecoration buidBorderDecoration() {
    return BoxDecoration(
      color: MyColors.BLUE,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(180.0),
        bottomRight: Radius.circular(180.0),
        topLeft: Radius.circular(120.0),
      ),
    );
  }

  Text buildMessageText(BuildContext context) {
    return Text(
      message.text,
      style:
          Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
    );
  }
}
