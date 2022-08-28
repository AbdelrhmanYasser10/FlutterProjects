import 'package:sqflite/sqflite.dart';

import '../../models/task_model/task_model.dart';

class DBHelper{
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';


  static Future<void> initDatabase() async{
    if(_db != null){
      return;
    }
    else {
      String path = '${await getDatabasesPath()}tasks.db';
      try {
        _db = await openDatabase(
            path,
            version: _version,
            onCreate: (db, version) {
              return db.execute(
                  "CREATE TABLE $_tableName("
                      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                      "title STRING , note TEXT , date STRING,"
                      "startTime STRING , endTime STRING,"
                      "remind INTEGER , repeat STRING,"
                      "color INTEGER, isCompleted INTEGER"
                      ")"
              );
            }
        );
      }
      catch(error){
        print(error);
      }
    }
  }
  static Future<int> insert ({required Task task})async{
    return await _db!.insert(_tableName, task.toJson());
  }
  static Future<List<Map<String,dynamic>>> query() async{
    return await _db!.query(_tableName);
  }
  static Future<int> delete({required int id}) async{
    return await _db!.delete(_tableName , where: "id = ?" ,whereArgs: [id]);
  }

  static Future<int> update({required int id})async{
    return await _db!.rawUpdate('''
    UPDATE $_tableName SET isCompleted = ?
    WHERE id = ?
    ''',[1,id]);
  }
}