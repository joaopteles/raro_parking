import 'package:get/get.dart';
import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/repository/sqflte_car.dart';
import 'package:parking_flutter_raro/repository/sqflte_park.dart';

enum environment {
  development,
  production,
  test,
}

void initInjector() {
  // bool teste = env == environment.test;
  Get
    ..put(CarSpotController())
    ..put(ParkController())
    // ..put(teste ? SqfliteParkRepository() : SqfliteParkRepository())
    ..put(SqfliteParkRepository())
    // ..put(teste ? SqfliteCarRepository() : SqfliteCarRepository());
    ..put(SqfliteCarRepository());
}
