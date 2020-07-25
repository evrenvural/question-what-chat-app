import 'package:flutter/material.dart';
import 'package:group_6/core/category/category_list.dart';

class MenuWidget extends StatelessWidget {
  final OnCategorySelected onCategorySelected;

  const MenuWidget({Key key, this.onCategorySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildTopImage(),
          Expanded(child: CategoryList()),
        ],
      ),
    );
  }

  Stack buildTopImage() {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            "assets/background.png",
            fit: BoxFit.cover,
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            "assets/robot_profile.gif",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
