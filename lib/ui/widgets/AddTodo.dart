import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/State/todo_list.dart';

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            labelText: 'Add a Todo', contentPadding: EdgeInsets.all(8)),
        controller: _textController,
        onChanged: (String newValue) {
          list.currentDescription = newValue;
        },
        onSubmitted: (String value) {
          list.addTodo(value);
          _textController.clear();
        },
      ),
    );
  }
}
