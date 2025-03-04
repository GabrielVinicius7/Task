// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      name: json['name'] as String,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
    };
