import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/models/ToDo.dart';
import 'package:template/provider/API.dart';
import 'package:template/provider/ToDoListState.dart';

//ny skärm för när man vill skapa en ny ToDo

class NewToDoView extends StatefulWidget {
  const NewToDoView({super.key});

  @override
  State<NewToDoView> createState() => _NewToDoViewState();
}

class _NewToDoViewState extends State<NewToDoView> {
  final ToDoTextController = TextEditingController();

  @override
  void dispose() {
    ToDoTextController.dispose();
    super.dispose();
  }

  void addnewtodo() {
    final String newtext = ToDoTextController.text;
    if (newtext.isNotEmpty) {
      Provider.of<ToDoListState>(context, listen: false).addToDo(newtext);
      Navigator.pop(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG333 Todo"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 87,
                left: 30,
                right: 30,
              ),
              child: TextField(
                controller: ToDoTextController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: "What are you going to do?",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            Container(
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
                onPressed: addnewtodo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
