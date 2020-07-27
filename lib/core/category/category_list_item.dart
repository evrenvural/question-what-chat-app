import 'package:flutter/widgets.dart';

import 'package:group_6/core/my_colors.dart';
import 'package:group_6/model/category.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;

  const CategoryListItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: MyColors.BLUE,
                ),
              ),
              child: Center(
                child: Text(
                  category.name,
                  //textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  style: TextStyle(
                    color: MyColors.BLUE,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
