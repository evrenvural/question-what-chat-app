import 'package:flutter/material.dart';

import 'package:group_6/core/my_colors.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildMessageInfo(context),
        buildMessageBox(context),
      ],
    );
  }

  Container buildMessageInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0, right: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          buildMessageInfoName(context),
          buildMessageInfoAvatar(),
        ],
      ),
    );
  }

  Text buildMessageInfoName(BuildContext context) {
    return Text(
      "Beatrice",
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(color: MyColors.PURPLE, fontWeight: FontWeight.w900),
    );
  }

  Padding buildMessageInfoAvatar() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage('assets/robot_profile.gif')),
    );
  }

  Container buildMessageBox(BuildContext context) {
    return Container(
      height: 75,
      width: 300,
      padding: EdgeInsets.all(8.0),
      decoration: buidBorderDecoration(),
      child: buildMessageText(context),
    );
  }

  BoxDecoration buidBorderDecoration() {
    return BoxDecoration(
      color: MyColors.PURPLE,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(180.0),
        bottomLeft: Radius.circular(180.0),
        topRight: Radius.circular(120.0),
      ),
    );
  }
}

Center buildMessageText(BuildContext context) {
  return Center(
    child: Text(
      "And what about Carnival time?",
      style:
          Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
    ),
  );
}
