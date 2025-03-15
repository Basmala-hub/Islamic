import 'package:sqflite/sqflite.dart';

Database? database;

createDataBase() async {
  database = await openDatabase("state.db", version: 1,
      onCreate: (db, version) {
        print("Database created");
        db.execute(
            "CREATE TABLE satuts (aya TEXT, ayaNumber INTEGER, sabhaNumber INTEGER)"
        ).then((value) {
          print("Table created");
        }).catchError((error) {
          print("Error creating table: ${error.toString()}");
        });
      },
      onOpen: (db) {
        print("Database opened");
        database = db;
      }
  );
}

insertDataBase({String? aya, int? ayaNumber, int? sabhaNumber}) async {
  if (database == null) {
    print("Database is not initialized!");
    return;
  }

  await database!.transaction((txn) async {
    try {
      int id = await txn.rawInsert(
        "INSERT INTO satuts (aya, ayaNumber, sabhaNumber) VALUES (?, ?, ?)",
        [aya ?? '', ayaNumber ?? 0, sabhaNumber ?? 0],
      );
      print("Inserted successfully, ID: $id");

      // بعد كل إدخال، نعرض البيانات المخزنة لتأكيد أن كل شيء يعمل تمام
      getDataBase().then((data) {
        print("Updated Data: $data");
      });

    } catch (error) {
      print("Error inserting data: ${error.toString()}");
    }
  });
}


Future<List<Map<String, dynamic>>> getDataBase() async {
  if (database == null) {
    print("Database is not initialized!");
    return [];
  }

  try {
    List<Map<String, dynamic>> result = await database!.rawQuery("SELECT * FROM satuts");
    print("Data fetched successfully: $result");
    return result;
  } catch (error) {
    print("Error fetching data: ${error.toString()}");
    return [];
  }
}
