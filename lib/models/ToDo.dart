import 'package:flutter/material.dart';

//klass ToDO

class ToDo {
  ToDo({required this.id, required this.text, this.checked = false});
  String id; 
  String text;
  bool checked;

  void changeChecked () {
    checked = !checked;
  }

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      text: json['title'],
      checked: json['done'],
    );
  }
}