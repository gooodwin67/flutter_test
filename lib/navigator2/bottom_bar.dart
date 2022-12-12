import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatelessWidget {
  final Function goToRoute;
  const BottomBar(this.goToRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            goToRoute('/first');
          },
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            color: Colors.grey,
            child: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            goToRoute('/second');
          },
          child: Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            color: Colors.grey,
            child: Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
