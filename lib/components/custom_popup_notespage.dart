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
              maxLength: 15, // Define o limite de caracteres
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
              onPressed: () async {
                if (call != null) {
                  var response = await ApiRequest.delete(
                    endpoint: "api/note/${call!.id}",
                    context: context,
                  );

                  if (response.statusCode == 200) {
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(msg: "Deletado com sucesso");
                  } else {
                    Fluttertoast.showToast(msg: "Erro ao deletar");
                  }
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Icon(
                call == null ? Icons.close : Icons.delete,
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
                var response = call == null
                    // ignore: use_build_context_synchronously
                    ? await ApiRequest.post(
                        endpoint: "api/note",
                        body: callBody,
                        context: context,
                      )
                    // ignore: use_build_context_synchronously
                    : await ApiRequest.put(
                        endpoint: "api/note/${call!.id}",
                        body: callBody,
                        context: context,
                      );
                if (response.statusCode == 200 || response.statusCode == 201) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(
                      msg: call == null ? "Cadastrado" : "Atualizado");
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
