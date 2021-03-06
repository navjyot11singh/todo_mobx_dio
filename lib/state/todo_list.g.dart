// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on _TodoList, Store {
  Computed<ObservableList<Todo>>? _$pendingTodosComputed;

  @override
  ObservableList<Todo> get pendingTodos => (_$pendingTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.pendingTodos,
              name: '_TodoList.pendingTodos'))
      .value;
  Computed<ObservableList<Todo>>? _$completedTodosComputed;

  @override
  ObservableList<Todo> get completedTodos => (_$completedTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.completedTodos,
              name: '_TodoList.completedTodos'))
      .value;
  Computed<bool>? _$hasCompeteTodosComputed;

  @override
  bool get hasCompeteTodos =>
      (_$hasCompeteTodosComputed ??= Computed<bool>(() => super.hasCompeteTodos,
              name: '_TodoList.hasCompeteTodos'))
          .value;
  Computed<bool>? _$hasPendingTodosComputed;

  @override
  bool get hasPendingTodos =>
      (_$hasPendingTodosComputed ??= Computed<bool>(() => super.hasPendingTodos,
              name: '_TodoList.hasPendingTodos'))
          .value;
  Computed<String>? _$itemsDescriptionComputed;

  @override
  String get itemsDescription => (_$itemsDescriptionComputed ??=
          Computed<String>(() => super.itemsDescription,
              name: '_TodoList.itemsDescription'))
      .value;
  Computed<ObservableList<Todo>>? _$visibleTodosComputed;

  @override
  ObservableList<Todo> get visibleTodos => (_$visibleTodosComputed ??=
          Computed<ObservableList<Todo>>(() => super.visibleTodos,
              name: '_TodoList.visibleTodos'))
      .value;
  Computed<bool>? _$canRemoveAllCompletedComputed;

  @override
  bool get canRemoveAllCompleted => (_$canRemoveAllCompletedComputed ??=
          Computed<bool>(() => super.canRemoveAllCompleted,
              name: '_TodoList.canRemoveAllCompleted'))
      .value;
  Computed<bool>? _$canMarkAllCompletedComputed;

  @override
  bool get canMarkAllCompleted => (_$canMarkAllCompletedComputed ??=
          Computed<bool>(() => super.canMarkAllCompleted,
              name: '_TodoList.canMarkAllCompleted'))
      .value;

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

  final _$filterAtom = Atom(name: '_TodoList.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$currentDescriptionAtom = Atom(name: '_TodoList.currentDescription');

  @override
  String get currentDescription {
    _$currentDescriptionAtom.reportRead();
    return super.currentDescription;
  }

  @override
  set currentDescription(String value) {
    _$currentDescriptionAtom.reportWrite(value, super.currentDescription, () {
      super.currentDescription = value;
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
  void addTodo(String description) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.addTodo');
    try {
      return super.addTodo(description);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> addTodoToNetwork(String description) {
    final _$actionInfo = _$_TodoListActionController.startAction(
        name: '_TodoList.addTodoToNetwork');
    try {
      return super.addTodoToNetwork(description);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(String id) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.removeTodo');
    try {
      return super.removeTodo(id);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> deleteTodoFromNetwork(String id) {
    final _$actionInfo = _$_TodoListActionController.startAction(
        name: '_TodoList.deleteTodoFromNetwork');
    try {
      return super.deleteTodoFromNetwork(id);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
currentDescription: ${currentDescription},
todoFuture: ${todoFuture},
todosFuture: ${todosFuture},
pendingTodos: ${pendingTodos},
completedTodos: ${completedTodos},
hasCompeteTodos: ${hasCompeteTodos},
hasPendingTodos: ${hasPendingTodos},
itemsDescription: ${itemsDescription},
visibleTodos: ${visibleTodos},
canRemoveAllCompleted: ${canRemoveAllCompleted},
canMarkAllCompleted: ${canMarkAllCompleted}
    ''';
  }
}
