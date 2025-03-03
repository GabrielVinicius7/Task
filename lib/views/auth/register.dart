import 'package:erpecommerce/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    // Controladores para capturar os valores digitados nos campos de texto
    var username = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    var role = "ADMIN"; // Definindo o papel do usuário como "ADMIN"
    var password1 = TextEditingController(); // Para a confirmação da senha

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título da tela
              Title(
                color: Colors.black,
                child: const Text('Suporte',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                  width: 350,
                  height: 600,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    const SizedBox(height: 40.0),
                    // Campo de entrada para o nome de usuário
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      controller: username,
                    ),
                    const SizedBox(height: 30.0),
                    // Campo de entrada para o email
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      controller: email,
                    ),
                    const SizedBox(height: 30.0),
                    // Campo de entrada para a senha
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                      ),
                      obscureText: true, // Oculta o texto da senha
                      controller: password1,
                    ),
                    const SizedBox(height: 30.0),
                    // Campo de entrada para repetir a senha
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Repeat the Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                      ),
                      obscureText: true, // Oculta o texto da senha
                      controller: password,
                    ),
                    const SizedBox(height: 30),
                    // Botão para realizar o cadastro
                    TextButton(
                      onPressed: () async {
                        // Faz a requisição para a API de cadastro
                        var response = await ApiRequest.post(
                            endpoint: "auth/register",
                            body: {
                              "email": email.text, // Captura o email digitado
                              "username": username.text, // Captura o nome de usuário
                              "password": password.text, // Captura a senha digitada
                              "role": role, // Envia o papel do usuário (ADMIN)
                            });

                        // Verifica se a resposta da API não foi bem-sucedida (código diferente de 201)
                        if (response.statusCode != 201) {
                          Fluttertoast.showToast(
                              msg: "Não foi possível cadastrar");
                          return;
                        }

                        // Limpa os campos de entrada após o sucesso
                        email.clear();
                        username.clear();
                        password.clear();
                        password1.clear();

                        // Exibe um aviso informando que a conta foi cadastrada com sucesso
                        Fluttertoast.showToast(
                            msg: "Conta cadastrada com sucesso");
                      },

                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize: MaterialStatePropertyAll(Size(600, 60))),
                      child: const Text('Register',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(height: 20),
                  ])),
            ],
          ))),
        );
  }
}
