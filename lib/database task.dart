import 'package:sqflite/sqflite.dart';

import 'models/task model.dart';

Database? database;

Future<void> createDatabase() async {
  database = await openDatabase(
    "todo.db",
    version: 2,
    onCreate: (Database db, int version) async {
      print("Database created");
      await db.execute(
        'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,describtion TEXT)',
      );
      print("Table created");
    },
    onOpen: (Database db) {
      print("Database opened");
    },
  );
}


Future<void> insertDataBase({
  required String title,
  required String describtion,
}) async {
  if (database == null) {
    print("Database is not initialized yet!");
    return;
  }

  await database!.transaction((txn) async {
    await txn.rawInsert(
        "INSERT INTO tasks(title, describtion) VALUES(?, ?)", // استخدام ? بدلاً من القيم المباشرة
        [title, describtion] // تمرير القيم كمصفوفة لتجنب مشاكل الاقتباسات
    ).then((value) {
      print("$value row inserted successfully");
      getDataBase();
    }).catchError((error) {
      print("Error inserting data: $error");
    });
  });
}



Future<List<TaskModel>> getDataBase() async {
  List<Map<String, dynamic>> value = await database!.rawQuery('SELECT * FROM tasks');


  List<TaskModel> tasks = value.map((task) => TaskModel.fromMap(task)).toList();
  for (var task in tasks) {
    print("📌 Task: Title = ${task.title}, Description = ${task.describtion}");
  }


  return tasks;
}
deleteTask({required int id}) async {
   await database
      !.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
return getDataBase();

}
