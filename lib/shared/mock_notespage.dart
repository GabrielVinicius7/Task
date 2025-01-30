class Lembrete {
  final String titulo;
  final String empresa;
  final String contato;
  final DateTime data;
  final String situacao;

  Lembrete({
    required this.titulo,
    required this.empresa,
    required this.contato,
    required this.data,
    required this.situacao,
  });
}

class Lembre {
  List<Lembrete> pegarlembre() {
    return [
      Lembrete(
          titulo: 'Troca de servidor',
          empresa: 'Inove',
          contato: '66999859687',
          data: DateTime(2025, 01, 25),
          situacao:
              'Ficou marcada a troca do servidor para esse dia, a dona da inove entrará em contato.'),
      Lembrete(
        titulo: 'Atualização de Sistema',
        empresa: 'TechSoft',
        contato: '11987654321',
        data: DateTime(2025, 02, 10),
        situacao: 'A equipe técnica realizará a atualização do sistema ERP.',
      ),
      Lembrete(
        titulo: 'Revisão de Contrato',
        empresa: 'Alpha Solutions',
        contato: '21998765432',
        data: DateTime(2025, 03, 05),
        situacao:
            'O contrato de suporte precisa ser revisado antes do vencimento.',
      ),
      Lembrete(
        titulo: 'Treinamento de Equipe',
        empresa: 'Beta Informática',
        contato: '31991234567',
        data: DateTime(2025, 04, 15),
        situacao:
            'Treinamento agendado para os funcionários sobre novas ferramentas.',
      ),
      Lembrete(
        titulo: 'Instalação de Servidor',
        empresa: 'Gamma Tech',
        contato: '41992345678',
        data: DateTime(2025, 05, 20),
        situacao:
            'Instalação e configuração do novo servidor na sede da empresa.',
      ),
    ];
  }
}
