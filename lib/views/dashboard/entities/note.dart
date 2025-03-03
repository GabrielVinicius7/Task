// arquivo necessário para realização de get na página/funcionalidade notespage

// importa o pacote necessário para a serialização de objetos para JSON e vice-versa.
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

class Teste {
  final String algumaCoisa;
  Teste({required this.algumaCoisa});
}

@JsonSerializable()
class Call {
  final String title;
  final String company;
  final DateTime date;
  final String contact;
  final String situation;
  final int id;

  Call({
    required this.title,
    required this.company,
    required this.date,
    required this.contact,
    required this.situation,
    required this.id,
  });

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

  Map<String, dynamic> toJson() => _$CallToJson(this);
}
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