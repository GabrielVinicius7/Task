// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      title: json['title'] as String,
      company: json['company'] as String,
      date: DateTime.parse(json['creationDate'] as String),
      contact: json['contact'] as String,
      situation: json['situation'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'date': instance.date.toIso8601String(),
      'contact': instance.contact,
      'situation': instance.situation,
      'id': instance.id,
    };
