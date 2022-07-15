import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class JoomApi extends StatefulWidget {
  const JoomApi({Key? key}) : super(key: key);

  @override
  State<JoomApi> createState() => _JoomApiState();
}

class _JoomApiState extends State<JoomApi> {
  String categoryImagePath = '';
  String categoryImageName = '';
  String catImage = 'assets/loading.gif';
  bool status = false;

  Future getData() async {
    final str = "gooodwin67@yandex.ru:vlesu1525yes";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);
    print(base64Str);

    String token;

    var response = await http.post(
      Uri.parse(
          'https://noutparts67.ru/index.php?option=com_jshopping&controller=addon_api'),
      headers: {'Authorization': 'Basic $base64Str'},
      body: {
        'section': 'connection',
        'task': 'open',
      },
    );
    print(response.statusCode);
    var mapp = jsonDecode(response.body);
    //print(response.body);
    token = mapp['result'];

    try {
      // var responseConfig = await http.post(
      //   Uri.parse(
      //       'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api'),
      //   headers: {'Authorization': 'Bearer  $token'},
      //   body: {
      //     'section': 'shop',
      //     'task': 'config',
      //   },
      // );

      // var responseCategoryIds = await http.post(
      //   Uri.parse(
      //       'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api'),
      //   headers: {'Authorization': 'Bearer  $token'},
      //   body: {
      //     'section': 'category',
      //     'task': 'ids',
      //   },
      // );
      // var responseCategoryIdsMap =
      //     jsonDecode(responseCategoryIds.body)['result'];
      //print(responseCategoryIdsMap.runtimeType);

      var responseCategory = await http.post(
        Uri.parse(
            'https://noutparts67.ru/index.php?option=com_jshopping&controller=addon_api'),
        headers: {'Authorization': 'Bearer  $token'},
        body: {
          "section": "category",
          "task": "items",
          "args[ids]": [1, 2, 3],
        },
      );

      // var responseConfigMap = jsonDecode(responseConfig.body);
      print(responseCategory.statusCode);
      var responseCategoryMap = jsonDecode(responseCategory.body);
      print(responseCategoryMap);

      setState(() {
        // responseConfig.statusCode == 200 ? status = true : status = false;
        // categoryImagePath =
        //     responseConfigMap['result']['image_category_live_path'];
        // categoryImageName =
        //     responseCategoryMap['result']['category']['category_image'];
        // catImage = categoryImagePath + '/' + categoryImageName;
      });
    } catch (e) {
      print('error: $e');
    }

    // var responseClose = await http.post(
    //   Uri.parse(
    //       'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api'),
    //   headers: {'Authorization': 'Bearer  $token'},
    //   body: {
    //     'section': 'connection',
    //     'task': 'close',
    //   },
    // );
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
