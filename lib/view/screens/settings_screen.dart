import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final carSpotController = Get.find<CarSpotController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.local_parking),
                        labelText: 'Nome Setor',
                      ),
                      onChanged: (value) =>
                          carSpotController.nameSector.value = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.looks_one_rounded),
                        labelText: 'Vagas disponíveis',
                      ),
                      onChanged: (value) =>
                          carSpotController.quantityVagas.value = value,
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text('Adicionar Setor'),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        try {
                          await carSpotController.addSector();
                        } catch (e) {
                          Get.snackbar(
                            'Erro ao adicionar setor',
                            e.toString(),
                            duration: const Duration(seconds: 3),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: carSpotController.carSpots.length,
              itemBuilder: (context, index) {
                final carSpot = carSpotController.carSpots[index];
                return Card(
                  child: ListTile(
                    title: Text('Setor: ${carSpot.nameSetor ?? ''}'),
                    subtitle: Text(
                        '${carSpot.vagas} vagas disponibilizadas nesse setor'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await carSpotController.deleteSector(carSpot);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
