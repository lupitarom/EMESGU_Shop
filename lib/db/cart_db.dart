import 'package:enseguida_shop/data/models/ropadb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String tableCart = 'Favorited';
const String columnId = 'id';
const String columnModel = 'model';
const String columnOldPrice = 'oldPrice';
const String columnCurrentPrice = 'currentPrice';
const String columnImages = 'images';
const String columnColor = 'color';
const String columnFav = 'isFavorite';

class CartHelper {
  static Database? _database;
  static CartHelper? _cartHelper;

  CartHelper._createInstance();
  factory CartHelper() {
    // ignore: prefer_conditional_assignment
    if (_cartHelper == null) {
      _cartHelper = CartHelper._createInstance();
    }
    return _cartHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "cart.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("create table $tableCart ("
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

  void insertCompra(Ropaas ropasInfo) async {
    var db = await database;
    var result = await db.insert(tableCart, ropasInfo.toMap());
    print('result : $result');
  }

  Future<List<Ropaas>> getRopa() async {
    List<Ropaas> _ropasCargadas = [];

    var db = await database;
    var result = await db.query(tableCart);
    result.forEach((element) {
      var ropaInfo = Ropaas.fromMap(element);
      _ropasCargadas.add(ropaInfo);
    });

    return _ropasCargadas;
  }

  Future<int> delete(int id) async {
    var db = await database;
    return await db.delete(tableCart, where: '$columnId = ?', whereArgs: [id]);
  }
}
