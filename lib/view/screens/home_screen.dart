import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/view/screens/settings_screen.dart';
import 'package:parking_flutter_raro/view/screens/parking_screen.dart';
import 'package:parking_flutter_raro/view/screens/report_screen.dart';
import 'package:parking_flutter_raro/view/screens/exit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final carSpotController = Get.find<CarSpotController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: carSpotController.carSpots.isEmpty ? 2 : 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car_rounded),
                child: Text('Saída'),
              ),
              Tab(
                icon: Icon(Icons.local_parking),
                child: Text('Estacionar'),
              ),
              Tab(
                icon: Icon(Icons.settings),
                child: Text('Configurações'),
              ),
              Tab(
                icon: Icon(Icons.feed_outlined),
                child: Text('Relatório'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ExitScreen(),
            ParkingScreen(),
            const SettingsScreen(),
            ReportScreen(),
          ],
        ),
      ),
    );
  }
}
