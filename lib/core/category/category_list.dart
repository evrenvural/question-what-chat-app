import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_6/core/category/category_list_item.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/provider/category_provider.dart';

class CategoryList extends StatelessWidget {
  final OnCategorySelected onCategorySelected;

  const CategoryList({Key key, this.onCategorySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildListView();
  }

  Widget buildListView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: FirebaseAnimatedList(
        query: CategoryProvider().categoryQuery,
        defaultChild: Center(child: CircularProgressIndicator()),
        itemBuilder: (context, snapshot, animation, index) {
          final category = Category.fromJson(snapshot.value);
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: InkWell(
                onTap: () => onCategorySelected?.call(category),
                child: CategoryListItem(category: category)),
          );
        },
      ),
    );
  }
}

typedef OnCategorySelected = Function(Category category);
