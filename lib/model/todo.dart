import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnID = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

class Todo {
  int id;
  String title;
  bool done;

  Todo();

  Todo.formMap(Map<String, dynamic> map) {
    this.id = map[columnID];
    this.title = map[columnTitle];
    this.done = map[columnDone] == 1;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };

    if (id != null) {
      map[columnID] = id;
    }
    return map;
  }
}

class TodoProvider {
  Database db;

  Future open(String path) async {
    print("on open function");
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableTodo (
            $columnID integer primary key autoincrement,
            $columnTitle text not null,
            $columnDone integer not null
          )
        ''');
    });
  }

  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(
      tableTodo,
      columns: [columnID, columnDone, columnTitle],
      where: '$columnID = ?',
      whereArgs: [id]
    );
    if (maps.length > 0){
      return new Todo.formMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async{
    return await db.delete(tableTodo, where: '$columnID = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async{
    return await db.update(tableTodo, todo.toMap(),
    where: '$columnID = ?', whereArgs: [todo.id]
    );
  }

  Future close() async => db.close();
}