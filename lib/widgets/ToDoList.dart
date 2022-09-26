import 'package:flutter/material.dart';
import '../models/ToDo.dart';
import 'ToDoItem.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> todos;

  ToDoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, index) => 
      ToDoItem(todo: todos[index] )
    );
  }
}