import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/provider/ToDoListState.dart';
import '../../widgets/ToDoList.dart';

//vyn för när man filtrerar på alla ToDos

class AllToDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ToDoListState>(
        builder: (context, todos, child) => ToDoList(
              todos: todos.allToDos,
            ),
      ),
    );
  }
}

//vyn för när man filtrerar på färdiga ToDos

class DoneToDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ToDoListState>(
        builder: (context, todos, child) => ToDoList(
          todos: todos.doneToDos,
        ),
      ),
    );
  }
}

//vyn för när man filtrerar på ofärdiga ToDos

class UndoneToDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ToDoListState>(
        builder: (context, todos, child) => ToDoList(
              todos: todos.undoneToDos,
            ),
      ),
    );
  }
}