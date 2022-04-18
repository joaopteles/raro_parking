import 'package:parking_flutter_raro/controllers/car_spot_controller.dart';
import 'package:parking_flutter_raro/controllers/park_controller.dart';
import 'package:parking_flutter_raro/view/screens/home_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Get.put(CarSpotController()).sectorModelsDb;
    Get.put(ParkController()).initDb;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 3000,
      imageSize: 260,
      imageSrc: "assets/images/logo.png",
      pageRouteTransition: PageRouteTransition.SlideTransition,
      backgroundColor: Colors.white,
    );
  }
}
