import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customdrawer(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Row(
          children: [
            SizedBox(width: 25),
            Text(
              'Historico de Ligações',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      // Usamos Stack para posicionar o botão sobre o conteúdo
      body: Stack(
        children: [
          // Conteúdo principal
          Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      )),
                      child: const Text('atendido'),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
          // Botão flutuante no canto inferior
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle, // Faz o container circular
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white, // Cor do ícone
                ),
                onPressed: () {
                  showDialog(
                      context: context, builder: (_) => CustomDialog(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
