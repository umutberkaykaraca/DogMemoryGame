import 'dart:io';

import 'package:memory_game/core/init/network/game_data_table_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "dogMemory.db";
    return openDatabase(
      path,
      onCreate: createTable,
      version: 1,
    );
  }

  void createTable(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE gameData(id INTEGER PRIMARY KEY AUTOINCREMENT, score INTEGER NOT NULL,move INTEGER NOT NULL, time TEXT NOT NULL, mode TEXT NOT NULL)",
    );
  }

  Future<int> insertGameData(GameData gameData) async {
    int result = 0;
    final Database db = await initializeDB();

    result = await db.insert('gameData', gameData.toMap());
    return result;
  }

  Future<List<GameData>> retrieveGameDatas() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('gameData');
    return queryResult.map((e) => GameData.fromMap(e)).toList();
  }
}
