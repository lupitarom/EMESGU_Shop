import 'package:enseguida_shop/data/models/ropadb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String tableFav = 'Favorited';
const String columnId = 'id';
const String columnModel = 'model';
const String columnOldPrice = 'oldPrice';
const String columnCurrentPrice = 'currentPrice';
const String columnImages = 'images';
const String columnColor = 'color';
const String columnFav = 'isFavorite';

class FavoHelper {
  static Database? _database;
  static FavoHelper? _favHelper;

  FavoHelper._createInstance();
  factory FavoHelper() {
    // ignore: prefer_conditional_assignment
    if (_favHelper == null) {
      _favHelper = FavoHelper._createInstance();
    }
    return _favHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "fav.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("create table $tableFav ("
            "$columnId integer primary key autoincrement,"
            "$columnModel text not null,"
            "$columnOldPrice  double,"
            "$columnCurrentPrice double,"
            "$columnImages text not null,"
            "$columnColor integer,"
            "$columnFav integer"
            ")");
      },
    );
    return database;
  }

  void insertRopa(Ropaas ropasInfo) async {
    var db = await database;
    var result = await db.insert(tableFav, ropasInfo.toMap());
    print('result : $result');
  }

  Future<List<Ropaas>> getRopa() async {
    List<Ropaas> _ropaFav = [];

    var db = await database;
    var result = await db.query(tableFav);
    result.forEach((element) {
      var ropaInfo = Ropaas.fromMap(element);
      _ropaFav.add(ropaInfo);
    });

    return _ropaFav;
  }

  Future<int> delete(int id) async {
    var db = await database;
    return await db.delete(tableFav, where: '$columnId = ?', whereArgs: [id]);
  }
}
