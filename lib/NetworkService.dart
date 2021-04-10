import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_mobx_dio_real/todo.dart';

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
}
