import 'dart:io';

import 'package:app_sqlite/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //Sigleton
  static final DBProvider db = DBProvider._();
  DBProvider._();

  static late Database _databaseTemporal;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database ?? _databaseTemporal;
    _database = await initDB();
    return _database ?? _databaseTemporal;
  }

  //Crear BD
  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    //La BD
    final path = join(documentDirectory.path, "UserDB.db");
    print("Path: $path");
    return openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE User(
            id INTEGER PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            avatar TEXT
          )
        ''');
      },
    );
  }

  //CRUD

  //INSERT
  Future<int> insertUser({
    required UserModel user,
  }) async {
    //verificar la DB
    final db = await database;
    final reponse = await db.insert("User", user.toJson());
    //db.close();
    return reponse;
  }

  //DELETE
  Future<int> deteleUser({
    required int idUser,
  }) async {
    //verificar la DB
    final db = await database;
    final reponse = await db.delete(
      "User",
      where: "id = ?",
      whereArgs: [idUser],
    );
    return reponse;
  }

  //LIST
  Future<List<UserModel>> getAllUsers() async {
    //verificar la DB
    final db = await database;
    final reponse = await db.query("User");
    return reponse.isNotEmpty
        ? reponse.map((json) => UserModel.fromJson(json)).toList()
        : [];
  }
}
