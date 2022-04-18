import 'package:parking_flutter_raro/model/car_model.dart';
import 'package:parking_flutter_raro/model/park_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteCarRepository {
  static const String tableName = 'car';

  SqfliteCarRepository();

  // Get a location using getDatabasesPath
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'parkingCar.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $tableName (plate TEXT PRIMARY KEY, ownerName TEXT, phoneNumber TEXT, entryDate TEXT, departureDate TEXT, sectorName TEXT, vacancy INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertCar(CarModel car) async {
    var db = await _getDatabase();
    var teste = car.toMap();
    await db.insert(
      tableName,
      teste,
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
    await db.close();
  }

  Future<void> updateCar(CarModel car) async {
    var db = await _getDatabase();
    await db.update(
      tableName,
      car.toMap(),
      where: "plate = ?",
      whereArgs: [car.plate],
    );
    await db.close();
  }

  Future<List<CarModel>> getAllCars() async {
    var db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    await db.close();
    return List.generate(maps.length, (i) {
      return CarModel(
        plate: maps[i]['plate'],
        ownerName: maps[i]['ownerName'],
        phoneNumber: maps[i]['phoneNumber'],
        entryDate: DateTime.parse(maps[i]['entryDate']),
        departureDate: maps[i]['departureDate'] != null
            ? DateTime.parse(maps[i]['departureDate'])
            : null,
        park: ParkModel(
          sectorName: maps[i]['sectorName'],
          vacancy: maps[i]['vacancy'],
        ),
      );
    });
  }
}
