import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoScreen extends StatelessWidget {
  TodoProvider todo = TodoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Open DB'),
              onPressed: () async {
                await todo.open('todo.db');
                print("open complete");
              },
            ),
            RaisedButton(
              child: Text('Insert'),
              onPressed: () async {
                Todo data = Todo();
                data.title = 'test';
                data.done = false;
                Todo result = await todo.insert(data);
                print(result.title);
              },
            ),
            RaisedButton(
              child: Text('Get'),
              onPressed: () async {
                Todo data = await todo.getTodo(2);
                print(data.toMap());
              },
            ),
            RaisedButton(
              child: Text('Update'),
              onPressed: () async {
                Todo newData = Todo();
                newData.id = 2;
                newData.title = 'New Tast';
                newData.done = true;

                int result = await todo.update(newData);
                print(result);
              },
            ),
            RaisedButton(
              child: Text('Delete'),
              onPressed: () async {
                int result = await todo.delete(2);
                print(result);
              },
            ),
            RaisedButton(
              child: Text('Close'),
              onPressed: () {
                todo.close();
                print('close DB');
              },
            )
          ],
        ),
      ),
    );
  }
}