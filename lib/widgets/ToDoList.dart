import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/ToDo.dart';
import '../Model/ToDoListState.dart';
import 'ToDoItem.dart';

class ToDoList extends StatelessWidget {
  final List<ToDo> todos;

  ToDoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListState>(
        builder: (context, state, child) => ListView.builder(
        itemCount: filteredToDoList(todos, state.filter).length,
        itemBuilder: (BuildContext context, index) =>
            ToDoItem(todo: filteredToDoList(todos, state.filter)[index])));
  }

  List<ToDo> filteredToDoList(list, filtervalue) {
    if (filtervalue == "Done") {
      return list.where((item) => item.checked == true).toList();
    }
    if (filtervalue == "Undone") {
      return list.where((item) => item.checked == false).toList();
    } else {
      return list;
    }
  }
}

class DisplayToDoList extends StatelessWidget {
  const DisplayToDoList({super.key});

  Widget build(BuildContext context) {
    return Consumer<ToDoListState>(
        builder: (context, state, child) => ToDoList(todos: state.ToDoList));
  }
}
