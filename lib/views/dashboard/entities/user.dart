// Importa o pacote necessário para a serialização de objetos para JSON e vice-versa.
import 'package:json_annotation/json_annotation.dart';

// Este arquivo gerado automaticamente define funções para converter o modelo Call de e para JSON.
// 'user.g.dart' é o arquivo gerado pelo comando 'build_runner'.
part 'user.g.dart'; // Import do arquivo gerado

// A anotação '@JsonSerializable()' indica que esta classe será convertida automaticamente de/para JSON.
@JsonSerializable()
class Call {
  // Propriedades da classe que representam os dados de uma "chamada".
  final String name; // Nome da pessoa associada à chamada
  final String email; // Email da pessoa associada à chamada
  final int id; // Identificador único da chamada

  // Construtor da classe. 'required' indica que essas propriedades são obrigatórias ao criar um objeto Call.
  Call(
      {required this.name,
      required this.email,
      required this.id});

  // '_$CallFromJson' é uma função gerada automaticamente que converte um JSON em um objeto Call.
  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

  // 'toJson' é uma função gerada automaticamente que converte um objeto Call em um JSON.
  Map<String, dynamic> toJson() => _$CallToJson(this);
}