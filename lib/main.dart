// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutterprojects/bottom_bar.dart';
import 'package:flutterprojects/bottomappbar.dart';
import 'package:flutterprojects/buttons.dart';
import 'package:flutterprojects/draw.dart';
import 'package:flutterprojects/images.dart';
import 'package:flutterprojects/json/json.dart';
import 'package:flutterprojects/json_generation/json_gen.dart';
import 'package:flutterprojects/json_generation/json_gen2.dart';
import 'package:flutterprojects/list_view.dart';
import 'package:flutterprojects/bank_app.dart';
import 'package:flutterprojects/navigator/main_screen.dart';
import 'package:flutterprojects/plitki_navigator.dart';
import 'package:flutterprojects/layout.dart';
import 'package:flutterprojects/inherit.dart';
import 'package:flutterprojects/providers/provider_test.dart';
import 'package:flutterprojects/providers/providers.dart';
import 'package:flutterprojects/shared_pref.dart';
import 'package:flutterprojects/test.dart';
import 'package:flutterprojects/test_sliver.dart';
import 'package:flutterprojects/user_profile.dart';
import 'package:flutterprojects/wrap_safearea.dart';
import 'package:flutterprojects/test_app.dart';
import 'package:flutterprojects/textfield.dart';
import 'package:flutterprojects/stak.dart';
import 'package:flutterprojects/singe_child_scroll_view.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'json.dart';

// void main() => runApp(MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Number()),
//         ChangeNotifierProvider(create: (_) => Products()),
//       ],
//       child: MainScreen(),
//     ));

void main() {
  runApp(JSonGenWidget3());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widgets[index].widget));
                  },
                  child: Text(widgets[index].name.toString()),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

List widgets = [
  Widgets(name: 'Json', widget: const JsonWidget()),
  Widgets(name: 'images', widget: const ImagesWidget()),
  Widgets(name: 'Plitki', widget: const Plitki()),
  Widgets(name: 'BottomBar', widget: const BottomBar()),
  Widgets(name: 'BottomAppBarr', widget: const BottomAppBarr()),
  Widgets(name: 'Buttons', widget: const Buttons()),
  Widgets(name: 'Draw', widget: const Draw()),
  Widgets(name: 'SharedTest', widget: const SharedTest()),
  Widgets(
      name: 'SingleChildScrollViewApp',
      widget: const SingleChildScrollViewApp()),
  Widgets(name: 'LayoutTest', widget: const LayoutTest()),
  Widgets(name: 'ListViewApp', widget: const ListViewApp()),
  Widgets(name: 'StackApp', widget: const StackApp()),
  Widgets(name: 'testApp', widget: testApp()),
  Widgets(name: 'TestSliver', widget: const TestSliver()),
  Widgets(name: 'TextFieldWidget', widget: TextFieldWidget()),
  Widgets(name: 'UserProfile', widget: const UserProfile()),
  Widgets(name: 'Wrapp', widget: const Wrapp()),
];

class Widgets {
  final String name;
  final Widget widget;

  Widgets({required this.name, required this.widget});
}
