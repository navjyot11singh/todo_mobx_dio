import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_mobx_dio_real/Response/todo.dart';

/* this class contains all the methods for network calling
*/

class NetworkService {
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

  Future updateData(String url, String description) async {
    print("called updateDataNetwork");
    var dio = Dio();

    final response = await dio.put(url, data: {
      'task': {'description': description}
    });
    if (response.statusCode == 200) {
      Todo todo = Todo.fromJson(response.data);
      return todo;
    } else {
      print("Error in URL");
    }
  }

  Future deleteData(String url) async {
    var dio = Dio();

    final response = await dio.delete(url);
    if (response.statusCode == 204) {
      return "deleted";
    } else {
      print("Error in URL");
    }
  }

  Future completeData(String url) async {
    var dio = Dio();

    final response = await dio.put(url);
    if (response.statusCode == 200) {
      Todo todo = Todo.fromJson(response.data);
      return todo;
    } else {
      print("Error in URL");
    }
  }

  Future uncompleteData(String url) async {
    var dio = Dio();

    final response = await dio.put(url);
    if (response.statusCode == 200) {
      Todo todo = Todo.fromJson(response.data);
      return todo;
    } else {
      print("Error in URL");
    }
  }
}
