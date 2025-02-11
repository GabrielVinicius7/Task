// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      company: json['company']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      date: json['creationDate']?.toString() ?? '',
      problem: json['problem']?.toString() ?? '',
      solution: json['solution']?.toString() ?? '',
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'company': instance.company,
      'name': instance.name,
      'date': instance.date,
      'problem': instance.problem,
      'solution': instance.solution,
    };
