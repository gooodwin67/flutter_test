// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutterprojects/bottom_bar.dart';
import 'package:flutterprojects/bottomappbar.dart';
import 'package:flutterprojects/buttons.dart';
import 'package:flutterprojects/draw.dart';
import 'package:flutterprojects/go_router/go_first_screen.dart';
import 'package:flutterprojects/go_router/go_first_screen2.dart';
import 'package:flutterprojects/go_router/go_first_screen3.dart';
import 'package:flutterprojects/go_router/go_first_screen4.dart';
import 'package:flutterprojects/go_router/go_second_screen.dart';
import 'package:flutterprojects/http_json/http_json.dart';
import 'package:flutterprojects/http_json2/http_json2.dart';
import 'package:flutterprojects/http_test/http_test.dart';
import 'package:flutterprojects/images.dart';
import 'package:flutterprojects/inherit_model.dart';
import 'package:flutterprojects/inherit_widget.dart';
import 'package:flutterprojects/inherit_widget2.dart';
import 'package:flutterprojects/inherit_widget3.dart';
import 'package:flutterprojects/joom_api/joom_api.dart';
import 'package:flutterprojects/joom_api/joom_api_dio.dart';
import 'package:flutterprojects/json/json.dart';
import 'package:flutterprojects/json/json2.dart';
import 'package:flutterprojects/json/json_test.dart';
import 'package:flutterprojects/json_all/json_all.dart';
import 'package:flutterprojects/json_generation/json_gen.dart';
import 'package:flutterprojects/json_generation/json_gen2.dart';
import 'package:flutterprojects/json_test_new/json_new.dart';
import 'package:flutterprojects/list_view.dart';
import 'package:flutterprojects/bank_app.dart';
import 'package:flutterprojects/nav_prov_botbar/nav_prov_botbar.dart';
import 'package:flutterprojects/nav_prov_botbar2/nav_prov_botbar2.dart';
import 'package:flutterprojects/navigator/main_screen.dart';
import 'package:flutterprojects/navigator2/first_screen.dart';
import 'package:flutterprojects/navigator2/first_screen2.dart';
import 'package:flutterprojects/navigator2/first_screen3.dart';
import 'package:flutterprojects/navigator2/second_screen.dart';
import 'package:flutterprojects/plitki_navigator.dart';
import 'package:flutterprojects/layout.dart';
import 'package:flutterprojects/inherit.dart';
import 'package:flutterprojects/providers/provider_test.dart';
import 'package:flutterprojects/providers/providers.dart';
import 'package:flutterprojects/routemaster/routermaster.dart';
import 'package:flutterprojects/rzd_test/rzd_test.dart';
import 'package:flutterprojects/shared_pref.dart';
import 'package:flutterprojects/test.dart';
import 'package:flutterprojects/test_sliver.dart';
import 'package:flutterprojects/user_profile.dart';
import 'package:flutterprojects/wrap_safearea.dart';
import 'package:flutterprojects/test_app.dart';
import 'package:flutterprojects/textfield.dart';
import 'package:flutterprojects/stak.dart';
import 'package:flutterprojects/singe_child_scroll_view.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
  runApp(JsonAllTest());
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

/*
class MainAppNavigatorTest extends StatefulWidget {
  const MainAppNavigatorTest({Key? key}) : super(key: key);

  @override
  State<MainAppNavigatorTest> createState() => _MainAppNavigatorTestState();
}

class _MainAppNavigatorTestState extends State<MainAppNavigatorTest> {
  String thisRoute = '/first';
  bool is404 = false;

  void goToRoute(route) {
    setState(() {
      thisRoute = route;
      //print(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: Navigator2TestFirstScreen(goToRoute),
          ),
          if (thisRoute == 'second')
            MaterialPage(
              child: Navigator2TestSecondScreen(goToRoute),
            ),
          if (thisRoute == '/first/first2')
            MaterialPage(
              child: Navigator2TestFirstScreen2(goToRoute),
            ),
          if (thisRoute == '/first/first2/first3')
            MaterialPage(
              child: Navigator2TestFirstScreen3(goToRoute),
            ),
        ],
        onPopPage: (route, result) {
          print(route.toString());
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute('/')!.currentPage!],
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const GoRouterFirstScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'first2',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterFirstScreen2();
          },
          routes: [
            GoRoute(
              path: 'first3',
              builder: (BuildContext context, GoRouterState state) {
                return const GoRouterFirstScreen3();
              },
              routes: [
                GoRoute(
                  path: 'first4',
                  builder: (BuildContext context, GoRouterState state) {
                    return const GoRouterFirstScreen4();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'second',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterSecondScreen();
          },
        ),
      ],
    ),
  ],
);
