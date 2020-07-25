import 'package:flutter/material.dart';

import 'package:group_6/core/route_names.dart';
import 'package:group_6/views/chat_view.dart';
import 'package:group_6/views/home_view.dart';
import 'package:group_6/views/login_view.dart';
import 'package:group_6/views/welcome_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomeView(),
      routes: {
        RouteNames.WELCOME: (context) => WelcomeView(),
        RouteNames.LOGIN: (context) => LoginView(),
        RouteNames.HOME: (context) => HomeView(),
        RouteNames.CHAT: (context) => ChatView(),
      },
    );
  }
}