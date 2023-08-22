import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
class SQL_Helper {
  static SQL_Helper? dbHelper;
  static Database? _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    dbHelper ??= SQL_Helper._createInstance();
    return dbHelper as SQL_Helper;
  }

  Future<Database> get database async {
    _database ??= await initializedDatabase();
    return _database as Database;
  }


  Future<Database> initializedDatabase() async {
    int dbver =1;
    final dbFolder = await getExternalStorageDirectory();
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create();
    final file = File(p.join(dbFolderDir.path, 'doctor.db'));
    var schoolDB = await openDatabase(
        file.path,
        version: dbver,
        onCreate: createDatabase,
        onUpgrade: upgradeDatabase,
        onDowngrade: downgradeDatabase
      //onDowngrade: ()
    );
    return schoolDB;
  }


  List<Map<String, dynamic>> tablesNameList = [
    {'name': 'Doctor' ,
      'sql': 'CREATE TABLE Doctor(Id INTEGER PRIMARY KEY, Name TEXT, Img TEXT, DeptId INTEGER)'
    },

    {'name': 'Drugs' ,
      'sql': 'CREATE TABLE Drugs(Id INTEGER PRIMARY KEY, Name TEXT,className TEXT, Price INTEGER)'
    },

    {'name': 'Depts' ,
      'sql': 'CREATE TABLE Depts(Id INTEGER PRIMARY KEY, Name TEXT)'
    }
  ];

  void createDatabase(Database db, int version) async {
    try {
      for (int i = 0; i < tablesNameList.length; i++) {
        await db.execute(tablesNameList[i]["sql"]);
      }
    }
    catch(e){
      print("CreateExp:- "+ e.toString());
    }
  }
  void upgradeDatabase(Database db, oldVersion, newVersion) async {
    if (oldVersion < newVersion) {
      // await db.execute(sql)
    }
  }
  void downgradeDatabase(db, oldVersion, newVersion) async {
    if (oldVersion >= newVersion) {
      try {
      }
      catch (e) {
        print("CreateExp:- " + e.toString());
      }
    }
  }

  Future<int> getCount(String tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> all = await db.rawQuery("SELECT COUNT (*) FROM $tableName");
    int result = Sqflite.firstIntValue(all)!;
    return result;
  }


  Future<dynamic> getById(String tableName, int id) async{
    Database db = await database;
    var result= await db.query(tableName,where: "Id=?", whereArgs: [id]);
    if(result==null) {
      return "null";
    } else{

      return result.first;
    }

  }
  Future<dynamic> getCacheByUrl(String url) async{
    Database db = await database;
    var result= await db.query("CacheData",where: "url=?", whereArgs: [url]);
    print("result in DB : "+ result.toString());
    if(result.isEmpty) {
      return "null";
    } else{

      return result.first;
    }

  }
  Future<dynamic> getAll(String tableName) async{
    Database db = await database;
    var result= await db.query(tableName);
    if(result==null) {
      return "null";
    } else{
      return result;
    }

  }
  Future<dynamic> add(String tableName, Map<String, dynamic> data)async{
    Database db = await database;
    int result= await db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<dynamic> update(String tableName, Map<String, dynamic> data)async{
    Database db = await database;
    int result= await db.update(tableName, data, conflictAlgorithm: ConflictAlgorithm.fail);
    return result;
  }

  Future<dynamic> delete(String tableName, int id)async{
    Database db = await database;
    int result= await db.delete(tableName,where: "Id=?", whereArgs: [id]);
    return result;
  }
  Future<dynamic> deleteAll(String tableName)async{
    Database db = await database;
    int result= await db.delete(tableName);
    return result;
  }

}