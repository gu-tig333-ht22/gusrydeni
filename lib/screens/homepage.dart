import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG333 ToDo"),
        actions: [
          _popupMenuButton(),
        ],
      ),

      body: Text("Hej"),
      
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new ToDo!",
        backgroundColor: Color.fromARGB(255, 196, 196, 196),
        child: Icon(Icons.create),
        onPressed: () async {
          Navigator.pushNamed(context, "/NewToDoView");
        },
      ),
    );
  }
}

Widget _popupMenuButton() {
  return PopupMenuButton(itemBuilder: (context) {
    return [
      PopupMenuItem<int>(
        value: 0,
        child: Text("All"),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Text("Done"),
      ),
      PopupMenuItem<int>(
        value: 2,
        child: Text("Undone"),
      ),
    ];
    
  }, onSelected: (value) {
    if (value == 0) {
      print("All is selected.");
    } else if (value == 1) {
      print("Done is selected.");
    } else if (value == 2) {
      print("Undone is selected.");
    }
  },
);}