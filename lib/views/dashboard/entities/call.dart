// Importa o pacote necessário para a serialização de objetos para JSON e vice-versa.
import 'package:json_annotation/json_annotation.dart';

// Este arquivo gerado automaticamente define funções para converter o modelo Call de e para JSON.
// 'call.g.dart' é o arquivo gerado pelo comando 'build_runner'.
part 'call.g.dart'; // Import do arquivo gerado

// A anotação '@JsonSerializable()' indica que esta classe será convertida automaticamente de/para JSON.
@JsonSerializable()
class Call {
  // Propriedades da classe que representam os dados de uma "chamada".
  final String company; // Nome da empresa
  final String name; // Nome da pessoa associada à chamada
  final DateTime date; // Data da chamada
  final String problem; // Descrição do problema relatado
  final String solution; // Descrição da solução dada
  final int id; // Identificador único da chamada

  // Construtor da classe. 'required' indica que essas propriedades são obrigatórias ao criar um objeto Call.
  Call(
      {required this.company,
      required this.name,
      required this.date,
      required this.problem,
      required this.solution,
      required this.id});

  // '_$CallFromJson' é uma função gerada automaticamente que converte um JSON em um objeto Call.
  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

  // 'toJson' é uma função gerada automaticamente que converte um objeto Call em um JSON.
  Map<String, dynamic> toJson() => _$CallToJson(this);
}

// 'extension' permite adicionar novos métodos a classes existentes sem modificar a classe original.
// A extensão 'ShowDateFormatted' adiciona um método à classe DateTime.
extension ShowDateFormatted on DateTime {
  // Método para formatar a data no formato "DD/MM/YYYY".
  String showDateFormatted() {
    // Adiciona zero à esquerda do dia e mês caso sejam menores que 10.
    var formattedDay = day < 10 ? "0$day" : day;
    var formattedMonth = month < 10 ? "0$month" : month;
    // Retorna a data formatada como uma string.
    return "$formattedDay/$formattedMonth/$year";
  }
}
