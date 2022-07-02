// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_gen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      json['surname'] as String,
      json['age'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
    };
