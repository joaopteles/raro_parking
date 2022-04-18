import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/core/routes/app_routes.dart';

class ParkingScreen extends StatelessWidget {
  ParkingScreen({Key? key}) : super(key: key);

  final carSpotController = Get.find<CarSpotController>();
  final parkController = Get.find<ParkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0),
              child: Text(
                carSpotController.carSpots.isNotEmpty
                    ? 'Selecione um setor para estacionar'
                    : 'Nenhum setor disponível, cadastre um setor na tela de configurações',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            if (carSpotController.carSpots.isNotEmpty)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: carSpotController.carSpots
                      .map((carSpot) => Card(
                            elevation: 10,
                            child: InkWell(
                              onTap: () {
                                carSpotController.selectedCarSpot.value =
                                    carSpot.nameSetor!;
                                Navigator.pushNamed(
                                    context, BaseRoutes.parkScreen);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "SETOR " + carSpot.nameSetor.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Vagas disponíveis: " +
                                        (carSpotController
                                            .quantityCarSpots(
                                                parkController.parkList,
                                                carSpot.nameSetor!)
                                            .toString()),
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
