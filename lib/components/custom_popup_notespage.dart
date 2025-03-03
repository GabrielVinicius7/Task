import 'package:erpecommerce/shared/http_service.dart';
import 'package:erpecommerce/views/dashboard/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialogNotes extends StatelessWidget {
  final Call?
      call; // Variável que pode conter um chamado já existente ou ser nula (novo chamado)

  const CustomDialogNotes({super.key, this.call});

  @override
  Widget build(BuildContext context) {
    var titulo = TextEditingController();
    var empresa = TextEditingController();
    var contato = TextEditingController();
    var situacao = TextEditingController();

    // Preenche os controladores se um objeto Call for fornecido
    if (call != null) {
      titulo.text = call!.title;
      empresa.text = call!.company;
      contato.text = call!.contact;
      situacao.text = call!.situation;
    }

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
              controller: titulo,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Empresa',
              ),
              controller: empresa,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Contato',
              ),
              controller: contato,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Situação',
              ),
              controller: situacao,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 60),
            ElevatedButton(
              onPressed: () async {
                var callBody = {
                  "title": titulo.text,
                  "company": empresa.text,
                  "contact": contato.text,
                  "situation": situacao.text,
                };

                var response = await ApiRequest.post(
                  endpoint: "api/note",
                  body: callBody,
                  context: context,
                );

                print("Status Code: ${response.statusCode}");
                print(response.body);
                if (response.statusCode == 200) {
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(msg: "Cadastrado");
                  return;
                }

                Fluttertoast.showToast(msg: "Não foi possível cadastrar");
              },
              child: const Icon(
                Icons.check,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
