import 'package:parking_flutter_raro/core/routes/app_routes.dart';
import 'package:parking_flutter_raro/core/inject/injector.dart';
import 'package:parking_flutter_raro/view/theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Flutter Raro',
      theme: themeData,
      initialRoute: AppPages.initRoute,
      routes: AppPages.routes,
    );
  }
}
