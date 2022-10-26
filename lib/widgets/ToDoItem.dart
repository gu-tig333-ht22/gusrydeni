import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/Model/ToDoListState.dart';
import '../Model/ToDo.dart';

//Widgeten för hur en ToDo ska se ut i UI

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  ToDoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      shape: BeveledRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
      ),
      leading: Checkbox(
          value: todo.checked,
          onChanged: (bool? checked) {
            Provider.of<ToDoListState>(context, listen: false)
                .updateToDo(todo);
          },
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Color.fromARGB(255, 0, 0, 0).withOpacity(.32);
            }
            return Color.fromARGB(255, 0, 0, 0);
          })),
      title: todo.checked == false
          ? Text(todo.text)
          : Text(
              todo.text,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
      trailing: IconButton(
        icon: Icon(Icons.delete_rounded),
        onPressed: () {
          Provider.of<ToDoListState>(context, listen: false).removeToDo(todo);
        },
      ),
    );
  }
}
