import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Celta',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 60.0),
                Container(
                    height: 500,
                    width: 350,
                    decoration:BoxDecoration(
                      color:const Color.fromARGB(0, 227, 227, 227),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      const SizedBox(height: 70.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/home");
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
