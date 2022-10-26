import 'package:flutter/material.dart';
import 'package:template/Model/ToDo.dart';
import 'dart:collection';

import 'API.dart';

//state för att hantera interaktion i UI

class ToDoListState extends ChangeNotifier {
  List<ToDo> _ToDoList = [];
  String filter = "All";

  ToDoListState() {
    fetchToDos();
  }

  UnmodifiableListView<ToDo> get ToDoList => UnmodifiableListView(_ToDoList.reversed);

  void setFilter(popUpMenuValue) {
    filter = popUpMenuValue;
    notifyListeners();
  }

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
