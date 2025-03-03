import 'package:json_annotation/json_annotation.dart'; // Importação para suporte à serialização JSON

part 'login_token.g.dart'; // Geração automática do código para serialização/deserialização

// Indica que a classe pode ser convertida para JSON e vice-versa
@JsonSerializable()
class LoginToken {
  
  final String token; // Campo para armazenar o token de autenticação

  // Construtor obrigatório, garantindo que o token seja informado
  LoginToken({required this.token});

  // Método de fábrica para criar uma instância de LoginToken a partir de um JSON
  factory LoginToken.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenFromJson(json);

  // Método para converter uma instância da classe em um mapa JSON
  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);
}
