import 'package:flutter/material.dart';

import 'package:group_6/core/my_colors.dart';
import 'package:group_6/core/widgets/rounded_button_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e2f5),
      body: buildLogoContainer(context),
    );
  }

  Container buildLogoContainer(context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/robotgif.gif"),
          fit: BoxFit.fill,
        ),
      ),
      child: buildSignInButton(context),
    );
  }

  Container buildSignInButton(context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
      alignment: Alignment.bottomCenter,
      child: RoundedButtonWidget(
        toolTip: "Welcome",
        color: MyColors.BLUE,
        text: "WELCOME",
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 42.0),
        onPressed: () {},
      ),
    );
  }
}
