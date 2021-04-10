import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx_api_handling/user.dart';
import 'package:todo_mobx_dio_real/todo.dart';

import 'post.dart';

class NetworkService {
  // ignore: deprecated_member_use
  List<Todo> todos = [];

  Future getData(String url) async {
    var dio = Dio();

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      todos = (jsonDecode(response.data) as List)
          .map((i) => Todo.fromJson(i))
          .toList();

      return todos;
    } else {
      print("Error in URL");
    }
  }
}
