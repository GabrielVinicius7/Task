import 'package:json_annotation/json_annotation.dart';

part 'login_token.g.dart';

@JsonSerializable()
class LoginToken {
  
  final String token;


  LoginToken({required this.token});
  factory LoginToken.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenFromJson(json);
  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);
}
