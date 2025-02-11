import 'package:erpecommerce/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    var role = "ADMIN";
    var password1 = TextEditingController();
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
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      controller: username,
                    ),
                    const SizedBox(height: 30.0),
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
                      decoration:const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                      ),
                      obscureText: true,
                      controller: password1,
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Repeat the Password',
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
                            endpoint: "auth/register",
                            body: {
                              "email": email.text,
                              "username": username.text,
                              "password": password.text,
                              "role": role,
                            });
                        if (response.statusCode != 201) {
                          Fluttertoast.showToast(
                              msg: "Não foi possivel cadastrar");
                          return;
                        }
                        email.clear();
                        username.clear();
                        password.clear();
                        password1.clear();
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
          )),
        ));
  }
}
