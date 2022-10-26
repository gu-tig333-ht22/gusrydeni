import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/ToDoListState.dart';
import '../widgets/ToDoList.dart';

//hemskärm med ToDo lista

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      body: DisplayToDoList(),
      
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

  Widget _popupMenuButton() {
    return Consumer<ToDoListState>(
        builder: (context, state, child) => PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              Provider.of<ToDoListState>(context, listen: false)
                  .setFilter(value);
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("All"),
                  value: "All",
                ),
                PopupMenuItem(
                  child: Text("Done"),
                  value: "Done",
                ),
                PopupMenuItem(
                  child: Text("Undone"),
                  value: "Undone",
                ),
              ];
            }));
  }
}
