import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/State/todo_list.dart';

class TodoListView extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    list.fetchTodos();

    return Observer(
      builder: (_) => Flexible(
        child: ListView.builder(
          itemCount: list.visibleTodos.length,
          itemBuilder: (_, index) {
            final todo = list.visibleTodos[index];
            return Observer(
              builder: (_) => CheckboxListTile(
                value: todo.completedAt != null,
                onChanged: (flag) {
                  //networkcall for updateing
                  if (todo.completedAt == null) {
                    list.markCompleteTodos(todo.id.toString());
                  } else {
                    list.unmarkCompleteTodos(todo.id.toString());
                  }
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        todo.description!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //remove todo
                        list.removeTodo(todo.id.toString());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey[500],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //remove todo
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Update the task'),
                              content: TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                    hintText: "Update ${todo.description}"),
                              ),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text('Done'),
                                  onPressed: () {
                                    list.updateTodo(todo.id.toString(),
                                        _textController.text);

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
