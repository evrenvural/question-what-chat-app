import 'package:flutter/material.dart';
import 'package:group_6/core/my_colors.dart';
import 'package:group_6/core/widgets/appbar_widget.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/views/chat_view.dart';

import '../core/widgets/menu_widget.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  static String homeMessage = createMessage();

  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double windowWidth = MediaQuery.of(context).size.width;
    final double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _drawerKey,
      appBar: AppBarWidget(
        titleText: "Question What",
        onPressed: () => _drawerKey.currentState.openDrawer(),
      ),
      drawer: MenuWidget(
        onCategorySelected: (category) {
          gotoChatPage(context, category);
        },
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(
                windowWidth * 0.05,
                windowHeight * 0.05,
                windowWidth * 0.05,
                windowHeight * 0.025),
            child: Center(
              child: Text(
                homeMessage,
                style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: MyColors.PURPLE,
                    fontSize: 20.0),
              ),
            ),
          ),
          Spacer(flex: 1),
          Flexible(flex: 4, child: buildBackgroundPhoto()),
          Spacer(flex: 1)
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

  static String createMessage() {
    String message = "Welcome to the QuestionWhat App.";
    message += "\n Now the doors of a different world are being opened here.";
    message += "\n The people inside are the future itself.";
    message += "\n If you feel ready for this...";
    message += "\n You can go to the QuestionWhat App with your questions →";
    return message;
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
