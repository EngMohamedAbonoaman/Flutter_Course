import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp2/state/add_task_cubit/task_states.dart';
import 'package:path/path.dart';

class TaskCubit extends Cubit<AllAddTaskStates> {
  TaskCubit() : super(AddTaskInitialState());
  List<Map<String, dynamic>> myList = [];
  late Database mydb;
  Future<List<Map<String, Object?>>> initializeDB() async {
    String DBpath = await getDatabasesPath();
    String path = join(DBpath, "todo.db");

    Database database = await openDatabase(path, version: 1,
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

  Future<List<Map<String, Object?>>> executeQuery(String tableName) async {
    List<Map<String, Object?>> myList = [];
    myList = await mydb.query(tableName);

    return myList;
  }

  Future<List<Map<String, Object?>>> insert(
      {required int id,
      required String title,
      required String description,
      required int status}) async {
    emit(AddTaskLoadingState());

    await Future.delayed(Duration(seconds: 2));
    await mydb.insert('tasks', {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    });
    myList = await executeQuery("tasks");
    emit(AddTaskSuccessState());
    print(myList.length);
    return myList;
  }

  delete({required int id}) async {
    emit(DeleteTaskLoadingState());
    try {
      await Future.delayed(Duration(seconds: 2));
      await mydb.delete(
        //delete from tasks where id  = 1
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
      myList = await executeQuery("tasks");
      emit(DeleteTaskSuccessState());
      print("task deleted successfully");
    } catch (e) {
      emit(DeleteTaskErrorState(e.toString()));
    }
  }
}
