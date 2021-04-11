import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/State/todo_list.dart';
import 'package:mobx/mobx.dart';

import 'widgets/ActionBar.dart';
import 'widgets/AddTodo.dart';
import 'widgets/Description.dart';
import 'widgets/TodoListView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<TodoList>(
        create: (_) => TodoList(),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Navjyot Singh",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                ActionBar(),
                AddTodo(),
                Description(),
                TodoListView(),
              ],
            ),
          ),
        ),
      );
}
