
class Message{
  int id;

  String text;

  User user;

  Message.fromJsom(Map<dynamic, dynamic> json){
    text = json["text"];
    user = User.fromJson(json["user"]);
  }

  Message(this.id, this.text, this.user);
}

class User{
  String id;

  String email;

  String get name => email.split("@").first;

  User.fromJson(Map<dynamic, dynamic> json){
    id = json["id"];
    email = json["email"];
  }

  User(this.id, this.email);
}