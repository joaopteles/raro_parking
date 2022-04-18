import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/repository/sqflte_park.dart';
import 'package:parking_flutter_raro/repository/sqflte_car.dart';
import 'package:get/get.dart';

enum environment {
  development,
  production,
  test,
}

void initInjector() {
  Get
    ..put(CarSpotController())
    ..put(ParkController())
    ..put(SqfliteParkRepository())
    ..put(SqfliteCarRepository());
}
