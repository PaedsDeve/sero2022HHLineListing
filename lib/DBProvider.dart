import 'dart:io';
import 'package:sero2022hhlinelisting/LoginCtr.dart';
import 'package:sero2022hhlinelisting/Model/Users.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider _instance = new DBProvider.internal();

  factory DBProvider() => _instance;

  static Database? _database;

  //Future<Database> get database async => _database ??= await initDb();

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDb();
    return _database;
  }

  DBProvider.internal();

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "linelisting.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  Future _onCreate(Database db, int dbversion) async {
    await db.execute("CREATE TABLE IF NOT EXISTS users ("
        "id INTEGER PRIMARY KEY,"
        "userid TEXT,"
        "passwd TEXT,"
        "userstatus INTEGER,"
        "isadmin INTEGER"
        ");");

    db.execute(
        "insert into users (userid, passwd, userstatus) values('user1', 'user1', 1)");
  }
}
