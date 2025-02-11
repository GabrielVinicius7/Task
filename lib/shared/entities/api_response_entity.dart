import 'package:json_annotation/json_annotation.dart';

part 'api_response_entity.g.dart';

@JsonSerializable()
class ApiResponseEntity {
  final bool success;
  final List<Map<String, dynamic>> data;
  ApiResponseEntity({
    required this.success,
    required this.data,
  });
  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseEntityToJson(this);
}
