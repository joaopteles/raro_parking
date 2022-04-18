import 'package:parking_flutter_raro/model/sector_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteParkRepository {
  static const String tableName = 'park';
  SqfliteParkRepository();
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'parking.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName (nomeSetor TEXT PRIMARY KEY, vagas INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertPark(SectorModel park) async {
    var db = await _getDatabase();
    await db.insert(
      tableName,
      park.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );

    await _closeDb(db);
  }

  Future<void> deletePark(SectorModel park) async {
    var db = await _getDatabase();
    await db.delete(
      tableName,
      where: "nomeSetor = ?",
      whereArgs: [park.nameSetor],
    );
    await _closeDb(db);
  }

  Future<List<SectorModel>> getAllParks() async {
    var db = await _getDatabase();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    await _closeDb(db);
    return List.generate(maps.length, (i) {
      return SectorModel(
        nome: maps[i]['nomeSetor'],
        vagasSetor: maps[i]['vagas'],
      );
    });
  }

  Future<void> _closeDb(Database db) async {
    await db.close();
  }
}
