// import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/core/inject/injector.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:parking_flutter_raro/model/car_model.dart';
// import 'package:parking_flutter_raro/model/park_model.dart';
// import 'package:parking_flutter_raro/model/sector_model.dart';
import 'package:parking_flutter_raro/repository/sqflte_car.dart';
import 'package:parking_flutter_raro/repository/sqflte_park.dart';

// import 'main_test.mocks.dart';

@GenerateMocks([SqfliteCarRepository, SqfliteParkRepository])
init() {
  initInjector(env: environment.test);
}
