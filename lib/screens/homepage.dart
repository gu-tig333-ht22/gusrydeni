import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Att göra",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 178, 160, 100),
        actions: [
          Icon(Icons.more_vert),
        ],
        elevation: 15,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Hej"),
          ],
        ),
      ),
    );
  }
}

Widget newtodobutton() {
  return Container(
    child: Center(
      child: IconButton(
        icon: const Icon(Icons.create),
        tooltip: "Skapa ny att göra",
        onPressed: () {},
      ),
    ),
  );
}
