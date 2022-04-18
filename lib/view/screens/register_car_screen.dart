import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/core/routes/app_routes.dart';
import 'package:parking_flutter_raro/view/shared/input_format.dart';

class RegisterCarScreen extends StatelessWidget {
  RegisterCarScreen({Key? key}) : super(key: key);

  final carSpotController = Get.find<CarSpotController>();
  final parkController = Get.find<ParkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estacionar Carro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
                'Vaga ${carSpotController.selectedVacancy.value} / Setor ${carSpotController.selectedCarSpot.value}'),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Placa',
                labelStyle: TextStyle(fontSize: 20),
              ),
              inputFormatters: [
                UpperCaseTextFormatter(),
                MaskTextInputFormatter(
                  mask: 'AAA-####',
                ),
              ],
              style: const TextStyle(fontSize: 20),
              onChanged: (value) => parkController.plate.value = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome do proprietário',
                  labelStyle: TextStyle(fontSize: 20),
                ),
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(fontSize: 20),
                onChanged: (value) => parkController.ownerName.value = value,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Telefone do proprietário',
                labelStyle: TextStyle(fontSize: 20),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                MaskTextInputFormatter(mask: "(##) #####-####")
              ],
              style: const TextStyle(fontSize: 20),
              onChanged: (value) => parkController.phoneNumber.value = value,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: double.maxFinite,
                child: OutlinedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text('Estacionar'),
                  ),
                  onPressed: () {
                    parkController.addCar();
                    Navigator.popAndPushNamed(context, BaseRoutes.homeScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
