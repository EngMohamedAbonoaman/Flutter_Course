import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBRepo {
  static late Database mydb;
  static List<Map<String, dynamic>> myList = [];
  static Future<List<Map<String, Object?>>> initializeDB() async {
    String DBpath = await getDatabasesPath();
    String path = join(DBpath, "todo.db");

    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
              create table tasks(
              id int primary key,
              title text,
              description text,
              status int
             )''');
      print("Table Created");
    }, onOpen: (Database db) async {
      mydb = db;

      myList = await executeQuery("tasks");
    });

    return myList;
  }

//select * from tasks
  static Future<List<Map<String, Object?>>> executeQuery(
      String tableName) async {
    List<Map<String, Object?>> myList = [];
    myList = await mydb.query(tableName);

    return myList;
  }

  static Future<List<Map<String, Object?>>> insert({
    required int id,
    required String title,
    required String description,
    required int status,
  }) async {
    List<Map<String, Object?>> myList = [];
    await Future.delayed(Duration(seconds: 2));
    await mydb.insert('tasks', {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    });
    myList = await executeQuery("tasks");
    print(myList.length);
    return myList;
  }

  static delete({required int id}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      await mydb.delete(
        //delete from tasks where id  = 1
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
      myList = await executeQuery("tasks");

      print("task deleted successfully");
    } catch (e) {}
  }

  static Future<void> update({
    required int id,
    required String title,
    required String description,
    required int status,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    mydb
        .update(
      'tasks',
      {
        'title': title,
        'description': description,
        'status': status,
      },
      where: 'id = ?',
      whereArgs: [id],
    )
        .then((value) {
      print("task updated successfully");
    });
  }
}
