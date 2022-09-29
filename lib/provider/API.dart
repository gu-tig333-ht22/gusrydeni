import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:template/models/ToDo.dart';

String apiKey = "9f3bee59-1bdc-4f76-a96d-52b9046a194d";

class API {
  static Future<List> fetchlist() async {
    http.Response response = await http.get(Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos?key=[$apiKey]"));
    return jsonDecode(response.body);
  }

  static postToDo(newtext) async {
    http.Response response = await http.post(
      Uri.parse("https://todoapp-api.apps.k8s.gu.se/todos?key=$apiKey"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, dynamic>{
        "title": newtext,
        "done": false,
      }),
    );
    return jsonDecode(response.body);
  }

  static Future<List> putToDo(ToDo todo) async {
    http.Response response = await http.put(
      Uri.parse(
          "https://todoapp-api.apps.k8s.gu.se/todos/${todo.id}?key=$apiKey"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, dynamic>{
        "title": todo.text,
        "done": todo.checked,
      }),
    );
    return jsonDecode(response.body);
  }

  static Future<List> deleteToDo(ToDo todo) async {
    http.Response response = await http.delete(Uri.parse(
        "https://todoapp-api.apps.k8s.gu.se/todos/${todo.id}?key=$apiKey"));
    return jsonDecode(response.body);
  }
}
