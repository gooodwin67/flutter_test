// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRes _$UserResFromJson(Map<String, dynamic> json) => UserRes(
      json['id'] as int,
      json['name'] as String,
      json['userName'] as String,
      json['email'] as String,
      json['address'] as Map<String, dynamic>,
      json['phone'] as String,
      json['website'] as String,
      json['company'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UserResToJson(UserRes instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

AddressRes _$AddressResFromJson(Map<String, dynamic> json) => AddressRes(
      json['street'] as String,
      json['suite'] as String,
      json['city'] as String,
      json['zipcode'] as String,
      json['geo'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AddressResToJson(AddressRes instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

GeoRes _$GeoResFromJson(Map<String, dynamic> json) => GeoRes(
      json['lat'] as String,
      json['lng'] as String,
    );

Map<String, dynamic> _$GeoResToJson(GeoRes instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CompanyRes _$CompanyResFromJson(Map<String, dynamic> json) => CompanyRes(
      json['name'] as String,
      json['catchPhrase'] as String,
      json['bs'] as String,
    );

Map<String, dynamic> _$CompanyResToJson(CompanyRes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
