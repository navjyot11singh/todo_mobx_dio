import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/todo.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
                // AddTodo(),
                // ActionBar(),
                // Description(),
                TodoListView(),
              ],
            ),
          ),
        ),
      );
}

// class AddTodo extends StatelessWidget {
//   final _textController = TextEditingController(text: '');

//   @override
//   Widget build(BuildContext context) {
//     final list = Provider.of<TodoList>(context);

//     return TextField(
//       autofocus: true,
//       decoration: InputDecoration(
//           labelText: 'Add a Todo', contentPadding: EdgeInsets.all(8)),
//       controller: _textController,
//       onChanged: (String newValue) {
//         list.currentDescription = newValue;
//       },
//       onSubmitted: (String value) {
//         list.addTodo(value);
//         _textController.clear();
//       },
//     );
//   }
// }

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

class TodoListView extends StatelessWidget {
  TodoList todoList = TodoList();

  TodoListView() {
    todoList.getTheTodos();
  }
  @override
  Widget build(BuildContext context) {
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
                    onPressed: _refresh,
                  )
                ],
              ),
            );
          case FutureStatus.fulfilled:
            final List<Todo> posts = future.result;
            print(posts);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return ExpansionTile(
                      title: Text(
                        post.description!,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => todoList.fetchTodos();
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