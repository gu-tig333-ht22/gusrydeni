import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/screens/HomePage/Views/DoneToDos.dart';
import 'package:template/screens/HomePage/Views/UndoneToDos.dart';
import 'Views/AllTodos.dart';

//hemskärm med ToDo lista

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

dynamic selectedItem = AllToDos();

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
      body: selectedItem,
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
      switch (value) {
        case 0:
          {
            setState(() {
              selectedItem = AllToDos();
              print("${selectedItem} chosen");
            });
          }
          break;

        case 1:
          {
            setState(() {
              selectedItem = DoneToDos();
              print("${selectedItem} chosen");
            });
          }

          break;

        case 2:
          {
            setState(() {
              selectedItem = UndoneToDos();
              print("${selectedItem} chosen");
            });
          }
          break;
      }
    });
  }
}
