// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutterprojects/bottom_bar.dart';
import 'package:flutterprojects/bottomappbar.dart';
import 'package:flutterprojects/buttons.dart';
import 'package:flutterprojects/draw.dart';
import 'package:flutterprojects/images.dart';
import 'package:flutterprojects/list_view.dart';
import 'package:flutterprojects/bank_app.dart';
import 'package:flutterprojects/plitki_navigator.dart';
import 'package:flutterprojects/layout.dart';
import 'package:flutterprojects/inherit.dart';
import 'package:flutterprojects/provider_test.dart';
import 'package:flutterprojects/providers.dart';
import 'package:flutterprojects/shared_pref.dart';
import 'package:flutterprojects/test.dart';
import 'package:flutterprojects/test_sliver.dart';
import 'package:flutterprojects/wrap_safearea.dart';
import 'package:flutterprojects/test_app.dart';
import 'package:flutterprojects/textfield.dart';
import 'package:flutterprojects/stak.dart';
import 'package:flutterprojects/singe_child_scroll_view.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Number()),
      ],
      child: TestProvider(),
    ));
