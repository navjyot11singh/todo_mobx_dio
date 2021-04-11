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
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  @JsonProperty(defaultValue: VisibilityFilter.values)
  VisibilityFilter filter = VisibilityFilter.all;

  @observable
  String currentDescription = '';

  @observable
  ObservableFuture<Todo>? todoFuture;

  @observable
  ObservableFuture<List<Todo>>? todosFuture;

  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((todo) => todo.completedAt == null));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((todo) => todo.completedAt != null));

  @computed
  bool get hasCompeteTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  String get itemsDescription {
    if (todos.isEmpty) {
      return "There are no todos here why dont you add one";
    }

    final suffix = pendingTodos.length == 1 ? 'todos' : 'todos';
    return '${pendingTodos.length} pending $suffix, ${completedTodos.length} completed';
  }

  @computed
  @JsonProperty(ignore: true)
  ObservableList<Todo> get visibleTodos {
    // this.fetchTodos();
    // if (todosFuture!.status == FutureStatus.fulfilled) {
    //   todos = todosFuture!.result;
    // }
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  @action
  Future fetchTodos() => todosFuture = ObservableFuture(httpClient
          .getData('https://tiny-list.herokuapp.com/api/v1/users/1/tasks')
          .then((todoList) {
        todos.addAll(todoList);
        return todoList;
      }));

  @computed
  bool get canRemoveAllCompleted =>
      hasCompeteTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @action
  void addTodo(String description) {
    addTodoToNetwork(description);
    // if (todoFuture!.status == FutureStatus.fulfilled) {
    //   todos.add(todoFuture!.result);
    //   print(todos);
    // }
    currentDescription = '';
  }

  @action
  Future addTodoToNetwork(String description) => todoFuture = ObservableFuture(
        httpClient
            .postData('https://tiny-list.herokuapp.com/api/v1/users/1/tasks',
                description)
            .then(
          (todo) {
            // this.addSingleToList(todo);
            print(todo);
            todos.add(todo);
            return todo();
          },
        ),
      );

  @action
  void removeTodo(String id) {
    this.deleteTodoFromNetwork(id);
  }

  @action
  Future deleteTodoFromNetwork(String id) =>
      todoFuture = ObservableFuture(httpClient
          .deleteData(
              'https://tiny-list.herokuapp.com/api/v1/users/1/tasks/${id}')
          .then((todo) {
        print(todo);
        if (todo == "deleted") {
          todos.removeWhere((element) => element.id == id);
        }
        return todo;
      }));

  // @action
  // void removeCompleted() {
  //   todos.removeWhere((todo) => todo.done);
  // }

  // @action
  // void markAllAsCompleted() {
  //   for (final todo in todos) {
  //     todo.done = true;
  //   }
  // }
}
