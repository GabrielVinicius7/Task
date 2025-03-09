import 'dart:convert';
import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup_config_newpass.dart';
import 'package:erpecommerce/shared/http_service.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  String email = "";
  String nome = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
       var response = await ApiRequest.get(endpoint: "api/user"); // Faz requisição GET para obter os dados
      
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          email = data['email'];
          nome = data['username'];
          isLoading = false;
        });
      } else {
        // Trate o erro aqui
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Trate o erro aqui
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context,context: context),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Row(
          children: [
            SizedBox(width: 50),
            Text(
              'Configurações',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                const Text(
                                  "Email:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  email,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const SizedBox(width: 20),
                                const Text(
                                  "Senha:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "*************",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                GestureDetector(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (_) => const CustomDialog(),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 14, // Define o tamanho do botão
                                    backgroundColor:
                                        Colors.black, // Cor de fundo do botão
                                    child: Icon(
                                      Icons.edit, // Ícone do botão
                                      color: Colors.white, // Cor do ícone
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
