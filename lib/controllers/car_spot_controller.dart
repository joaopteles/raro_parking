import 'package:parking_flutter_raro/repository/sqflte_park.dart';
import 'package:parking_flutter_raro/model/sector_model.dart';
import 'package:parking_flutter_raro/model/car_model.dart';
import 'package:get/get.dart';

class CarSpotController extends GetxController {
  RxList<SectorModel> carSpots = <SectorModel>[].obs;
  Rx<String> nameSector = ''.obs;
  Rx<String> quantityVagas = ''.obs;
  Rx<String> selectedCarSpot = ''.obs;
  Rx<int> selectedVacancy = 0.obs;

  final SqfliteParkRepository _parkRepository =
      Get.put(SqfliteParkRepository());

  Future<List<SectorModel>> get sectorModelsDb async {
    carSpots.value = await _parkRepository.getAllParks();
    return carSpots;
  }

  int? whereCarSpots(String sector) {
    return carSpots.where((p0) => p0.nameSetor == sector).first.vagas;
  }

  int quantityCarSpots(List<CarModel> parkList, String setor) {
    int? quantityCarSpots =
        carSpots.firstWhere((element) => element.nameSetor == setor).vagas;
    int quantityCarinSector =
        parkList.where((car) => car.park.sectorName == setor).length;
    return (quantityCarSpots! - quantityCarinSector);
  }

  bool freeVacancy(List<CarModel> parkList, int vacancy) {
    return parkList
        .where((car) =>
            car.park.sectorName == selectedCarSpot.value &&
            car.park.vacancy == vacancy)
        .isEmpty;
  }

  Future<void> addSector() async {
    var sector = SectorModel(
      nome: nameSector.value,
      vagasSetor: int.parse(quantityVagas.value),
    );
    await _parkRepository.insertPark(sector);
    carSpots.add(sector);
  }

  Future<void> deleteSector(SectorModel sector) async {
    await _parkRepository.deletePark(sector);
    carSpots.removeWhere((p) => p.nameSetor == sector.nameSetor);
  }
}
