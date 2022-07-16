import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class JoomApiDio extends StatefulWidget {
  const JoomApiDio({Key? key}) : super(key: key);

  @override
  State<JoomApiDio> createState() => _JoomApiDioState();
}

class _JoomApiDioState extends State<JoomApiDio> {
  String categoryImagePath = '';
  String categoryImageName = '';
  String catImage = 'assets/loading.gif';
  bool status = false;

  Future getData() async {
    final str = "gooodwin67@yandex.ru:vlesu1525yes";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);

    String token;

    var formOpen = FormData.fromMap({
      'section': 'connection',
      'task': 'open',
    });

    var dio = Dio();
    var response = await dio.post(
      'https://noutparts67.ru/index.php?option=com_jshopping&controller=addon_api',
      options: Options(
        headers: {'Authorization': 'Basic $base64Str'},
      ),
      data: formOpen,
    );
    print(response.data);

    var mapp = jsonDecode(response.data);

    token = mapp['result'];

    var formData = FormData.fromMap({
      "section": "category",
      "task": "items",
      "args[ids]": [
        [1],
        [2],
        [3]
      ]
    });

    var responseData = await dio.post(
      'https://noutparts67.ru/index.php?option=com_jshopping&controller=addon_api',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: formData,
    );
    var responseDataMap = jsonDecode(responseData.data);
    //print(responseDataMap.runtimeType);
    var res = responseDataMap['result'];
    var res2 = res[2.toString()]['category'];
    print(res2['category_id']);

    var formDataClose = FormData.fromMap({
      'section': 'connection',
      'task': 'close',
    });

    var responseClose = await dio.post(
      'https://noutparts67.ru/index.php?option=com_jshopping&controller=addon_api',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: formDataClose,
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              // child: status
              //     ? Image.network(
              //         '$catImage',
              //         width: 100,
              //         height: 100,
              //       )
              //     : Image.asset(
              //         '$catImage',
              //         width: 100,
              //         height: 100,
              //       ),
              ),
        ),
      ),
    );
  }
}
