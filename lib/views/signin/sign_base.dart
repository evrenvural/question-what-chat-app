import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class SignBase<T extends StatefulWidget> extends State<T> {
  Card buildCard(Widget child) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
        child: Form(
          child: child,
        ),
      ),
    );
  }

  Align buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
    String hintText,
    Function(String text) onChange, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  RaisedButton buildButton(String text, Color color, Function() onTab) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      onPressed: onTab,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  FlatButton buildFlatButton(String text, Function() onTab) {
    return FlatButton(onPressed: onTab, child: Text(text));
  }

  Widget buildBottomRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
