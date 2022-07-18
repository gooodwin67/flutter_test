import 'dart:convert';
import 'dart:developer';
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
      'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api',
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
        [3],
      ]
    });

    var responseData = await dio.post(
      'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: formData,
    );

    var formProdsAllId = FormData.fromMap({
      "section": "product",
      "task": "ids",
    });

    var responseProdAllId = await dio.post(
        'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: formProdsAllId);

    var responseProdAllIdMap = jsonDecode(responseProdAllId.data);

    List prodAllId = responseProdAllIdMap['result'];

    var formProdsAll = FormData.fromMap({
      "section": "product",
      "task": "items",
      "args[ids]": prodAllId.map((e) => [e]).toList()
    });

    var responseProdAll = await dio.post(
        'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: formProdsAll);

    // Map<String, dynamic> responseProdAllMap = json.decode(responseProdAll.data);

    // Map<String, dynamic> prodAll = responseProdAllMap['result'];
    // List<dynamic> prodData = prodAll["1"];

    Map<String, dynamic> prodData =
        Map<String, dynamic>.from(json.decode(responseProdAll.data));

    print(prodData);

    //name_ru-RU
    //var productss = prodAll['1'].map((e) => e);
    // var products = prodAll.map((e) => Product.fromJson(e)).toList();
    //(productss);

    var formDataClose = FormData.fromMap({
      'section': 'connection',
      'task': 'close',
    });

    var responseClose = await dio.post(
      'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api',
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

class Product {
  final String name;

  Product({required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(name: json['name_ru-RU']);
  }
}
