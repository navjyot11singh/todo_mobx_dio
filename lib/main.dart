import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/Response/todo.dart';
import 'package:todo_mobx_dio_real/todo_list.dart';
import 'package:mobx/mobx.dart';

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
        primarySwatch: Colors.blue,
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
            body: Column(
              children: [
                AddTodo(),
                // ActionBar(),
                // Description(),
                TodoListView(),
              ],
            ),
          ),
        ),
      );
}

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    TodoList todoList = TodoList();

    final list = Provider.of<TodoList>(context);

    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: 'Add a Todo', contentPadding: EdgeInsets.all(8)),
      controller: _textController,
      // onChanged: (String newValue) {
      //   list.currentDescription = newValue;
      // },z
      onSubmitted: (String value) {
        todoList.addTheTodos(value);
        _textController.clear();

        final future = todoList.todoFuture;

        switch (future!.status) {
          case FutureStatus.pending:
            // TODO: Handle this case.
            break;
          case FutureStatus.rejected:
            // TODO: Handle this case.
            break;
          case FutureStatus.fulfilled:
            list.updateList();
            list.addSingleToList(future.result);
            break;
        }
      },
    );
  }
}

class TodoListView extends StatelessWidget {
  TodoList todoList = TodoList();

  TodoListView() {
    todoList.getTheTodos();
  }
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    var padding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;

    double newheight = height - padding.top - padding.bottom;

    final future = todoList.todosFuture;

    return Observer(
      builder: (_) {
        switch (future!.status) {
          case FutureStatus.pending:
            return Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: const Text('Tap to retry'),
                    onPressed: () {},
                  )
                ],
              ),
            );
          case FutureStatus.fulfilled:
            list.addToList(future.result);

            return Flexible(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: list.getAllTodos.length,
                  itemBuilder: (_, index) {
                    final todo = list.getAllTodos[index];
                    return CheckboxListTile(
                      value: todo.completedAt != null,
                      onChanged: (flag) {
                        //implement this
                        flag = flag!;
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
                                //implement this
                                list.deleteTodo(todo.id.toString());
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
  // case: FutureStatus.rejected:
  // return Center(
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text(
  //         'Failed to load items.',
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       RaisedButton(
  //         child: const Text('Tap to retry'),
  //         onPressed: _refresh,
  //       )
  //     ],
  //   ),
  // );

  // case FutureStatus.fulfilled:
  // final List<Todo> todos=future.result;
  // return RefreshIndicator(
  //   onRefresh: _refresh,
  //   child:
  // )
  // default:
  //
  //
  //
  //
  // class ActionBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final list = Provider.of<TodoList>(context);

//     return Observer(
//       builder: (_) {
//         final selections = VisibilityFilter.values
//             .map((f) => f == list.filter)
//             .toList(growable: false);
//         return Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: ToggleButtons(
//                 borderRadius: BorderRadius.circular(8),
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 5, right: 5),
//                     child: Text('All'),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 5, right: 5),
//                     child: Text('Pending'),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 5, right: 5),
//                     child: Text('Completed'),
//                   ),
//                 ],
//                 onPressed: (index) {
//                   list.filter = VisibilityFilter.values[index];
//                 },
//                 isSelected: selections,
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }

// class Description extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final list = Provider.of<TodoList>(context);

//     return Observer(
//       builder: (_) => Padding(
//         padding: EdgeInsets.all(8),
//         child: Text(
//           list.itemsDescription,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
