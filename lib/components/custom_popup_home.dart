import 'package:erpecommerce/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AlertDialog customDialog(context) {
  var empresa = TextEditingController();
  var nome = TextEditingController();
  var problema = TextEditingController();
  var solucao = TextEditingController();
  return AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Empresa',
            ),
            controller: empresa,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
            controller: nome,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Problema',
            ),
            controller: problema,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Solução',
            ),
            controller: solucao,
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
            //Navigator.pushNamed(context,"/home");
            child: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 60),
          ElevatedButton(
            onPressed: () async {
              var response = await ApiRequest.post(
                endpoint: "api/call/",
                body: {
                  "problem": problema.text,
                  "solution": solucao.text,
                  "name": nome.text,
                  "company": empresa.text,
                },
                context: context,
              );
              if (response.statusCode != 200) {
                Fluttertoast.showToast(msg: "Não foi possivel cadastrar");
                return;
              }
              Navigator.of(context).pop();
              
              Fluttertoast.showToast(msg: "Cadastrado.");
            },
            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ],
      )
    ],
  );
}
