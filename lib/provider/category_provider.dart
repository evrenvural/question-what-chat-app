
import 'package:firebase_database/firebase_database.dart';
import 'package:group_6/service/firebase.dart';

class CategoryProvider {

  final String categoriesKey = "categories_info";

  Query get categoryQuery {
    return FirebaseService()
        .database
        .reference()
        .child(categoriesKey);
  }
  
  static final CategoryProvider _categoryProvider = CategoryProvider._internal();
  
  factory CategoryProvider() {
    return _categoryProvider;
  }
  
  CategoryProvider._internal();
}