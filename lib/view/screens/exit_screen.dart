import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ExitScreen extends StatelessWidget {
  ExitScreen({Key? key}) : super(key: key);

  final parkController = Get.find<ParkController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Pesquisar por placa',
              labelStyle: TextStyle(fontSize: 20),
            ),
            style: const TextStyle(fontSize: 20),
            onChanged: (value) => parkController.searchPlateTerm.value = value,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => ListView(
              children: parkController.displayedCars
                  .map(
                    (car) => ListTile(
                      title: Text(car.plate ?? 'Placa não informada'),
                      subtitle: Text(
                          'Entrada: ${DateFormat('dd-MM-yy  kk:mm').format(car.entryDate)}'),
                      trailing: IconButton(
                          icon:
                              const Icon(Icons.car_repair, color: Colors.amber),
                          onPressed: () async {
                            showModalBottomSheet<void>(
                              builder: (context) => SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Deseja realmente retirar o carro?',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Placa: ${car.plate}'),
                                          Text(
                                              'Data/Hora Entrada: ${DateFormat('dd-MM-yy  kk:mm').format(car.entryDate)}'),
                                          Text('Telefone: ${car.phoneNumber}'),
                                          Text(
                                              'Proprietário: ${car.ownerName}'),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        OutlinedButton(
                                          child: const Text('Sim'),
                                          onPressed: () async {
                                            await parkController
                                                .exitCar(car.plate ?? '');
                                            Navigator.pop(context);
                                          },
                                        ),
                                        OutlinedButton(
                                          child: const Text('Não'),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              context: context,
                            );
                            // await parkController.exitCar(car.plate ?? ''),
                          }),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
