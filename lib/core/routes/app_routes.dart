import 'package:flutter/cupertino.dart';
import 'package:parking_flutter_raro/view/screens/home_screen.dart';
import 'package:parking_flutter_raro/view/screens/park_screen.dart';
import 'package:parking_flutter_raro/view/screens/register_car_screen.dart';
import 'package:parking_flutter_raro/view/screens/splash_screen.dart';

abstract class AppPages {
  const AppPages._();

  static const String initRoute = BaseRoutes.splashScreen;

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    BaseRoutes.splashScreen: (BuildContext context) => const Splash(),
    BaseRoutes.homeScreen: (BuildContext context) => HomeScreen(),
    BaseRoutes.parkScreen: (BuildContext context) => ParkScreen(),
    BaseRoutes.registerCarScreen: (BuildContext context) => RegisterCarScreen(),
  };
}

abstract class BaseRoutes {
  const BaseRoutes._();

  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String parkScreen = '/park';
  static const String registerCarScreen = '/registerCar';
}
