import 'package:flutter/material.dart';
import 'package:template/screens/NewToDoView.dart';
import 'package:template/screens/HomePage.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

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
                elevation: 15,
                titleTextStyle: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 26,
                ),
              ),
            ),
          );
  }
}
