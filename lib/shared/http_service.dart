import 'dart:convert'; // Importação para codificação e decodificação JSON
import 'package:flutter/material.dart'; // Importação do Flutter para UI
import 'package:http/http.dart'
    as http; // Importação do pacote HTTP para fazer requisições

// Classe responsável por gerenciar requisições HTTP na aplicação
class ApiRequest {
  static const String host = "http://10.0.0.4:8080/"; // URL base da API
  static String _token =
      ""; // Armazena o token de autenticação para requisições

  // Método para definir um novo token de autenticação
  static void setToken(String newToken) {
    _token = newToken;
  }

  // Método para obter o token de autenticação atual
  static String get token => _token;

  // Método para realizar uma requisição GET a um endpoint específico
  static Future<http.Response> get({required String endpoint}) async {
    return await http.get(Uri.parse("$host$endpoint"), headers: {
      'Authorization':
          'Bearer $_token', // Inclui o token no cabeçalho para autenticação
      'Content-Type': 'application/json', // Define o tipo de conteúdo como JSON
    });
  }

  static Future<http.Response> put(
      {required String endpoint,
      required dynamic body,
      BuildContext? context}) async {
    var httpUrl = Uri.parse(host + endpoint);
    var response = await http.put(httpUrl,
        headers: {
          'Authorization': 'Bearer $_token', // Autenticação com o token
          'Content-Type':
              'application/json', // Define o tipo de conteúdo como JSON
        },
        body: jsonEncode(body));
    if (context != null) {
      if (response.statusCode == 403 || response.statusCode == 401) {
        Navigator.pushNamed(
            context, "/login"); // Redireciona o usuário para a tela de login
      }
      return response;
    }

    return response; // Retorna a resposta HTTP
  }

  // Método para realizar uma requisição POST com um corpo JSON
  static Future<http.Response> post(
      {required String endpoint,
      required dynamic body,
      BuildContext? context}) async {
    var httpUrl =
        Uri.parse(host + endpoint); // Cria a URL completa da requisição

    var response = await http.post(
      httpUrl,
      headers: {
        'Authorization': 'Bearer $_token', // Autenticação com o token
        'Content-Type':
            'application/json', // Define o tipo de conteúdo como JSON
      },
      body: jsonEncode(body), // Converte o corpo da requisição para JSON
    );

    // Se um contexto for fornecido e a resposta indicar erro de autenticação, redireciona para a tela de login
    if (context != null) {
      if (response.statusCode == 403 || response.statusCode == 401) {
        Navigator.pushNamed(
            context, "/login"); // Redireciona o usuário para a tela de login
      }
      return response;
    }
    return response; // Retorna a resposta HTTP
  }

  // Método para realizar uma requisição DELETE
  static Future<http.Response> delete(
      {required String endpoint, BuildContext? context}) async {
    var httpUrl =
        Uri.parse(host + endpoint); // Cria a URL completa da requisição

    var response = await http.delete(
      httpUrl,
      headers: {
        'Authorization': 'Bearer $_token', // Autenticação com o token
        'Content-Type':
            'application/json', // Define o tipo de conteúdo como JSON
      },
    );

    // Se um contexto for fornecido e a resposta indicar erro de autenticação, redireciona para a tela de login
    if (context != null) {
      if (response.statusCode == 403 || response.statusCode == 401) {
        Navigator.pushNamed(
            context, "/login"); // Redireciona o usuário para a tela de login
      }
      return response;
    }
    return response; // Retorna a resposta HTTP
  }
}
