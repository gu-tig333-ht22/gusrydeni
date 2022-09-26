import 'package:flutter/material.dart';

//klass ToDO

class ToDo {
  ToDo({required this.text, this.checked = false});
  String text;
  bool checked;

  void changeChecked () {
    checked = !checked;
  }
}