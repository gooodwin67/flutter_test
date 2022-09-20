import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar/data_provider.dart';
import 'package:flutterprojects/nav_prov_botbar/my_firstscreen.dart';
import 'package:flutterprojects/nav_prov_botbar/my_secondscreen.dart';
import 'package:provider/provider.dart';

class Nav_prov_botbar extends StatelessWidget {
  const Nav_prov_botbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('mainScreenBuild');
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DataProvider2())],
      child: MaterialApp(
        initialRoute: '/main',
        routes: {
          '/main': (context) => Main(),
          'first': (context) => MyFirstScreen(),
          'second': (context) => MySecondScreen(),
        },
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, 'first'),
        child: Text('Go'),
      ),
    );
  }
}
