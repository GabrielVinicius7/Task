// GENERATED CODE - DO NOT MODIFY BY HAND
// Este arquivo é gerado automaticamente pelo pacote json_serializable. Não modifique manualmente.

part of 'note.dart';
// Indica que este arquivo faz parte do arquivo 'note.dart'.

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
// Esta seção indica que o código abaixo foi gerado pelo JsonSerializableGenerator.

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      // Função que converte um Map<String, dynamic> (JSON) em uma instância da classe Call.
      title: json['title'] as String,
      // Atribui o valor da chave 'title' do JSON à propriedade 'title' da classe Call.
      company: json['company'] as String,
      // Atribui o valor da chave 'company' do JSON à propriedade 'company' da classe Call.
      date: DateTime.parse(json['creationDate'] as String),
      contact: json['contact'] as String,
      // Atribui o valor da chave 'contact' do JSON à propriedade 'contact' da classe Call.
      situation: json['situation'] as String,
      // Atribui o valor da chave 'situation' do JSON à propriedade 'situation' da classe Call.
      id: (json['id'] as num).toInt(),
      // Atribui o valor da chave 'id' do JSON à propriedade 'id' da classe Call, convertendo-o para int.
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      // Função que converte uma instância da classe Call em um Map<String, dynamic> (JSON).
      'title': instance.title,
      // Adiciona a propriedade 'title' da instância Call ao JSON com a chave 'title'.
      'company': instance.company,
      // Adiciona a propriedade 'company' da instância Call ao JSON com a chave 'company'.
      'date': instance.date.toIso8601String(),
      'contact': instance.contact,
      // Adiciona a propriedade 'contact' da instância Call ao JSON com a chave 'contact'.
      'situation': instance.situation,
      // Adiciona a propriedade 'situation' da instância Call ao JSON com a chave 'situation'.
      'id': instance.id,
      // Adiciona a propriedade 'id' da instância Call ao JSON com a chave 'id'.
    };
