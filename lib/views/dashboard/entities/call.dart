import 'package:json_annotation/json_annotation.dart';

part 'call.g.dart'; // Import do arquivo gerado

@JsonSerializable()
class Call {
  final String company;
  final String name;
  final String date;
  final String problem;
  final String solution;

  Call({
    required this.company,
    required this.name,
    required this.date,
    required this.problem,
    required this.solution,
  });

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
  Map<String, dynamic> toJson() => _$CallToJson(this);
}
