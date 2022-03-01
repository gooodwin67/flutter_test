import 'package:flutter/material.dart';

class AllImages {
  static var imageCart =
      Image.asset('images/shopping-cart.png', width: 20, height: 20);
  static var imageMain = Image.asset('images/main.jpg');
  //AllImages(this.imageCart, this.imageMain);
}

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({Key? key}) : super(key: key);

  @override
  _ImagesWidgetState createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'LOGO',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      AllImages.imageCart,
                      SizedBox(width: 10),
                      const Icon(Icons.menu),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              AllImages.imageMain,
            ],
          ),
          color: Colors.grey[100],
        ),
      ),
    );
  }
}
