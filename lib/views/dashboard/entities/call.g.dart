// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      company: json['company'] as String,
      name: json['name'] as String,
      date: DateTime.parse(json['creationDate'] as String),
      problem: json['problem'] as String,
      solution: json['solution'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'company': instance.company,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'problem': instance.problem,
      'solution': instance.solution,
      'id': instance.id,
    };
