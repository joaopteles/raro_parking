import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/model/car_model.dart';
import 'package:parking_flutter_raro/model/park_model.dart';
import 'package:get/get.dart';
import 'package:parking_flutter_raro/repository/sqflte_car.dart';

class ParkController extends GetxController {
  RxList<CarModel> parkList = <CarModel>[].obs;
  RxList<CarModel> parkListReport = <CarModel>[].obs;
  Rx<String> plate = ''.obs;
  Rx<String> ownerName = ''.obs;
  Rx<String> phoneNumber = ''.obs;
  Rx<String> searchPlateTerm = ''.obs;
  Rx<DateTime> searchDate = DateTime.now().obs;

  final CarSpotController carSpotController = Get.find();
  final SqfliteCarRepository _carRepository = Get.put(SqfliteCarRepository());

  List<CarModel> get displayedCars => searchPlateTerm.value.isEmpty
      ? parkList
      : parkList
          .where((car) =>
              car.plate
                  ?.toLowerCase()
                  .contains(searchPlateTerm.value.toLowerCase()) ??
              false)
          .toList();

  Future<List<CarModel>> get initDb async {
    var list = await _carRepository.getAllCars();
    parkList.value = list.where((car) => car.departureDate == null).toList();
    parkListReport.value =
        list.where((car) => car.departureDate != null).toList();
    return parkList;
  }

  List<CarModel> get displayedReport => parkListReport
      .where((car) =>
          car.entryDate.day.isEqual(searchDate.value.day) &&
          car.entryDate.month.isEqual(searchDate.value.month) &&
          car.entryDate.year.isEqual(searchDate.value.year))
      .toList();

  List<CarModel> get listReportOrderByDate {
    var list = parkListReport.toList();
    list.sort((a, b) => a.entryDate.compareTo(b.entryDate));
    return list;
  }

  Future<void> addCar() async {
    var car = CarModel(
      plate: plate.value,
      ownerName: ownerName.value,
      phoneNumber: phoneNumber.value,
      entryDate: DateTime.now(),
      park: ParkModel(
          sectorName: carSpotController.selectedCarSpot.value,
          vacancy: carSpotController.selectedVacancy.value),
    );
    parkList.add(car);
    await _carRepository.insertCar(car);
  }

  Future<void> exitCar(String _plate) async {
    CarModel carModel = parkList.firstWhere((car) => car.plate == _plate);
    carModel.departureDate = DateTime.now();
    parkListReport.add(carModel);
    parkList.remove(carModel);
    await _carRepository.updateCar(carModel);
  }
}
