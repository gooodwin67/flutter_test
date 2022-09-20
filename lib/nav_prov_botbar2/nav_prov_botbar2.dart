import 'package:flutter/material.dart';
import 'package:flutterprojects/nav_prov_botbar2/data_provider2.dart';
import 'package:flutterprojects/nav_prov_botbar2/my_firstscreen2.dart';
import 'package:flutterprojects/nav_prov_botbar2/my_secondscreen2.dart';
import 'package:flutterprojects/nav_prov_botbar2/routes.dart';
import 'package:provider/provider.dart';

class Nav_prov_botbar2 extends StatelessWidget {
  const Nav_prov_botbar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('mainScreenBuild');
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DataProvider2())],
      child: MaterialApp(home: Main()),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listScreens[context.watch<DataProvider2>().screen];
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<DataProvider2>().changeScreen(1);
        },
        child: Text('Go'),
      ),
    );
  }
}
