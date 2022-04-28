import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/model/car_model.dart';
import 'package:parking_flutter_raro/model/park_model.dart';

import 'main_teste.dart';
import 'main_test.mocks.dart';

void main() {
  init();
  group('ControllerCarTeste', () {
    var carRepository = MockSqfliteCarRepository();

    var carSpotControler = Get.find<CarSpotController>();

    List<CarModel> listCar = [
      CarModel(
        plate: 'ABC-1234',
        entryDate: DateTime.now(),
        departureDate: DateTime.now(),
        ownerName: 'Rafael',
        phoneNumber: '123456789',
        park: ParkModel(
          sectorName: 'A',
          vacancy: 1,
        ),
      ),
      CarModel(
        plate: 'ABC-1234',
        entryDate: DateTime.now(),
        departureDate: DateTime.now(),
        ownerName: 'Rafael',
        phoneNumber: '123456789',
        park: ParkModel(
          sectorName: 'A',
          vacancy: 1,
        ),
      ),
    ];
    test('Teste se vaga não está disponível', () async {
      when(await carRepository.getAllCars()).thenReturn(listCar);
      carSpotControler.selectedCarSpot.value = 'A';
      var teste = carSpotControler.freeVacancy(listCar, 1);

      expect(teste, false);
    });

    test('Teste se vaga está disponível', () async {
      when(await carRepository.getAllCars()).thenReturn(listCar);
      carSpotControler.selectedCarSpot.value = 'B';
      var teste = carSpotControler.freeVacancy(listCar, 1);

      expect(teste, true);
    });
  });
}
