import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:group_6/service/firebase.dart';

class TestView extends StatefulWidget {
  TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Fireabse Test")),
        body: FirebaseAnimatedList(
          query: FirebaseService().testQuery,
          itemBuilder: (context, snapshot, animation, index) {
            return buildMessageCard(snapshot.value as Map<dynamic, dynamic>);
          },
        ),
      ),
    );
  }

  Card buildMessageCard(Map map) {
    return Card(
        elevation: 2,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                map["text"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(map["userName"]),
            ],
          ),
        ));
  }
}
