import 'package:flutter/widgets.dart';
import 'package:group_6/model/category.dart';

import '../colors.dart';

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
                  color: Colors.BLUE,
                ),
              ),
              child: Center(
                child: Text(
                  category.name,
                  //textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  style: TextStyle(
                    color: Colors.BLUE,
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
