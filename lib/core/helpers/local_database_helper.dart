import 'package:islamic_app/features/sebha/data/models/sebha_item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database? _db;

  static const String databaseName = "yaquen.db";
  static const String tableName = "tsabeh";

  get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), databaseName);
      _db = await openDatabase(path,
          version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return _db;
    }
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $tableName (  
        title TEXT NOT NULL,
        count INTEGER NOT NULL
        )
''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('drop table $tableName');
    await _onCreate(db, newVersion);
  }

  addItemToSebhaList(String title) async {
    Database clint = await db;
    await clint.insert(tableName, {'title': title, 'count': 0});
    print("added successfully");
  }

  // addNewZekrString(SebhaItemModel item) async {
  //   Database clint = await db;
  //   await clint.insert(tableName, {
  //     'title': item.title,
  //     'count': item.count,
  //   });
  // }

  Future<List<SebhaItemModel>?> getAllSebhaList() async {
    Database clint = await db;
    List<Map> sebhaList =
        await clint.query(tableName, columns: ["title", 'count']);
    List<SebhaItemModel> allList = [];
    if (sebhaList.isNotEmpty) {
      for (int i = 0; i < sebhaList.length; i++) {
        SebhaItemModel s = SebhaItemModel(
          title: sebhaList[i]['title'],
          count: sebhaList[i]['count'],
        );
        allList.add(s);
      }
    }
    return allList;
  }

  updateCount(String title) async {
    final database = await db;
    await database.rawUpdate(
      'UPDATE $tableName SET count = count + 1 WHERE title = ?',
      [title],
    );
  }

Future<void> resetAllCounts() async {
  final database = await db;
  await database.rawUpdate(
    'UPDATE $tableName SET count = 0',
  );
}


  Future<int> deleteFromAzkarList(String title) async {
    Database clint = await db;
    Future<int> numOfRecord =
        clint.delete(tableName, where: "title=?", whereArgs: [title]);
    return numOfRecord;
  }
}
