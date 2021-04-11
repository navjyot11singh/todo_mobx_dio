import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_mobx_dio_real/Response/todo.dart';

class NetworkService {
  // ignore: deprecated_member_use
  List<Todo> todos = [];

  Future getData(String url) async {
    var dio = Dio();

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      Todos todoList = Todos.fromJson(response.data);

      return todoList.todos;
    } else {
      print("Error in URL");
    }
  }

  Future postData(String url, String description) async {
    var dio = Dio();

    final response = await dio.post(url, data: {
      'task': {'description': description}
    });
    if (response.statusCode == 201) {
      Todo todo = Todo.fromJson(response.data);

      return todo;
    } else {
      print("Error in URL");
    }
  }

  Future deleteData(String url) async {
    var dio = Dio();

    final response = await dio.delete(url);
    if (response.statusCode == 201) {
      Todo todo = Todo.fromJson(response.data);
      return todo;
    } else {
      print("Error in URL");
    }
  }
}
