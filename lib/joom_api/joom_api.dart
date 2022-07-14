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
  Future getData() async {
    final str = "email:pass";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);

    var response = await http.post(
      Uri.parse(
          'https://site.ru/index.php?option=com_jshopping&controller=addon_api'),
      headers: {'Authorization': 'Basic $base64Str'},
      body: {},
    );

    print(response.body);
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
        body: Container(
          child: Text('data'),
        ),
      ),
    );
  }
}
