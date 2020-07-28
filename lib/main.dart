import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:group_6/core/route_names.dart';
import 'package:group_6/service/myauth.dart';
import 'package:group_6/views/chat_view.dart';
import 'package:group_6/views/home_view.dart';
import 'package:group_6/views/signin/sign_in_page.dart';
import 'package:group_6/views/welcome_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return SigninPage();
            } else {
              return WelcomeView();
            }
          }
          return CircularProgressIndicator();
        },
      ),
      routes: {
        RouteNames.WELCOME: (context) => WelcomeView(),
        RouteNames.LOGIN: (context) => SigninPage(),
        RouteNames.HOME: (context) => HomeView(),
        RouteNames.CHAT: (context) => ChatView(),
      },
    );
  }

  Future<FirebaseUser> getUser() async {
    return await MyAuth().getCurrentUser();
  }
}
