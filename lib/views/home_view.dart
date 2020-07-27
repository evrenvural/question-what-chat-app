import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/appbar_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/views/chat_view.dart';

import '../core/widgets/menu_widget.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _drawerKey,
      appBar: AppBarWidget(
        onPressed: () => _drawerKey.currentState.openDrawer(),
      ),
      drawer: MenuWidget(
        onCategorySelected: (category) {
          gotoChatPage(context, category);
        },
      ),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Flexible(flex: 4, child: buildBackgroundPhoto())
        ],
      ),
    );
  }

  Container buildBackgroundPhoto() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_with_tech.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  // TODO : Parametre göndermem gerektiği için pushNamed kullanamadım.
  void gotoChatPage(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChatView(category: category);
        },
      ),
    );
  }
}
