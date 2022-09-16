import 'package:flutter/material.dart';

class NewToDoView extends StatefulWidget {
  @override
  State<NewToDoView> createState() => _NewToDoViewState();
}

class _NewToDoViewState extends State<NewToDoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG333 Todo"),
      ),
      body: Center(
        child: Column(
          children: [
            _inputTodo(),
            _createToDoButton(),
          ],
        ),
      ),
    );
  }
}

Widget _inputTodo() {
  return Container(
    margin: EdgeInsets.only(
      top: 87,
      left: 30,
      right: 30,
    ),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "What are you going to do?",
      ),
    ),
  );
}

Widget _createToDoButton() {
  return Container(
    margin: EdgeInsets.only(
      top: 47,
      left: 155,
      right: 100,
    ),
    child: TextButton(
      child: Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.black,
          ),
          Text(
            "Add",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      onPressed: () {},
    ),
  );
}
