import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  final parkController = Get.find<ParkController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: OutlinedButton.icon(
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate: parkController.searchDate.value,
                      firstDate:
                          parkController.listReportOrderByDate.first.entryDate,
                      lastDate:
                          parkController.listReportOrderByDate.last.entryDate)
                  .then((value) => parkController.searchDate.value =
                      value ?? DateTime.now());
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text('Selecione uma data para exibir relatório'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(
            () => ListView(
              children: parkController.displayedReport
                  .map(
                    (car) => ListTile(
                      isThreeLine: true,
                      shape: const Border(
                        top: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      title: Text(car.plate ?? 'Placa não informada'),
                      subtitle: Text(
                          'Proprietário:\n${car.ownerName ?? 'Nome não informado'}'),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Entrada: ${DateFormat('dd-MM-yy  kk:mm').format(car.entryDate)}'),
                          Text(
                              'Saída: ${DateFormat('dd-MM-yy  kk:mm').format(car.departureDate!)}'),
                        ],
                      ),
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
