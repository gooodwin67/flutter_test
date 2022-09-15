import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class RouterMasterFirstScreen extends StatelessWidget {
  const RouterMasterFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = ValueKey('value');
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'one',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () => Routemaster.of(context).push('second'),
                child: Icon(Icons.fireplace_sharp)),
            label: 'two',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fireplace_sharp),
            label: 'three',
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          key: key,
          title: Text('Item $index'),
        ),
      ),
    );
  }
}
