import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx_dio_real/State/todo_list.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) {
        final selections = VisibilityFilter.values
            .map((f) => f == list.filter)
            .toList(growable: false);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8),
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Icon(
                          Icons.whatshot,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        new SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'All',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Icon(Icons.pending, size: 16.0, color: Colors.blue),
                        new SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'Pending',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Icon(
                          Icons.done_all,
                          size: 16.0,
                          color: Colors.deepOrange,
                        ),
                        new SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'Completed',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ],
                    ),
                  ),
                ],
                onPressed: (index) {
                  list.filter = VisibilityFilter.values[index];
                },
                isSelected: selections,
              ),
            )
          ],
        );
      },
    );
  }
}
