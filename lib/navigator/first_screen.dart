import 'package:flutter/material.dart';
import 'package:flutterprojects/navigator/cart_screen.dart';
import 'package:flutterprojects/navigator/detailed_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  ),
              child: Icon(Icons.shopping_cart)),
          label: 'Cart',
        ),
      ]),
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailedScreen()),
              );
            },
            child: Text('Press'),
          ),
        ),
      ),
    );
  }
}
