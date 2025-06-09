import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBaseHelper {
  MyDataBaseHelper._privateConstrunctor();

  MyDataBaseHelper instance = MyDataBaseHelper._privateConstrunctor();

  Database? myDB;

  Future<Database?> getDB() async {
    if (myDB != null) {
      return myDB;
    } else {
      myDB = await openDB();
      return myDB;
    }
  }

  Future<Database>? openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appPath = join(appDir.path, "myDataBase.db");
    return openDatabase(
      appPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
                
                  CREATE TABLE "LOGIN TABLE"(TYPE)


             ''');
      },
    );
  }

  insert() async {}
}
