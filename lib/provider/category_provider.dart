
import 'package:group_6/model/category.dart';

class CategoryProvider {
  
  Future<List<Category>> getCategories() async{
    return testData;//fetch from firebase
  }
  
  static final CategoryProvider _categoryProvider = CategoryProvider._internal();
  
  factory CategoryProvider() {
    return _categoryProvider;
  }
  
  CategoryProvider._internal();
  
}

const testData = <Category>[
  const Category(0, "Flutter", "description"),
  const Category(1, "Dart", "description"),
  const Category(2, "Android", "description"),
  const Category(3, "Kotlin", "description"),
  const Category(4, "NodeJs", "description"),
  const Category(5, "React", "description"),
];