// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseEntity _$ApiResponseEntityFromJson(Map<String, dynamic> json) =>
    ApiResponseEntity(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ApiResponseEntityToJson(ApiResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
