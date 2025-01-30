class Ligacao {
  final String empresa;
  final String nome;
  final String contato;
  final DateTime data;
  final String problema;
  final String solucao;

  Ligacao(
      {required this.empresa,
      required this.nome,
      required this.contato,
      required this.data,
      required this.problema,
      required this.solucao});
}

class Getters {
  List<Ligacao> pegarDados() {
    return [
      Ligacao(
          empresa: "Kalce leve",
          nome: "Carlos",
          contato: "66999256688",
          data: DateTime(2025, 01, 01),
          problema:
              "não abria o sistema, depois  começou a chorar e a reclamer sobre o sistema, e por ultimo pediu um copo d'gua.",
          solucao:
              "troquei a rota, falei que era normal o que ela reclamava e copo d'gua eu falei que não teria como, estou no remoto."),
      Ligacao(
          empresa: "Kalce vest",
          nome: "Jane",
          contato: "66999266648",
          data: DateTime(2024, 12, 30),
          problema: "autorizar nota com erro",
          solucao: "trocado o ncm, nota autorizada"),
      Ligacao(
          empresa: "Katia",
          nome: "Daiana",
          contato: "66989256688",
          data: DateTime(2025, 01, 21),
          problema: "erro no TEF",
          solucao: "Pin pan desconectado."),
      Ligacao(
          empresa: "Ariusa Shoes",
          nome: "Ariusa",
          contato: "66999556688",
          data: DateTime(2025, 01, 25),
          problema: "Ligou somente para atrapalhar",
          solucao: "reclamou e reclamou mas não resolveu nada"),
      Ligacao(
          empresa: "Moda Menor",
          nome: "Marcia",
          contato: "66997256688",
          data: DateTime(2025, 01, 22),
          problema: "erro em uma nf-e",
          solucao: "estava sem certificado digital")
    ];
  }
}
