import 'package:flutter/material.dart';
import 'package:group_6/core/my_colors.dart';
import 'package:group_6/core/widgets/rounded_button_widget.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9e2f5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 4, child: buildTopContainer(context)),
          Flexible(flex: 2, child: buildButtonContainer(context))
        ],
      ),
    );
  }
}

Container buildTopContainer(context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.topCenter,
        image: AssetImage("assets/robotgif.gif"),
        fit: BoxFit.fill,
      ),
    ),
    //child: buildSignInButton(context)
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
      toolTip: "WELCOME",
      color: MyColors.BLUE,
      text: "WELCOME",
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      onPressed: () {},
    ),
  );
}
