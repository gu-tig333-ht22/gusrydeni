import 'package:flutter/material.dart';
import 'package:template/models/ToDo.dart';
import 'dart:collection';
import 'package:template/provider/API.dart';

//state för att hantera interaktion i UI

class ToDoListState extends ChangeNotifier {
  List<ToDo> _ToDoList = [];

  ToDoListState() {
    fetchToDos();
  }

  UnmodifiableListView<ToDo> get allToDos =>
      UnmodifiableListView(_ToDoList.reversed);
  UnmodifiableListView<ToDo> get undoneToDos =>
      UnmodifiableListView((_ToDoList.reversed).where((todo) => !todo.checked));
  UnmodifiableListView<ToDo> get doneToDos =>
      UnmodifiableListView((_ToDoList.reversed).where((todo) => todo.checked));

  fetchToDos() async {
    List rawList = await API.fetchlist();
    _ToDoList = jsonConvert(rawList);
    notifyListeners();
  }

  addToDo(newtext) async {
    List rawList = await API.postToDo(newtext);
    _ToDoList = jsonConvert(rawList);
    notifyListeners();
  }

  updateToDo(ToDo todo) async {
    todo.changeChecked();
    List rawList = await API.putToDo(todo);
    _ToDoList = jsonConvert(rawList);
    notifyListeners();
  }

  removeToDo(ToDo todo) async {
    List rawList = await API.deleteToDo(todo);
    _ToDoList = jsonConvert(rawList);
    notifyListeners();
  }

  List<ToDo> jsonConvert(List rawList) {
    List<ToDo> ToDoList = [];

    for (Map<String, dynamic> i in rawList) {
      ToDoList.add(ToDo.fromJson(i));
    }
    return ToDoList;
  }
}
