import 'package:coffee_house/data/bd_helper.dart';
import 'package:coffee_house/domain/cafes.dart';
import 'package:sqflite/sqflite.dart';

class CafeDao{
  Future<List<Cafes>> listarCafes() async{
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM package;';
    var result = await db.rawQuery(sql);

    List<Cafes> lista = <Cafes>[];
    for(var json in result){
      Cafes cafe = Cafes.fromJson(json);
      lista.add(cafe);
    }

    return lista;
  }
}