import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBHelper {
  initDB() async{
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, 'pacotes.db');
    var db = await openDatabase(databaseName,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    
    print(databaseName);
    return db;
  }

  onCreate(Database db, int version) async{
    String sql = 'CREATE TABLE package (id INTEGER PRIMARY KEY, cafe_image varchar(100), title varchar(100), price double);';
    await db.execute(sql);

    sql = "INSERT INTO package (id, cafe_image, title, price) VALUES (1, 'https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-3235-18a45e40b548a7ecbb5448c6c891a55f.jpg', 'Cappucino', '10');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, cafe_image, title, price) VALUES (2, 'https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Macchiato.jpg', 'Cappucino', '10');";
    await db.execute(sql);

    sql =
    "INSERT INTO package (id, cafe_image, title, price) VALUES (3, 'https://1.bp.blogspot.com/-sSKibBwIWnQ/X95hxqpp32I/AAAAAAAAAV0/CnNPT19fmaUkOkdsyJwPyWOjxIzzguKygCLcBGAsYHQ/s650/xicara%2Bde%2Bcaf%25C3%25A9%2Bexpresso.png', 'Cappucino', '10');";
    await db.execute(sql);
  }

  Future<FutureOr<void>> onUpgrade(Database db, int oldVersion, int newVersion) async{
    if(oldVersion == 1 && newVersion == 2){
      String sql = "CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))";
      await db.execute(sql);

      sql = "INSERT INTO user (username, password) VALUES ('guilherme@gmail.com', '12345678')";
      await db.execute(sql);
    }
  }
}