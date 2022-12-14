import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBottomBar extends StatelessWidget {
  const GoBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            context.go('/');
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
            context.go('/second');
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
