import 'package:task/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var senhaNova = TextEditingController();

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nova Senha',
              ),
              controller: senhaNova,
              obscureText: true, // Esconde a senha digitada
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
                try {
                  var response = await ApiRequest.post(
                    endpoint: "auth/password",
                    body: {"password": senhaNova.text},
                  );

                  if (response.statusCode != 202) {
                    Fluttertoast.showToast(
                        msg: "Não foi possível alterar a senha");
                    return;
                  }
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(msg: "Senha alterada com sucesso");
                } catch (e) {
                  print("Erro: $e");
                  Fluttertoast.showToast(msg: "Erro ao tentar alterar a senha");
                }
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
}
