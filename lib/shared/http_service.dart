import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static const String host = "http://192.168.3.37:8080/";
  static String _token = "";

  static void setToken(String newToke) {
    _token = newToke;
  }

  static Future<http.Response> get({required String endpoint}) async {
    return await http.get(Uri.parse("$host$endpoint"), headers: {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    });
  }

  static Future<http.Response> post(
      {required endpoint, required dynamic body, BuildContext? context}) async {
    var httpUrl = Uri.parse(host + endpoint);
    var response = await http.post(
      httpUrl,
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
    if (context != null) {
      if (response.statusCode == 403 || response.statusCode == 401)
        Navigator.pushNamed(context, "/login");
      return response;
    }
    return response;
  }
}
