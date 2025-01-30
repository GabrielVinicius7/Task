import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static String _token = "";

  static void setToken(String newToke) {
    _token = newToke;
  }

  static Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    });
  }

  static Future<http.Response> post(String url, dynamic body) async {
    return await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }
}
