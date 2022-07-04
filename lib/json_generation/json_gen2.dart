import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_gen2.g.dart';

class JSonGenWidget2 extends StatelessWidget {
  const JSonGenWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    decode() {
      print('decode');
      Map<String, dynamic> productMap = jsonDecode(jsonData);
      var product = Product.fromJson(productMap);

      var imageJson = product.image.toJson();
      var image = ImageResponse.fromJson(imageJson);

      print(product.name);
      print(image.url);

      //print("url: ${image.url}");
    }

    encode() {
      print('encode');
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decode,
                child: Text('decode'),
              ),
              ElevatedButton(
                onPressed: encode,
                child: Text('encode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@JsonSerializable()
class Product {
  final String id;
  final String type;
  final String name;
  final ImageResponse image;

  Product(this.id, this.type, this.name, this.image);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ImageResponse {
  final String url;
  final int width;
  final int height;

  ImageResponse(this.url, this.width, this.height);

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return _$ImageResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ImageResponseToJson(this);
  }
}

String jsonData = """
{
	"id": "0001",
	"type": "donut",
	"name": "Cake",
	"image":
		{
			"url": "images/0001.jpg",
			"width": 200,
			"height": 200
		},
	"thumbnail":
		{
			"url": "images/thumbnails/0001.jpg",
			"width": 32,
			"height": 32
		}
} 
""";
