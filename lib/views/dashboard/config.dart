import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup_config.dart';
import 'package:flutter/material.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customdrawer(context),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Gabriel",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            "Email:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Teste@gmail.com",
                            style: TextStyle(
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
                              builder: (_) => customDialog(context),
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
