import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tite'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 100,
              child: const Placeholder(),
            ),
            const Text(
              'text',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
            const Text(
              'text',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
