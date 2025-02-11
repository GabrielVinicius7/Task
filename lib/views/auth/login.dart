import 'dart:convert';

import 'package:erpecommerce/shared/http_service.dart';
import 'package:erpecommerce/views/auth/login_token.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    var role = "ADMIN";
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title(
                  color: Colors.black,
                  child: const Text('Suporte',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 60.0),
                Container(
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(0, 227, 227, 227),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      const SizedBox(height: 70.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: email,
                      ),
                      const SizedBox(height: 30.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password),
                        ),
                        obscureText: true,
                        controller: password,
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () async {
                          var response = await ApiRequest.post(
                              endpoint: "auth/login",
                              body: {
                                "email": email.text,
                                "password": password.text,
                                "role": role,
                              });
                          if (response.statusCode != 200) {
                            Fluttertoast.showToast(
                                msg: "Não foi possível entrar na conta");
                            return;
                          }
                          var tokenHandler =
                              LoginToken.fromJson(jsonDecode(response.body));
                          ApiRequest.setToken(tokenHandler.token);
                          Fluttertoast.showToast(msg: "login realizado");
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                            minimumSize:
                                MaterialStatePropertyAll(Size(600, 60))),
                        child: const Text('Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 34, 75, 152)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(600, 60))),
                        child: const Text('Registrar-se',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ])),
              ],
            ),
          ),
        ));
  }
}
