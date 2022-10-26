import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/Model/ToDoListState.dart';
import 'package:template/screens/NewToDoView.dart';
import 'package:template/screens/HomePage.dart';


void main() {
  var state = ToDoListState();
  state.fetchToDos();

  runApp(ChangeNotifierProvider(
      create: (context) => ToDoListState(),
      child: ToDoApp()
  ));
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ToDo App",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => HomePage(),
          "/NewToDoView": (context) => NewToDoView(),
        },
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
                iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0),),
                actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0),),
                elevation: 0,
                shape: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                    ),
                ),

                titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 26,
                ),

              ),
            ),
     );
  }
}
