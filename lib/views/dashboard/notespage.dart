import 'package:erpecommerce/components/custom_popup_notespage.dart';
import 'package:erpecommerce/components/custom_popup_view_notespage.dart';
import 'package:erpecommerce/shared/mock_notespage.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Lembre getters = Lembre();
    List<Lembrete> lembretes = getters.pegarlembre();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Anotações',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 50)
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: lembretes.length,
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
                        context: context,
                        builder: (_) => customPopUp(context, index));
                  },
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                lembretes[index].titulo,
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
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          SizedBox(
                            width: 150,
                            child: Text(
                              lembretes[index].situacao,
                              style: const TextStyle(
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    lembretes[index].empresa,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )),
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                    lembretes[index].contato,
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
