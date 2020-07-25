import 'package:flutter/material.dart';

import '../core/widgets/menu_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: MenuWidget(
          onCategorySelected: (category) {
            print("Category selected : " + category.name);
          },
        ),
        body: Center(
          child: Text("Home View"),
        ),
      ),
    );
  }
}
