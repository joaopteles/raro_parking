import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/repository/mock/sql_car_repository_mock.dart';
import 'package:parking_flutter_raro/repository/mock/sql_park_repository_mock.dart';
import 'package:parking_flutter_raro/repository/sqflte_park.dart';
import 'package:parking_flutter_raro/repository/sqflte_car.dart';
import 'package:get/get.dart';

enum environment {
  development,
  production,
  test,
}

void initInjector({environment env = environment.development}) {
  Get
    ..put(CarSpotController())
    ..put(ParkController())
    ..put(env == environment.test
        ? SqfliteParkRepositoryMock()
        : SqfliteParkRepository())
    ..put(env == environment.test
        ? SqfliteCarRepositoryMock()
        : SqfliteCarRepository());
}
