import 'package:flutter/material.dart';

import 'package:group_6/core/my_colors.dart';
import 'package:group_6/core/widgets/rounded_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e2f5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 4, child: buildLogoContainer(context)),
          Flexible(flex: 2, child: buildButtonContainer(context))
        ],
      ),
    );
  }

  Container buildLogoContainer(context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: buildLogo(context),
    );
  }

  Center buildLogo(context) {
    return Center(
      child: Image(image: AssetImage("assets/robot_profile.gif")),
    );
  }

  Container buildButtonContainer(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffe9e2f5), Colors.white]),
      ),
      child: buildSignInButton(context),
    );
  }

  Center buildSignInButton(context) {
    return Center(
      child: RoundedButtonWidget(
        toolTip: "Sign In With Github",
        color: MyColors.PURPLE,
        text: "Sign in with Github",
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
        onPressed: () {},
      ),
    );
  }
}
