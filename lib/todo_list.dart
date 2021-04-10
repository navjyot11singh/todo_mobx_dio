import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'NetworkService.dart';
import 'todo.dart';

part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

@jsonSerializable
class TodoList extends _TodoList with _$TodoList {}

@jsonSerializable
abstract class _TodoList with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Todo>>? todosFuture;

  @action
  Future fetchTodos() => todosFuture = ObservableFuture(httpClient
      .getData('https://tiny-list.herokuapp.com/api/v1/users/1/tasks')
      .then((todos) => todos));

  void getTheTodos() {
    fetchTodos();
  }
}
