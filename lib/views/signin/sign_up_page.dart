import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_6/core/route_names.dart';
import 'package:group_6/service/myauth.dart';
import 'package:group_6/views/signin/sign_base.dart';
import 'package:group_6/views/signin/sign_in_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends SignBase<SignupPage> {
  String email = "", password1 = "", password2 = "";

  void onSignupTap() async {
    if (password1 == password2) {
      var userId = await MyAuth().signUp(email, password1);
      if (userId != null) {
        Navigator.of(context).pushNamed(RouteNames.WELCOME);
      }
    } else {}
  }

  void onSigninTap() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return SigninPage();
        },
      ),
    );
  }

  void onChangeEmail(String text) {
    setState(() {
      email = text;
    });
  }

  void onChangePassword1(String text) {
    setState(() {
      password1 = text;
    });
  }

  void onChangePassword2(String text) {
    setState(() {
      password2 = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        buildTitle("Sign up"),
        SizedBox(height: 20),
        buildTextFormField(
          "Email",
          onChangeEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10),
        buildTextFormField(
          "Password",
          onChangePassword1,
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        SizedBox(height: 10),
        buildTextFormField(
          "Password Again",
          onChangePassword2,
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        SizedBox(height: 20),
        buildBottomRow([
          buildFlatButton("Sign in", onSigninTap),
          buildButton("Sign up", Colors.orange, onSignupTap),
        ]),
      ],
    );
  }
}
