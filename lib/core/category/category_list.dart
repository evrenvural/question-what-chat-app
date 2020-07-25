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
    return FutureBuilder(
      future: CategoryProvider().getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return Center(child: Text("Error"));
          }
          return buildListView(snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildListView(List<Category> categories) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15,0,15,15),
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
              onTap: () => onCategorySelected?.call(category),
              child: CategoryListItem(category: category));
        },
      ),
    );
  }
}

typedef OnCategorySelected = Function(Category category);
