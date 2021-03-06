import 'package:firebase_database/firebase_database.dart';
import 'package:group_6/model/category.dart';
import 'package:group_6/model/message.dart';
import 'package:group_6/service/firebase.dart';
import 'package:group_6/service/myauth.dart';

class MessageService {
  final String categoriesKey = "categories";
  final String messagesKey = "messages";

  DatabaseReference messageQuery(Category category) {
    return FirebaseService()
        .database
        .reference()
        .child(categoriesKey)
        .child(category.name)
        .child(messagesKey);
  }

  Future<bool> sendMessage(Category category, Message message) async {
    var currentUser = await MyAuth().getCurrentUser();

    var messagesReference = messageQuery(category);

    var user = User(currentUser.uid, currentUser.email);

    await messagesReference.push().set(
      {
        "text": message.text,
        "user": {
          "id": user.id,
          "email": user.email,
        },
      },
    );

    return true;
  }

  static final MessageService _messageService = MessageService._internal();

  factory MessageService() {
    return _messageService;
  }

  MessageService._internal();
}
