// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on _TodoList, Store {
  final _$todosFutureAtom = Atom(name: '_TodoList.todosFuture');

  @override
  ObservableFuture<List<Todo>>? get todosFuture {
    _$todosFutureAtom.reportRead();
    return super.todosFuture;
  }

  @override
  set todosFuture(ObservableFuture<List<Todo>>? value) {
    _$todosFutureAtom.reportWrite(value, super.todosFuture, () {
      super.todosFuture = value;
    });
  }

  final _$_TodoListActionController = ActionController(name: '_TodoList');

  @override
  Future<dynamic> fetchTodos() {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.fetchTodos');
    try {
      return super.fetchTodos();
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todosFuture: ${todosFuture}
    ''';
  }
}
