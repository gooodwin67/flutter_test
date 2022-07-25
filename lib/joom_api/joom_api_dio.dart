import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class JoomApiDio extends StatefulWidget {
  const JoomApiDio({Key? key}) : super(key: key);

  @override
  State<JoomApiDio> createState() => _JoomApiDioState();
}

class _JoomApiDioState extends State<JoomApiDio> {
  String siteUrl =
      'http://testjoom.roool.ru/index.php?option=com_jshopping&controller=addon_api';
  Future getData() async {
    final str = "gooodwin67@yandex.ru:vlesu1525yes";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);

    String token;

    var formOpen = FormData.fromMap({
      'section': 'connection',
      'task': 'open',
    });

    var dio = Dio();
    var responseOpen = await dio.post(
      siteUrl,
      options: Options(
        headers: {'Authorization': 'Basic $base64Str'},
      ),
      data: formOpen,
    );
    print(responseOpen.data);

    var mapp = jsonDecode(responseOpen.data);

    token = mapp['result'];
////////////////////////////////////////////////////////////////////////////////////////////////////
    ///
    ///
    var formResponseProdIds = FormData.fromMap({
      'section': 'product',
      'task': 'ids',
    });

    var responseProdIds = await dio.post(siteUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: formResponseProdIds);
    var allIdsMap = jsonDecode(responseProdIds.data);
    var allIds = ResIds.fromJson(allIdsMap);
    List argsIdsList = allIds.result;

    List argsIds = argsIdsList.map((e) => [e]).toList();
    //print(argsIds);

    ///////////////////////////////////////////////////////////////////////////////

    var formResponseProdAll = FormData.fromMap({
      'section': 'product',
      'task': 'items',
      'args[ids]': argsIds,
    });

    var responseProdAll = await dio.post(siteUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: formResponseProdAll);

    var myJsonMap = jsonDecode(responseProdAll.data);

    var response = ResJson.fromJson(myJsonMap);

    print(response.result.ids.length);
    //print(response.result.ids[1].product.name);

////////////////////////////////////////////////////////////////////////////////////////////////////
    var formDataClose = FormData.fromMap({
      'section': 'connection',
      'task': 'close',
    });

    var responseClose = await dio.post(
      siteUrl,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: formDataClose,
    );
    print(responseClose.data);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}

class ResIds {
  final List result;

  ResIds({required this.result});

  factory ResIds.fromJson(Map<String, dynamic> json) {
    return ResIds(
      result: json['result'],
    );
  }
}

class ResJson {
  final String status;
  final ResJsonResult result;

  ResJson({required this.status, required this.result});

  factory ResJson.fromJson(Map<String, dynamic> json) {
    return ResJson(
      status: json['status'],
      result: ResJsonResult.fromJson(json["result"]),
    );
  }
}

class ResJsonResult {
  final List ids;

  ResJsonResult({required this.ids});

  factory ResJsonResult.fromJson(Map<String, dynamic> json) {
    List listIds = [];
    json.forEach((key, value) {
      listIds.add(value);
    });
    return ResJsonResult(
        ids: listIds.map((e) => ResItemJson.fromJson(e)).toList());
  }
}

class ResItemJson {
  final bool allow_review;
  final ProductJson product;

  ResItemJson({required this.allow_review, required this.product});

  factory ResItemJson.fromJson(Map<String, dynamic> json) {
    return ResItemJson(
      allow_review: json['allow_review'],
      product: ProductJson.fromJson(json['product']),
    );
  }
}

class ProductJson {
  final int id;
  final String name;

  ProductJson({required this.id, required this.name});

  factory ProductJson.fromJson(Map<String, dynamic> json) {
    return ProductJson(
      id: json['product_id'],
      name: json['name'],
    );
  }
}

String usersJson = '''
{
  "status": "ok",
  "code": 1,
  "report": "No errors. Success",
  "result": {
    "1": {
      "all_attr_values": [],
      "allow_review": true,
      "attributes": [],
      "available": "",
      "back_value": {
        "pid": null,
        "attr": [],
        "qty": null
      },
      "default_count_product": 1,
      "demofiles": [],
      "display_pagination": false,
      "enable_wishlist": true,
      "hide_buy": false,
      "image_path": "http://testjoom.roool.ru/components/com_jshopping/images",
      "image_product_path": "http://testjoom.roool.ru/components/com_jshopping/files/img_products",
      "images": [
        {
          "image_id": 1,
          "product_id": 1,
          "image_name": "prod1.jpg",
          "name": "",
          "ordering": 1,
          "sort": 0,
          "_title": "Product1",
          "image_thumb": "thumb_prod1.jpg",
          "image_full": "full_prod1.jpg"
        }
      ],
      "noimage": "noimage.gif",
      "parts_count": 2,
      "product": {
        "product_id": 1,
        "parent_id": 0,
        "product_ean": "",
        "manufacturer_code": "",
        "product_quantity": 1,
        "unlimited": 0,
        "product_availability": "",
        "product_date_added": "2022-07-15 16:56:29",
        "date_modify": "2022-07-18 12:17:04",
        "product_publish": 1,
        "product_tax_id": 1,
        "currency_id": 1,
        "product_template": "default",
        "product_url": "",
        "product_old_price": 0,
        "product_buy_price": 0,
        "product_price": 10,
        "min_price": 10,
        "different_prices": 0,
        "product_weight": 0,
        "image": "prod1.jpg",
        "product_manufacturer_id": 0,
        "product_is_add_price": 0,
        "add_price_unit_id": 3,
        "average_rating": 0,
        "reviews_count": 0,
        "delivery_times_id": 0,
        "hits": 94,
        "weight_volume_units": 0,
        "basic_price_unit_id": 0,
        "label_id": 0,
        "vendor_id": 0,
        "access": 1,
        "name_en-GB": "Product1",
        "alias_en-GB": "",
        "short_description_en-GB": "Тут краткое описание",
        "description_en-GB": "<p>Тут полное описание</p>",
        "meta_title_en-GB": "",
        "meta_description_en-GB": "",
        "meta_keyword_en-GB": "",
        "name_ru-RU": "Product1",
        "alias_ru-RU": "",
        "short_description_ru-RU": "",
        "description_ru-RU": "",
        "meta_title_ru-RU": "",
        "meta_description_ru-RU": "",
        "meta_keyword_ru-RU": "",
        "product_price_default": 0,
        "attribute_submited": [],
        "product_attribute_datas": {
          "attributeValues": [],
          "attributeActive": [],
          "attributeSelected": []
        },
        "attribute_active": [],
        "attribute_active_data": null,
        "product_related": [],
        "name": "Product1",
        "short_description": "Тут краткое описание",
        "description": "<p>Тут полное описание</p>",
        "meta_title": "",
        "meta_keyword": "",
        "meta_description": "",
        "product_tax": 19,
        "product_price_wp": 10,
        "product_price_calculate": 10,
        "product_add_prices": [],
        "product_price_calculate1": 10,
        "product_price_calculate0": 10,
        "delivery_time": "",
        "product_basic_price_unit_qty": 1,
        "product_basic_price_show": 0,
        "manufacturer_info": {
          "manufacturer_logo": "",
          "name": ""
        },
        "vendor_info": null,
        "extra_field": null,
        "freeattributes": null,
        "freeattribrequire": 0,
        "_display_price": 1,
        "hide_delivery_time": 1,
        "button_back_js_click": "history.go(-1);",
        "product_categories": [
          {
            "product_id": 1,
            "category_id": 1,
            "product_ordering": 1
          }
        ]
      },
      "related_prod": [],
      "reviews": [],
      "select_review": [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10
      ],
      "stars_count": 5,
      "text_review": "Please log in to write comments.",
      "video_image_preview_path": "http://testjoom.roool.ru/components/com_jshopping/files/video_products",
      "video_product_path": "http://testjoom.roool.ru/components/com_jshopping/files/video_products",
      "videos": []
    },
    "2": {
      "all_attr_values": [],
      "allow_review": true,
      "attributes": [],
      "available": "",
      "back_value": {
        "pid": null,
        "attr": [],
        "qty": null
      },
      "default_count_product": 1,
      "demofiles": [],
      "display_pagination": false,
      "enable_wishlist": true,
      "hide_buy": false,
      "image_path": "http://testjoom.roool.ru/components/com_jshopping/images",
      "image_product_path": "http://testjoom.roool.ru/components/com_jshopping/files/img_products",
      "images": [
        {
          "image_id": 4,
          "product_id": 2,
          "image_name": "prod2.jpg",
          "name": "",
          "ordering": 1,
          "sort": 0,
          "_title": "Product2",
          "image_thumb": "thumb_prod2.jpg",
          "image_full": "full_prod2.jpg"
        }
      ],
      "noimage": "noimage.gif",
      "parts_count": 2,
      "product": {
        "product_id": 2,
        "parent_id": 0,
        "product_ean": "",
        "manufacturer_code": "",
        "product_quantity": 1,
        "unlimited": 0,
        "product_availability": "",
        "product_date_added": "2022-07-18 12:17:07",
        "date_modify": "2022-07-18 12:17:32",
        "product_publish": 1,
        "product_tax_id": 1,
        "currency_id": 1,
        "product_template": "default",
        "product_url": "",
        "product_old_price": 0,
        "product_buy_price": 0,
        "product_price": 12,
        "min_price": 12,
        "different_prices": 0,
        "product_weight": 0,
        "image": "prod2.jpg",
        "product_manufacturer_id": 0,
        "product_is_add_price": 0,
        "add_price_unit_id": 3,
        "average_rating": 0,
        "reviews_count": 0,
        "delivery_times_id": 0,
        "hits": 93,
        "weight_volume_units": 0,
        "basic_price_unit_id": 0,
        "label_id": 0,
        "vendor_id": 0,
        "access": 1,
        "name_en-GB": "Product2",
        "alias_en-GB": "",
        "short_description_en-GB": "Тут краткое описание",
        "description_en-GB": "<p>Тут полное описание</p>",
        "meta_title_en-GB": "",
        "meta_description_en-GB": "",
        "meta_keyword_en-GB": "",
        "name_ru-RU": "Product1",
        "alias_ru-RU": "",
        "short_description_ru-RU": "",
        "description_ru-RU": "",
        "meta_title_ru-RU": "",
        "meta_description_ru-RU": "",
        "meta_keyword_ru-RU": "",
        "product_price_default": 0,
        "attribute_submited": [],
        "product_attribute_datas": {
          "attributeValues": [],
          "attributeActive": [],
          "attributeSelected": []
        },
        "attribute_active": [],
        "attribute_active_data": null,
        "product_related": [],
        "name": "Product2",
        "short_description": "Тут краткое описание",
        "description": "<p>Тут полное описание</p>",
        "meta_title": "",
        "meta_keyword": "",
        "meta_description": "",
        "product_tax": 19,
        "product_price_wp": 12,
        "product_price_calculate": 12,
        "product_add_prices": [],
        "product_price_calculate1": 12,
        "product_price_calculate0": 12,
        "delivery_time": "",
        "product_basic_price_unit_qty": 1,
        "product_basic_price_show": 0,
        "manufacturer_info": {
          "manufacturer_logo": "",
          "name": ""
        },
        "vendor_info": null,
        "extra_field": null,
        "freeattributes": null,
        "freeattribrequire": 0,
        "_display_price": 1,
        "hide_delivery_time": 1,
        "button_back_js_click": "history.go(-1);",
        "product_categories": [
          {
            "product_id": 2,
            "category_id": 1,
            "product_ordering": 2
          }
        ]
      },
      "related_prod": [],
      "reviews": [],
      "select_review": [
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10
      ],
      "stars_count": 5,
      "text_review": "Please log in to write comments.",
      "video_image_preview_path": "http://testjoom.roool.ru/components/com_jshopping/files/video_products",
      "video_product_path": "http://testjoom.roool.ru/components/com_jshopping/files/video_products",
      "videos": []
    }
  }
}
''';
