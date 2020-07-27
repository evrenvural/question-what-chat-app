import 'package:flutter/material.dart';
import 'package:group_6/core/widgets/appbar_widget.dart';

import '../core/widgets/menu_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onPressed: () {},
      ),
      drawer: MenuWidget(),
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
}
