import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_6/core/route_names.dart';
import 'package:group_6/service/myauth.dart';
import 'package:group_6/views/signin/sign_base.dart';
import 'package:group_6/views/signin/sign_up_page.dart';
import 'package:group_6/core/my_colors.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends SignBase<SigninPage> {
  String email = "", password = "";
  GlobalKey<ScaffoldState> scaffold = GlobalKey();

  void onSigninTap() async {
    try {
      await MyAuth().signIn(email.trim(), password.trim());
      var user = await MyAuth().getCurrentUser();
      if (user != null) {
        Navigator.of(context).pushNamed(RouteNames.WELCOME);
      }
    } catch (e) {
      scaffold.currentState
          .showSnackBar(SnackBar(content: Text("Hatalı Giriş")));
    }
  }

  void onSignupTap() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return SignupPage();
        },
      ),
    );
  }

  void onChangeEmail(String text) {
    setState(() {
      email = text;
    });
  }

  void onChangePassword(String text) {
    setState(() {
      password = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.PURPLE,
        key: scaffold,
        body: Center(
          child: buildCard(buildFormContent()),
        ),
      ),
    );
  }

  Column buildFormContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildTitle("Sign in"),
        SizedBox(height: 20),
        buildTextFormField(
          "Email",
          onChangeEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10),
        buildTextFormField(
          "Password",
          onChangePassword,
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        SizedBox(height: 20),
        buildBottomRow([
          buildFlatButton("Sign up", onSignupTap),
          buildButton("Sign in", MyColors.PURPLE, onSigninTap),
        ]),
      ],
    );
  }
}
