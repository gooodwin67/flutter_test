import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers.dart';

class TestProviderSecondFile extends StatelessWidget {
  const TestProviderSecondFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context);
    return Column(
      children: [
        Text(context.watch<Number>().num.toString()),
        ElevatedButton(
            onPressed: () {
              context.read<Number>().decrement(5);
            },
            child: Text('Press'))
      ],
    );
  }
}
