// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on _TodoList, Store {
  Computed<ObservableList<Todo>>? _$getAllTodosComputed;

  @override
  ObservableList<Todo> get getAllTodos => (_$getAllTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.getAllTodos,
              name: '_TodoList.getAllTodos'))
      .value;

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

  final _$todosAtom = Atom(name: '_TodoList.todos');

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$todoFutureAtom = Atom(name: '_TodoList.todoFuture');

  @override
  ObservableFuture<Todo>? get todoFuture {
    _$todoFutureAtom.reportRead();
    return super.todoFuture;
  }

  @override
  set todoFuture(ObservableFuture<Todo>? value) {
    _$todoFutureAtom.reportWrite(value, super.todoFuture, () {
      super.todoFuture = value;
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
  Future<dynamic> addTodo(String description) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteTodo(String id) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.deleteTodo');
    try {
      return super.deleteTodo(id);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToList(List<Todo> list) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.addToList');
    try {
      return super.addToList(list);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSingleToList(Todo todo) {
    final _$actionInfo = _$_TodoListActionController.startAction(
        name: '_TodoList.addSingleToList');
    try {
      return super.addSingleToList(todo);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateList() {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.updateList');
    try {
      return super.updateList();
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todosFuture: ${todosFuture},
todos: ${todos},
todoFuture: ${todoFuture},
getAllTodos: ${getAllTodos}
    ''';
  }
}
