import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkScreen extends StatelessWidget {
  ParkScreen({Key? key}) : super(key: key);

  final carSpotController = Get.find<CarSpotController>();
  final parkController = Get.find<ParkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETOR ${carSpotController.selectedCarSpot.value}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 40.0),
        child: ListView.builder(
          itemCount: carSpotController
              .whereCarSpots(carSpotController.selectedCarSpot.value),
          itemBuilder: (context, index) {
            var vacancy = index + 1;
            var free = carSpotController.freeVacancy(
              parkController.parkList,
              vacancy,
            );
            return ListTile(
              title: Text('VAGA ' + (index + 1).toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              subtitle: free
                  ? const Text('LIVRE', style: TextStyle(color: Colors.green))
                  : const Text('OCUPADA', style: TextStyle(color: Colors.red)),
              leading: Icon(Icons.local_parking_sharp,
                  color: free ? Colors.green : Colors.red),
              onTap: carSpotController.freeVacancy(
                      parkController.parkList, (index + 1))
                  ? () {
                      carSpotController.selectedVacancy.value = index + 1;
                      Navigator.pushNamed(
                          context, BaseRoutes.registerCarScreen);
                    }
                  : null,
              contentPadding: const EdgeInsets.all(10),
              shape: const Border(
                bottom: BorderSide(
                  width: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
