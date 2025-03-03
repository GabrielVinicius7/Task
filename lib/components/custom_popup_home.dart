import 'package:erpecommerce/shared/http_service.dart'; // Importa a classe responsável por fazer requisições HTTP
import 'package:erpecommerce/views/dashboard/entities/call.dart'; // Importa a entidade Call, que representa um chamado
import 'package:flutter/material.dart'; // Importa os componentes visuais do Flutter
import 'package:fluttertoast/fluttertoast.dart'; // Importa a biblioteca para exibir notificações do tipo Toast

// CustomDialog é um modal (caixa de diálogo) que permite cadastrar ou editar um chamado (Call).
class CustomDialog extends StatelessWidget {
  final Call? call; // Variável que pode conter um chamado já existente ou ser nula (novo chamado)

  // Construtor da classe. Recebe um contexto (que representa a tela atual) e, opcionalmente, um chamado existente.
  const CustomDialog(BuildContext context, {super.key, this.call});
  @override
  Widget build(BuildContext context) {
    // Controladores para capturar os dados digitados nos campos de texto.
    var empresa = TextEditingController();
    var nome = TextEditingController();
    var problema = TextEditingController();
    var solucao = TextEditingController();


    // Se um chamado já existir, preenche os campos com os dados dele.
    empresa.text =
        call?.company ?? ""; // Se call for nulo, mantém o campo vazio.
    nome.text = call?.name ?? "";
    problema.text = call?.problem ??
        ""; // Provavelmente um erro aqui: deveria ser call?.problem
    solucao.text = call?.problem ??
        ""; // Provavelmente um erro aqui: deveria ser call?.solution

    return AlertDialog(
      // Exibe um popup na tela.
      content: SingleChildScrollView(
        // Permite rolar o conteúdo caso haja muitos campos.
        child: Column(
          children: [
            // Campo de texto para Empresa
            TextField(
              decoration: const InputDecoration(
                labelText: 'Empresa',
              ),
              controller: empresa, // Liga o campo ao controlador empresa
            ),
            // Campo de texto para Nome
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              controller: nome,
            ),
            // Campo de texto para Problema
            TextField(
              decoration: const InputDecoration(
                labelText: 'Problema',
              ),
              controller: problema,
            ),
            // Campo de texto para Solução
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
        // Botões de ação
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão para cancelar e fechar a janela.
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o popup
              },
              child: Icon(
                call == null ? Icons.close : Icons.delete,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 60), // Espaçamento entre os botões
            // Botão para salvar os dados
            ElevatedButton(
              onPressed: () async {
                var callBody = {
                  "problem": problema.text, // Envia o problema digitado
                  "solution": solucao.text, // Envia a solução digitada
                  "name": nome.text, // Envia o nome digitado
                  "company": empresa.text, // Envia a empresa digitada
                };
                //Checa se a call existe, e caso não exista, faz um Post(cria), caso exista, faz um Put(update)
                if (call == null) {
                  var response = await ApiRequest.post(
                      endpoint: "api/call", body: callBody, context: context);
                  if (response.statusCode == 201) {
                    Navigator.of(context).pop(); // Fecha o popup após sucesso

                    Fluttertoast.showToast(
                        msg: "Cadastrado."); // Mostra um aviso de sucesso
                    return;
                  }
                  Fluttertoast.showToast(
                      msg: "Não foi possivel cadastrar"); // Mostra um aviso
                } else {
                  var response = await ApiRequest.put(
                      endpoint: "api/call/${call!.id}",
                      body: callBody,
                      context: context);
                  if (response.statusCode == 200) {
                    Navigator.of(context).pop(); // Fecha o popup após sucesso

                    Fluttertoast.showToast(
                        msg: "Alterado."); // Mostra um aviso de sucesso
                    return;
                  }
                  Fluttertoast.showToast(
                      msg: "Não foi possivel cadastrar"); // Mostra um aviso
                }
                // Faz uma requisição POST ou PUT (edição) para a API
              },
              child: const Icon(
                Icons.check, // Ícone de "✓"
                color: Colors.green,
              ),
            ),
          ],
        )
      ],
    );
  }
}
