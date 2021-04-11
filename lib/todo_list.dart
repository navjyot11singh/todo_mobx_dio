import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'NetworkService.dart';
import 'Response/todo.dart';

part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

@jsonSerializable
class TodoList extends _TodoList with _$TodoList {}

@jsonSerializable
abstract class _TodoList with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Todo>>? todosFuture;

  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  ObservableFuture<Todo>? todoFuture;

  @action
  Future fetchTodos() => todosFuture = ObservableFuture(httpClient
          .getData('https://tiny-list.herokuapp.com/api/v1/users/1/tasks')
          .then((todoList) {
        this.updateList();
        return todoList;
      }));

  void getTheTodos() {
    fetchTodos();
  }

  @action
  Future addTodo(String description) => todoFuture = ObservableFuture(
        httpClient
            .postData('https://tiny-list.herokuapp.com/api/v1/users/1/tasks',
                description)
            .then(
          (todo) {
            // this.addSingleToList(todo);
            this.updateList();
            return todo();
          },
        ),
      );

  @action
  Future deleteTodo(String id) => todoFuture = ObservableFuture(httpClient
          .deleteData(
              'https://tiny-list.herokuapp.com/api/v1/users/1/tasks/${id}')
          .then((todo) {
        this.updateList();
        return todo;
      }));

  void addTheTodos(String description) {
    addTodo(description);
  }

  // @JsonProperty(ignore: true)
  //

  @computed
  ObservableList<Todo> get getAllTodos {
    // print(todos);
    return todos;
  }

  @action
  void addToList(List<Todo> list) {
    print(list);
    for (int i = 0; i < list.length; i++) todos.add(list[i]);
  }

  @action
  void addSingleToList(Todo todo) {
    print(todo);
    todos.add(todo);
  }

  @action
  void updateList() {
    this.fetchTodos();
    final future = todosFuture;
    if (future!.status == FutureStatus.fulfilled) {
      todos = future.result;
    }
  }
}
