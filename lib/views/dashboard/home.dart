import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup_home.dart';
import 'package:erpecommerce/components/custom_popup_view_home.dart';
import 'package:flutter/material.dart';
import 'package:erpecommerce/shared/mock_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Getters getters = Getters();
    List<Ligacao> ligacoes = getters.pegarDados();

    return Scaffold(
      drawer: customdrawer(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Row(
          children: [
            SizedBox(width: 25),
            Text(
              'Historico de Ligações',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: ligacoes.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 197, 189, 189),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector( 
                  onTap: () {
                    showDialog(
                        context: context, builder: (_) => customPopUp(context, index));
                  },
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                "${ligacoes[index].empresa}  /  ${ligacoes[index].nome}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                ligacoes[index].contato,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                "Data",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Hora",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  ligacoes[index].problema,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    ligacoes[index].solucao,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(width: 90),
                          const SizedBox(height: 25),
                          Positioned(
                            bottom: 25,
                            right: 25,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(0, 0, 0, 0),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => customDialog(context));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => customDialog(context),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
