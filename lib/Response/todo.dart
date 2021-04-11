import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:mobx/mobx.dart';

class Todo {
  int? id;
  int? userId;
  String? description;
  String? completedAt;
  String? createdAt;
  String? updatedAt;

  Todo(
      {this.id,
      this.userId,
      this.description,
      this.completedAt,
      this.createdAt,
      this.updatedAt});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return new Todo(
      id: json['id'],
      userId: json['user_id'],
      description: json['description'],
      completedAt: json['completed_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Todos {
  final List<Todo>? todos;
  Todos({
    this.todos,
  });

  factory Todos.fromJson(List<dynamic> parsedJson) {
    List<Todo> todos = [];
    todos = parsedJson.map((e) => Todo.fromJson(e)).toList();
    return new Todos(todos: todos);
  }
}
