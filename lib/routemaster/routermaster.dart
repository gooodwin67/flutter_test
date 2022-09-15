import 'package:flutter/material.dart';
import 'package:flutterprojects/navigator/first_screen.dart';
import 'package:flutterprojects/routemaster/detailed_screen.dart';
import 'package:flutterprojects/routemaster/first_screen.dart';
import 'package:flutterprojects/routemaster/second_screen.dart';
import 'package:flutterprojects/routemaster/third_screen.dart';
import 'package:routemaster/routemaster.dart';

class RouterMaster extends StatelessWidget {
  const RouterMaster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: RoutemasterParser(),
    );
  }
}

final routes = RouteMap(routes: {
  '/': (routeData) => MaterialPage(child: RouterMasterFirstScreen()),
  '/second': (routeData) => MaterialPage(child: RouterMasterSecondScreen()),
  '/third': (routeData) => MaterialPage(child: RouterMasterThirdScreen()),
});
