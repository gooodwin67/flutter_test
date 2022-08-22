import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RzdWidget extends StatefulWidget {
  const RzdWidget({Key? key}) : super(key: key);

  @override
  State<RzdWidget> createState() => _RzdWidgetState();
}

class _RzdWidgetState extends State<RzdWidget> {
  Future getResponse() async {
    // var response = await http.get(Uri.parse(
    //     'https://pass.rzd.ru/timetable/public/ru?layer_id=5827&dir=0&tfl=3&checkSeats=1&code0={{code_from}}&dt0={{date}}&code1={{code_to}}&dt1={{date}}'));
    // print(response.body);
  }

  @override
  void initState() {
    getResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}
