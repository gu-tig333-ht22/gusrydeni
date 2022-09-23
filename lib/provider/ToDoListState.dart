import 'package:flutter/material.dart';
import 'package:template/models/ToDo.dart';
import 'dart:collection';

//state för att hantera interaktion i UI

class ToDoListState extends ChangeNotifier {
  List<ToDo> _ToDoList = [];

  UnmodifiableListView<ToDo> get allToDos => UnmodifiableListView(_ToDoList.reversed);
  UnmodifiableListView<ToDo> get undoneToDos =>
      UnmodifiableListView((_ToDoList.reversed).where((todo) => !todo.checked));
  UnmodifiableListView<ToDo> get doneToDos =>
      UnmodifiableListView((_ToDoList.reversed).where((todo) => todo.checked));
  

  void addToList(ToDo todo) {
    _ToDoList.add(todo);
    notifyListeners();
  }

  void handleToDoChanged(ToDo todo) {
    _ToDoList[_ToDoList.indexOf(todo)].changeChecked();
    notifyListeners();
  }

  void deleteToDo (ToDo todo) {
    _ToDoList.remove(todo);
    notifyListeners();
  }
}